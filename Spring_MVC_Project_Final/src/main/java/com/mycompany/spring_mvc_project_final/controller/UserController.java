/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomTypeEntity;
import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import com.mycompany.spring_mvc_project_final.enums.Gender;
import com.mycompany.spring_mvc_project_final.enums.PaymentMethod;
import com.mycompany.spring_mvc_project_final.enums.PaymentStatus;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.CreditCardService;
import com.mycompany.spring_mvc_project_final.service.EmailService;
import com.mycompany.spring_mvc_project_final.service.ImageService;
import com.mycompany.spring_mvc_project_final.service.PaymentService;
import com.mycompany.spring_mvc_project_final.service.RoomService;
import com.mycompany.spring_mvc_project_final.service.RoomTypeService;
import com.mycompany.spring_mvc_project_final.service.UserService;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {

    static String emailToRecipient, emailSubject, emailMessage;

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private CreditCardService creditCardService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private JavaMailSender mailSenderObj;

    @Autowired
    private ImageService imageService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private UserService userService;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor ste = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, ste);
    }

    public String user() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        return username;
    }

    @RequestMapping("/home")
    public String viewHome(Model model) {

        model.addAttribute("listRoomTypes", roomTypeService.getListRoomTypes());
        model.addAttribute("username", user());
        return "user/home";
    }

    @RequestMapping("/roomlist/{id}")
    public String roomList(Model model,
            @PathVariable("id") int id) {

        List<RoomTypeEntity> roomTypes = roomTypeService.getListRoomTypes();
        RoomTypeEntity roomtype = roomTypeService.findRoomTypeGetImagesById(id); // get images fetch lazy

        model.addAttribute("username", user());
        model.addAttribute("listRoomTypes", roomTypes);
        model.addAttribute("roomtype", roomtype);
        return "user/roomtype_list";
    }

    @RequestMapping("/searchroom")
    public String bookNow(Model model) {

        model.addAttribute("username", user());
        model.addAttribute("listRoomTypes", roomTypeService.getListRoomTypes());
        return "user/searchroom";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchRoom(Model model, HttpSession session,
            HttpServletRequest request,
            @RequestParam("checkin") Date sDate,
            @RequestParam("checkout") Date eDate) throws ParseException {

        List<RoomEntity> rooms = roomService.searchRoom(sDate, eDate);

        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

        String sDateee = format.format(sDate);
        String eDateee = format.format(eDate);

        session.setAttribute("sDate", sDate);
        session.setAttribute("eDate", eDate);
        session.setAttribute("sDateee", sDateee);
        session.setAttribute("eDateee", eDateee);
        model.addAttribute("username", user());
        model.addAttribute("listRoomTypes", roomTypeService.getListRoomTypes());
        model.addAttribute("listRoom", rooms);
        return "user/room_list";

    }

    @RequestMapping("/detailroom/{id}")
    public String detailRoom(Model model, HttpSession session,
            @PathVariable("id") int id) {

        HashMap<Integer, BookingDetailEntity> cart
                = (HashMap<Integer, BookingDetailEntity>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        RoomEntity room = roomService.findById(id);
        if (room != null) {
            BookingDetailEntity item = new BookingDetailEntity();
            item.setRoom(room);
            cart.put(id, item);
        }

        session.setAttribute("quantity", getQuantity(cart));
        session.setAttribute("totalprice", getTotalPrice(cart));
        session.setAttribute("cart", cart);
        model.addAttribute("username", user());
        model.addAttribute("listRoomTypes", roomTypeService.getListRoomTypes());
        return "user/room_detail";
    }

    @RequestMapping("/remove/{id}")
    public String roomDelete(Model model, HttpSession session,
            @PathVariable("id") int id) {
        HashMap<Integer, BookingDetailEntity> cart
                = (HashMap<Integer, BookingDetailEntity>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }
        if (cart.containsKey(id)) {
            cart.remove(id);
        }

        session.setAttribute("cart", cart);
        session.setAttribute("quantity", getQuantity(cart));
        session.setAttribute("totalprice", getTotalPrice(cart));
        model.addAttribute("listRoomTypes", roomTypeService.getListRoomTypes());
        model.addAttribute("images", imageService.getListImages());
        model.addAttribute("username", user());
        return "user/room_detail";
    }

    @RequestMapping("/booking")
    public String booking(Model model, HttpSession session) {

        HashMap<Integer, BookingDetailEntity> cart
                = (HashMap<Integer, BookingDetailEntity>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        UserEntity user = userService.getUserByEmail(user());
        session.setAttribute("quantity", getQuantity(cart));
        session.setAttribute("totalprice", getTotalPrice(cart));
        model.addAttribute("listRoomTypes", roomTypeService.getListRoomTypes());
        model.addAttribute("listRoom", roomService.getListRoom());
        model.addAttribute("gender", Gender.values());
        model.addAttribute("username", user());
        model.addAttribute("user", user);

        return "user/booking";
    }

    @RequestMapping(value = "/saveBooking", method = RequestMethod.POST)
    public String saveBooking(Model model, HttpSession session, @Valid
            @ModelAttribute("booking") BookingEntity booking,
            BindingResult result) throws ParseException {

        Date sDate = (Date) session.getAttribute("sDate");
        Date eDate = (Date) session.getAttribute("eDate");

        if (result.hasErrors()) {
            model.addAttribute("booking", booking);
            model.addAttribute("listRoomTypes", roomTypeService.getListRoomTypes());
            model.addAttribute("gender", Gender.values());
            model.addAttribute("username", user());
            return "user/booking";
        } else {
            HashMap<Integer, BookingDetailEntity> cart
                    = (HashMap<Integer, BookingDetailEntity>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
            }

            booking.setBookingDate(new Date());
            booking.setCheckin(sDate);
            booking.setCheckout(eDate);
            booking.setTotalPrice(getTotalPrice(cart));
            session.setAttribute("booking", booking);
            session.setAttribute("cart", cart);
        }
        return "redirect:/user/payment";
    }

    public double getTotalPrice(HashMap<Integer, BookingDetailEntity> cart) {
        double total = 0;
        for (Map.Entry<Integer, BookingDetailEntity> list : cart.entrySet()) {
            total += list.getValue().getRoom().getRoomType().getPrice();
        }
        return total;
    }

    public int getQuantity(HashMap<Integer, BookingDetailEntity> cart) {
        int count = 0;
        for (Map.Entry<Integer, BookingDetailEntity> list : cart.entrySet()) {
            count++;
        }
        return count;
    }

    @RequestMapping("/payment")
    public String payment(HttpSession session, Model model,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "message", required = false) String message) {

        HashMap<Integer, BookingDetailEntity> cart
                = (HashMap<Integer, BookingDetailEntity>) session.getAttribute("cart");

        model.addAttribute("type", type);
        model.addAttribute("message", message);
        session.setAttribute("cart", cart);
        session.setAttribute("totalprice", getTotalPrice(cart));
        model.addAttribute("username", user());
        model.addAttribute("listRoomTypes", roomTypeService.getListRoomTypes());

        return "user/payment";
    }

    @RequestMapping(value = "/savePayment", method = RequestMethod.POST)
    @Transactional(rollbackFor = Exception.class)
    public String savePayment(Model model,
            @ModelAttribute("creditcard") CreditCardEntity creditcard,
            @RequestParam("expiry") String expiry, HttpSession session,
            HttpServletRequest request) throws ParseException, MessagingException, UnsupportedEncodingException {
        try {
            HashMap<Integer, BookingDetailEntity> cart
                    = (HashMap<Integer, BookingDetailEntity>) session.getAttribute("cart");
            BookingEntity booking = (BookingEntity) session.getAttribute("booking");

            CreditCardEntity card = creditCardService.findByNumberGetCreditCard(creditcard.getNumber());

            if (card == null) {
                model.addAttribute("card", new CreditCardEntity());
                return "redirect:/user/payment?type=error&message=CreditCard not exists !!!";
            } else {
                DateFormat df = new SimpleDateFormat("yyyy-MM");
                String expiryFormat = df.format(card.getExpDate());
                if (card.getCcvCode() != creditcard.getCcvCode()
                        || !card.getName().equals(creditcard.getName())
                        || !expiryFormat.equals(expiry)) {
                    model.addAttribute("card", new CreditCardEntity());
                    return "redirect:/user/payment?type=error&message=Wrong CreditCard information !!!";
                } else {
                    Date expiryy = df.parse(expiry);
                    boolean expired = expiryy.before(new Date()); // ngay het han truoc ngay hien tai
                    if (expired == true) {
                        model.addAttribute("card", new CreditCardEntity());
                        return "redirect:/user/payment?type=error&message=card has expired !!!";
                    } else if (card.getBalance() < getTotalPrice(cart)) {
                        model.addAttribute("card", new CreditCardEntity());
                        return "redirect:/user/payment?type=error&message=not enough balance !!!";
                    } else {

                        UserEntity user = userService.getUserByEmail(user());
                        booking.setStatus(BookingStatus.BOOKED);
                        String uuid = UUID.randomUUID().toString();
                        String bookingNumber = uuid.replace("-", "").substring(0, 8);
                        booking.setBookingNumber(bookingNumber);
                        if (user != null) {
                            booking.setUser(user);
                        }
                        bookingService.saveBooking(booking);
                        for (Map.Entry<Integer, BookingDetailEntity> entry : cart.entrySet()) {
                            BookingDetailEntity bookingDetail = new BookingDetailEntity();
                            bookingDetail.setBooking(booking);
                            bookingDetail.setRoom(entry.getValue().getRoom());
                            bookingDetail.setPrice(entry.getValue().getRoom().getRoomType().getPrice());
                            bookingDetail.setDiscount(0);
                            bookingDetailService.save(bookingDetail);
                        }
                        card.setBalance(card.getBalance() - getTotalPrice(cart));
                        creditCardService.saveCreditCard(card);

                        PaymentEntity payment = new PaymentEntity();
                        payment.setCreditCard(card);
                        payment.setBooking(booking);
                        payment.setAmount(getTotalPrice(cart));
                        payment.setMethod(PaymentMethod.CREDIT_CARD);
                        payment.setPaymentDate(new Date());
                        payment.setStatus(PaymentStatus.PAYMENT_ORDER);
                        paymentService.savePayment(payment);

                        String pathUrl = request.getRequestURI();
                        String pathUrlCut = pathUrl.substring(0, StringUtils.ordinalIndexOf(pathUrl, "/", 3));
                        String confirmationUrl = pathUrlCut + "/bookingDetail?token=" + booking.getBookingNumber();

                        emailService.sendMail(booking, confirmationUrl);

                        cart = new HashMap<>();
                        session.setAttribute("cart", cart);
                        request.getSession().removeAttribute("booking");
                        request.getSession().removeAttribute("sDate");
                        request.getSession().removeAttribute("eDate");
                        request.getSession().removeAttribute("totalprice");
                        return "user/payment_success";
                    }
                }
            }
        } catch (Exception e) {
            return "403";
        }
    }

    @RequestMapping(value = "/bookingDetail", method = {RequestMethod.GET, RequestMethod.POST})
    public String confirmBookingDetail(Model model,
            HttpServletRequest request,
            HttpSession session,
            @RequestParam("token") String bookingNumber
    ) {

        BookingEntity booking = bookingService.getBookingByToken(bookingNumber);
        List<BookingDetailEntity> bookingDetail = bookingDetailService.findByBooking(booking.getId());
        model.addAttribute("bookingDetail", bookingDetail);
        model.addAttribute("booking", booking);
        return "user/booking_detail";
    }

    @RequestMapping(value = "/cancel/{id}", method = RequestMethod.GET)
    @Transactional(rollbackFor = Exception.class)
    public String cancleBooking(Model model,
            HttpServletRequest request,
            HttpSession session,
            @PathVariable("id") int bookingId
    ) {
        try {
            BookingEntity booking = bookingService.findbyId(bookingId);
            PaymentEntity payment = paymentService.findByBooking(bookingId);
            CreditCardEntity creditCard = creditCardService.findById(payment.getCreditCard().getId());
            if (booking.getStatus().equals(BookingStatus.BOOKED)) {
                booking.setStatus(BookingStatus.CANCEL);
                bookingService.saveBooking(booking);

                creditCard.setBalance(creditCard.getBalance() + booking.getTotalPrice());
                creditCardService.saveCreditCard(creditCard);

                payment.setStatus(PaymentStatus.REFUND);
                paymentService.savePayment(payment);
            } else {

                List<BookingDetailEntity> bookingDetail = bookingDetailService.findByBooking(booking.getId());
                model.addAttribute("bookingDetail", bookingDetail);
                model.addAttribute("booking", booking);
                model.addAttribute("error", "can not be canceled !!!");
                return "user/booking_detail";
            }

            emailMessage = "<html>\n"
                    + "	<head>\n"
                    + "		<title>cancel success</title>\n"
                    + "	</head>\n"
                    + "	\n"
                    + "	<body>\n"
                    + "\n"
                    + "		<h2 style=\"text-align: center\">successful cancellation!!!</h2>\n"
                    + " <p style=\"text-align: center\">Booking number: " + booking.getBookingNumber() + "</p>\n"
                    + "		<p style=\"text-align: center\">The reservation has been canceled</p>\n"
                    + "\n"
                    + "	</body>\n"
                    + "\n"
                    + "</html>";
            emailSubject = "The reservation has been canceled!!!";
            emailToRecipient = booking.getEmail();

            mailSenderObj.send(new MimeMessagePreparator() {

                public void prepare(MimeMessage mimeMessage) throws Exception {

                    String senderName = "HOTEL LMT";
                    MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                    mimeMsgHelperObj.setTo(emailToRecipient);
                    mimeMsgHelperObj.setFrom("lam570872@gmail.com", senderName);
                    mimeMsgHelperObj.setText(emailMessage, true);
                    mimeMsgHelperObj.setSubject(emailSubject);
                }
            });
            return "user/cancel_success";
        } catch (Exception e) {
            return "403";
        }
    }

    @RequestMapping("/bookingHistory")
    public String bookingHistory(Model model) {

        UserEntity user = userService.getUserByEmail(user());
        List<BookingEntity> bookings = bookingService.getBookingByUserID(user.getId());

        model.addAttribute("bookings", bookings);
        model.addAttribute("username", user());
        model.addAttribute("listRoomTypes", roomTypeService.getListRoomTypes());

        return "user/booking_history";

    }

}
