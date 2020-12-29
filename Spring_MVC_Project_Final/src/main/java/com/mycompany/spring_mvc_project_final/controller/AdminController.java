/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ConvenientEntity;
import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomTypeEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.entities.UserRoleEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import com.mycompany.spring_mvc_project_final.enums.PaymentMethod;
import com.mycompany.spring_mvc_project_final.enums.PaymentStatus;
import com.mycompany.spring_mvc_project_final.enums.Role;
import com.mycompany.spring_mvc_project_final.enums.RoomType;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import com.mycompany.spring_mvc_project_final.models.PromotionFormAdmin;
import com.mycompany.spring_mvc_project_final.models.UserFormAdmin;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.CommentService;
import com.mycompany.spring_mvc_project_final.service.ConvenientService;
import com.mycompany.spring_mvc_project_final.service.CreditCardService;
import com.mycompany.spring_mvc_project_final.service.PaymentService;
import com.mycompany.spring_mvc_project_final.service.PromotionService;
import com.mycompany.spring_mvc_project_final.service.RoomService;
import com.mycompany.spring_mvc_project_final.service.RoomTypeService;
import com.mycompany.spring_mvc_project_final.service.ServiceService;
import com.mycompany.spring_mvc_project_final.service.UserRoleService;
import com.mycompany.spring_mvc_project_final.service.UserService;
import com.mycompany.spring_mvc_project_final.service.VoteService;
import java.lang.annotation.Annotation;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private UserRoleService userRoleService;
    
    @Autowired
    private BookingService bookingService;
    
    @Autowired
    private RoomService roomService;
    
    @Autowired
    private RoomTypeService roomTypeService;
    
    @Autowired
    private ServiceService serviceService;
    
    @Autowired
    private PromotionService promotionService;
    
    @Autowired
    private ConvenientService convenientService;
    
    @Autowired
    private CommentService commentService;
    
    @Autowired
    private VoteService voteService;
    
    @Autowired
    private PaymentService paymentService;
    
    @Autowired
    private BookingDetailService bookingDetailService;
    
    @Autowired
    private CreditCardService creditCardService;
    
    
    @RequestMapping("/home")
    public String viewHome(Model model) {

//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        String username = principal.toString();
//        if (principal instanceof UserDetails) {
//            username = ((UserDetails) principal).getUsername();
//        }
        Date todayDate = new Date();
        List<BookingEntity> bookingsofMonth = bookingService.searchBookingDate(getFirstDateOfMonth(todayDate), getLastDateOfMonth(todayDate));
        
        List<BookingEntity> bookings = bookingService.getAllBookings();
        List<PaymentEntity> payments = paymentService.getAllPayment();
        List<PaymentEntity> paymentMonth = paymentService.getAllPaymentByPaymentDate(getFirstDateOfMonth(todayDate), getLastDateOfMonth(todayDate));
        double revenue = 0;
        double refund = 0;
        double revenueToday = 0;
        double refundToday = 0;
        double revenueMonth = 0;
        double refundMonth = 0;
        if(!CollectionUtils.isEmpty(payments)){
        for(PaymentEntity paymentEntity: payments){
            if(paymentEntity.getStatus()==PaymentStatus.PAYMENT_ORDER || paymentEntity.getStatus() == PaymentStatus.PAYMENT_FINAL){
            revenue = revenue + paymentEntity.getAmount();
            }
            
        }
        for(PaymentEntity paymentEntity: payments){
            if(paymentEntity.getStatus()==PaymentStatus.REFUND){
            refund = refund + paymentEntity.getAmount();
            }
        }
        }
        
        if (!CollectionUtils.isEmpty(paymentMonth)) {
            for (PaymentEntity paymentEntity : paymentMonth) {
                if (paymentEntity.getStatus() == PaymentStatus.PAYMENT_ORDER || paymentEntity.getStatus() == PaymentStatus.PAYMENT_FINAL) {
                    revenueMonth = revenueMonth + paymentEntity.getAmount();
                    if (datetoLocal(paymentEntity.getPaymentDate()).isEqual(datetoLocal(new Date()))) {
                        revenueToday = revenueToday + paymentEntity.getAmount();
                    }
                }

            }
            for (PaymentEntity paymentEntity : paymentMonth) {
                if (paymentEntity.getStatus() == PaymentStatus.REFUND) {
                    refundMonth = refundMonth + paymentEntity.getAmount();
                    if (datetoLocal(paymentEntity.getPaymentDate()).isEqual(datetoLocal(new Date()))) {
                        refundToday = refundToday + paymentEntity.getAmount();
                    }
                }

            }
        }
        
        
        
        List<RoomEntity> rooms = roomService.getAllRooms();
        List<RoomEntity> roomsUsed = roomService.searchRoom(todayDate, todayDate);
        List<RoomTypeEntity> roomTypes = roomTypeService.getListRoomTypes();
        List<ServiceEntity> serivs = serviceService.getAllServices();
        List<PromotionEntity> promotions = promotionService.getAllPromotion();
        List<PromotionEntity> promotionsOfMonth = promotionService.getAllPromotionAvailable(getFirstDateOfMonth(todayDate), getLastDateOfMonth(todayDate));
        
        List<RoomTypeEntity> roomtypeinPromotion = roomTypeService.getRoomTypeInPromotion(getFirstDateOfMonth(todayDate), getLastDateOfMonth(todayDate));
        List<ConvenientEntity> convenients = convenientService.getAllConvenients();
        model.addAttribute("bookings", bookings);
        model.addAttribute("bookingsofMonth", bookingsofMonth);
        model.addAttribute("revenue", revenue);
        model.addAttribute("refund", refund);
        model.addAttribute("revenueToday", revenueToday);
        model.addAttribute("refundToday", refundToday);
        model.addAttribute("revenueMonth", revenueMonth);
        model.addAttribute("refundMonth", refundMonth);     
        model.addAttribute("payments", payments);
        model.addAttribute("rooms", rooms);
        model.addAttribute("roomsUsed", roomsUsed);
        model.addAttribute("roomTypes", roomTypes);
        model.addAttribute("roomtypeinPromotion", roomtypeinPromotion);
        model.addAttribute("serivs", serivs);
        model.addAttribute("promotions", promotions);
        model.addAttribute("promotionsOfMonth", promotionsOfMonth);
        
        model.addAttribute("convenients", convenients);
        
        model.addAttribute("adminUser",getUserName());
        model.addAttribute("menu", "Dashboard");
        model.addAttribute("submenu", "Hotel Business");
        
        return "admin/home";
    }
    
    @RequestMapping("/home2")
    public String viewHome2(Model model) {
        List<UserEntity> adminUsers = new ArrayList<>();
        List<UserEntity> userUsers = new ArrayList<>();
        List<UserEntity> otherUsers = new ArrayList<>();
        List<UserEntity> users = userService.findAllUserQuery();
        if(!CollectionUtils.isEmpty(users)){
            for(UserEntity user:users){
                Set<UserRoleEntity> userRoles = new HashSet<>();
                userRoles = user.getUserRoles();
                if(!CollectionUtils.isEmpty(userRoles)){
                    for(UserRoleEntity userRole:userRoles){
                        Role role = userRole.getRole();
                        if(role==Role.ROLE_ADMIN){
                            adminUsers.add(user);
                        }
                        if(role==Role.ROLE_USER){
                            userUsers.add(user);
                        }
                        if(role!=Role.ROLE_ADMIN && role!=Role.ROLE_USER){
                            otherUsers.add(user);
                        }
                    }
                }
                
            }
        }
        List<UserRoleEntity> userRoles = new ArrayList<>();
        userRoles = userRoleService.getUserRoles();
        model.addAttribute("userRoles", userRoles);
        model.addAttribute("users", users);
        model.addAttribute("adminUsers", adminUsers);
        model.addAttribute("userUsers", userUsers);
        model.addAttribute("otherUsers", otherUsers);
        model.addAttribute("menu", "Dashboard");
        model.addAttribute("submenu", "Account Dashboard");
        model.addAttribute("adminUser",getUserName());
        return "admin/home2";
    }
        
    
    @RequestMapping("/404")
    public String page404(Model model){
        return "admin/404";
    }
            
            
            
    @RequestMapping("/view-account")
    public String viewAccount(Model model){
        
        model.addAttribute("users", userService.findAllUserQuery());
        
        model.addAttribute("menu", "Account Management");
        model.addAttribute("submenu", "View Account");
        model.addAttribute("adminUser",getUserName());
        return "admin/user-list";
    } 
    
    @RequestMapping("/add-account")
    public String displayAddAccount(Model model){
        
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        model.addAttribute("today", simpleDateFormat.format(new Date()));
        model.addAttribute("userRoles", userRoleService.getUserRoles());
        model.addAttribute("action", "add");
        model.addAttribute("menu", "Account Management");
        model.addAttribute("submenu", "Add Account");
        model.addAttribute("adminUser",getUserName());
        return "admin/user-form";
    }   
    
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String addAccount(Model model,@ModelAttribute("user") UserFormAdmin user){
        
        UserEntity userNew = new UserEntity();
        HashSet<UserRoleEntity> userRoles = new HashSet<>();
        if(!CollectionUtils.isEmpty(user.getUserRoles())) {
            for(String roleID:user.getUserRoles()){
                if(roleID != null && roleID != ""){
                    userRoles.add(userRoleService.getUserRoleByid(Integer.parseInt(roleID)));
                }
            }
        } else {
            return "redirect:/admin/add-account?type=error&message=Account with no role is Not Accepted";
        }     
        userNew.setFullName(user.getFullName());
        userNew.setPassword(userService.encrytePassword(user.getPassword()));
        userNew.setEmail(user.getEmail());
        userNew.setPhone(user.getPhone());
        userNew.setBirthDate(user.getBirthDate());
        userNew.setAddress(user.getAddress());
        userNew.setGender(user.getGender());
        userNew.setStatus(UserStatus.ACTIVE);
        userNew.setUserRoles(userRoles);
        userNew.setCardId(user.getCardId());
        
        userService.saveUser(userNew);        
        return"redirect:/admin/view-account";
    }
    
    @RequestMapping("/edit-account/{account-id}")
    public String editAccountView(Model model,
            @PathVariable("account-id") int id){
        
        UserEntity userEdit = userService.getUserByIdQuery(id);
        if(userEdit.getId()>0){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        model.addAttribute("userEdit",userEdit);
        model.addAttribute("today", simpleDateFormat.format(new Date()));
        model.addAttribute("userRoles", userRoleService.getUserRoles());
        model.addAttribute("action", "edit-account");
        model.addAttribute("menu", "Account Management");
        model.addAttribute("submenu", "Add Account");
        model.addAttribute("adminUser",getUserName());
        return "admin/user-edit";
        }
        return "redirect:/admin/404";
    }   
    
    @RequestMapping(value = "/edit-account",method = RequestMethod.POST)
    public String editAccount(Model model,
            @ModelAttribute("user") UserFormAdmin user){
        
        UserEntity userNew = userService.getUserById(user.getId());
        
        HashSet<UserRoleEntity> userRoles = new HashSet<>();
        
        if(!CollectionUtils.isEmpty(user.getUserRoles())) {
            for(String roleID:user.getUserRoles()){
                if(roleID != null && roleID != ""){
                    userRoles.add(userRoleService.getUserRoleByid(Integer.parseInt(roleID)));
                }
            }
        } else {
            return "redirect:/admin/edit-account/"+user.getId()+"?type=error&message=Account with no role is Not Accepted";
        }
        userNew.setId(user.getId());
        userNew.setFullName(user.getFullName());
//        userNew.setPassword(userService.encrytePassword(user.getPassword()));
        userNew.setEmail(user.getEmail());
        userNew.setPhone(user.getPhone());
        userNew.setBirthDate(user.getBirthDate());
        userNew.setAddress(user.getAddress());
        userNew.setGender(user.getGender());
        userNew.setStatus(UserStatus.ACTIVE);
        userNew.setUserRoles(userRoles);
        userNew.setCardId(user.getCardId());
        
        userService.saveUser(userNew);        
        return"redirect:/admin/view-account";
    }
    
    @RequestMapping("/user-status-lock/{account-id}")
    public String lockAccount(Model model,
            @PathVariable("account-id") int id){
        UserEntity user = userService.getUserById(id);
        if(user.getId()>0){
            user.setStatus(UserStatus.LOCK);
            userService.saveUser(user);
            return"redirect:/admin/view-account";
        }
        return"redirect:/admin/404";
    }
    
    @RequestMapping("/user-status-active/{account-id}")
    public String activeAccount(Model model,
            @PathVariable("account-id") int id){
        UserEntity user = userService.getUserById(id);
        if(user.getId()>0){
            user.setStatus(UserStatus.ACTIVE);
            userService.saveUser(user);
            return"redirect:/admin/view-account";
        }
        return"redirect:/admin/404";
    }
    
    @RequestMapping("/change-password/{account-id}")
    public String changePassAccountView(Model model,
            @PathVariable("account-id") int id){
        UserEntity user = userService.getUserById(id);
        if(user.getId()>0){
            model.addAttribute("user", user);
            model.addAttribute("action", "change-password");
            model.addAttribute("menu", "Account Management");
            model.addAttribute("submenu", "Add Account");
            model.addAttribute("adminUser",getUserName());
            return "admin/user-password-view";
        }
        return"redirect:/admin/404";
    }
    
    @RequestMapping(value = "/change-password", method = RequestMethod.POST)
    public String changePassAccount(Model model,
            @RequestParam("id") int id,
            @RequestParam("newPass") String newPass,
            @RequestParam("confirmPass") String confirmPass,
            @RequestParam("oldPass") String oldPass) {
        
        if (newPass.equals(confirmPass)) {
            
            UserEntity user = userService.getUserById(id);
            if(!userService.checkPassword(oldPass, user.getPassword())){
                return "redirect:/admin/change-password/" + id + "?type=error&message=old Password is wrong";
            }
            user.setPassword(userService.encrytePassword(newPass));
            userService.saveUser(user);
            return "redirect:/admin/view-account?type=success&message=Change Password Successful";
            
        }
        return "redirect:/admin/change-password/" + id + "?type=error&message=Confirmation Password is not match";
    }
    
    @RequestMapping("/view-booking")
    public String bookingView(Model model,
            @RequestParam(name = "message", required = false) String message){
        
        if(message ==null){
        model.addAttribute("bookings", bookingService.getAllBookings());
        }
        model.addAttribute("menu", "Booking Management");
        model.addAttribute("submenu", "View Booking");
        model.addAttribute("message", message);
        model.addAttribute("adminUser",getUserName());
        return "admin/booking-view";
    }
        
    
    @RequestMapping("/new-booking")
    public String displayAddBooking(Model model){
        
         model.addAttribute("action", "search-Room");
        model.addAttribute("menu", "Booking Management");
        model.addAttribute("submenu", "View Booking");
        model.addAttribute("adminUser",getUserName());
        return "admin/booking-form-1";
    }
    
    @RequestMapping(value = "/search-Room",method = RequestMethod.POST)
    public String displayAddBooking2(Model model,
            @ModelAttribute("booking") BookingEntity bookingEntity){
         List<RoomTypeEntity> roomTypes = new ArrayList();
         for(RoomEntity roomEntity:roomService.searchRoom(bookingEntity.getCheckin(), bookingEntity.getCheckout())){             
             roomTypes.add(roomEntity.getRoomType());
         };
         model.addAttribute("action", "add-booking");
         model.addAttribute("booking", bookingEntity);
         model.addAttribute("roomTypes", roomTypes);
        model.addAttribute("menu", "Booking Management");
        model.addAttribute("submenu", "View Booking");
        return "admin/booking-form-2";
    }
    
    @RequestMapping("/add-booking")
    public String addBooking(Model model){
        
        model.addAttribute("adminUser",getUserName()); 
        return "redirect:/admin/view-booking";
    }
    
    @RequestMapping("/delete-booking/{bookingId}")
    public String bookingDelete(Model model,@PathVariable("bookingId") int id){
        bookingService.deleteBooking(id);
        model.addAttribute("bookings", bookingService.getAllBookings());
        model.addAttribute("menu", "Booking Management");
        model.addAttribute("submenu", "View Booking");
        model.addAttribute("adminUser",getUserName());
        return "admin/booking-view";
    }
    
    @RequestMapping("/check-in")
    public String bookingViewCheckin(Model model){
        
        model.addAttribute("bookings", bookingService.findByCheckinDate(new Date()));
        model.addAttribute("menu", "Booking Management");
        model.addAttribute("submenu", "Check In");
        model.addAttribute("adminUser",getUserName());
        return "admin/checkin-view";
    }
    
    @RequestMapping(value = "/check-in/{bookingId}")
    public String Checkin(Model model,
            @PathVariable("bookingId") int id){
        BookingEntity booking = bookingService.findBookingbyId(id);
        booking.setStatus(BookingStatus.CHECK_IN);
        bookingService.saveBooking(booking);
        
        model.addAttribute("bookings", bookingService.findByCheckinDate(new Date()));
        model.addAttribute("adminUser",getUserName());
        return "redirect:/admin/view-booking";
    }
    
    @RequestMapping("/check-out")
    public String bookingViewCheckout(Model model){
        
        model.addAttribute("bookings", bookingService.findByCheckoutDate(new Date()));
        model.addAttribute("menu", "Booking Management");
        model.addAttribute("submenu", "Check Out");
        model.addAttribute("adminUser",getUserName());
        return "admin/checkout-view";
    }
    
    @RequestMapping(value = "/complete-booking/{bookingId}")
    public String Checkout(Model model,
            @PathVariable("bookingId") int id){
        
        return"redirect:/admin/check-out/"+id;
    }
    
    @RequestMapping(value = "/complete-booking-zero/{bookingId}")
    public String CompleteBooking(Model model,
            @PathVariable("bookingId") int id) {
        BookingEntity booking1 = bookingService.findBookingbyId(id);
        booking1.setStatus(BookingStatus.COMPLETE);
        bookingService.saveBooking(booking1);
        return "redirect:/admin/check-out/" + id;
    }
    
    @RequestMapping(value = "/check-out/{bookingId}")
    public String Checkout(Model model,
            @PathVariable("bookingId") int id,
            @RequestParam(name = "message", required = false) String message) throws ParseException{
        
        
        BookingEntity booking1 = bookingService.findBookingbyId(id);
        
        if(booking1.getId()> 0){
                
        
        
        if ("Payment Successful".equalsIgnoreCase(message)) {
            booking1.setStatus(BookingStatus.COMPLETE);
        }else{
            if(booking1.getStatus() != BookingStatus.COMPLETE){
            booking1.setStatus(BookingStatus.CHECK_OUT);
            }
        }
        
        
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");        
        
        booking1.setCheckout(new Date());
        bookingService.saveBooking(booking1);
        BookingEntity booking = bookingService.findBookingbyId(id);
        List<BookingDetailEntity> bookingDetailEntitys = new ArrayList<>();
        List<BookingDetailEntity> listDetails = booking.getBookingDetails();
        if (!CollectionUtils.isEmpty(listDetails)) {
            for (BookingDetailEntity bde : listDetails) {
                int isContain = 0;
                if (!CollectionUtils.isEmpty(bookingDetailEntitys)) {
                    for (BookingDetailEntity bde1 : bookingDetailEntitys) {
                        if (bde1.getId() == bde.getId()) {
                            isContain++;
                        }
                    }
                }
                if (isContain == 0) {
                    bookingDetailEntitys.add(bde);
                }
            }
        }
        
        booking.setBookingDetails(bookingDetailEntitys);
        
        List<PaymentEntity> payments = paymentService.getPaymentByBooking(id);
        
        double bookOrderPay = 0;
        if(!CollectionUtils.isEmpty(payments)){
            for(PaymentEntity payment:payments){
                if(payment.getStatus() == PaymentStatus.PAYMENT_ORDER){
                    bookOrderPay = bookOrderPay + payment.getAmount();
                }
            }
        }
        
        long getDiff = booking.getCheckout().getTime() - booking.getCheckin().getTime();
        long getDaysDiff = TimeUnit.MILLISECONDS.toDays(getDiff);
        
        if(getDaysDiff<1l){
            getDaysDiff =1l;
        }
        
        
        model.addAttribute("today", simpleDateFormat.format(new Date()));
        model.addAttribute("stayDays", String.valueOf(getDaysDiff));
        model.addAttribute("bookingOut", booking);
        model.addAttribute("bookOrderPay", bookOrderPay);
        model.addAttribute("bookings", bookingService.findByCheckinDate(new Date()));
        model.addAttribute("adminUser",getUserName());
        return "admin/invoice-view";
        }
            
        return "redirect:/admin/404";
        
    }
    
    @RequestMapping(value = "/cancel-booking/{bookingId}")
    public String cancelBooking(Model model,
            @PathVariable("bookingId") int id){
        BookingEntity booking = bookingService.findBookingbyId(id);
         if (booking.getId() > 0) {
             if (booking.getStatus() == BookingStatus.BOOKED) {
                 booking.setStatus(BookingStatus.CANCEL);
                 bookingService.saveBooking(booking);

                 BookingEntity bookingE = bookingService.findbyId(id);
                 PaymentEntity payment = new PaymentEntity();
                 payment.setAmount(bookingE.getTotalPrice() * 80 / 100);
                 payment.setBooking(bookingE);
                 List<PaymentEntity> payments = paymentService.getPaymentByBooking(id);
                 PaymentEntity paymentBook;
                 if(!CollectionUtils.isEmpty(payments)){
                     paymentBook=payments.get(0);
                     if(paymentBook.getMethod()== PaymentMethod.CREDIT_CARD){                         
                         CreditCardEntity creditCard = paymentBook.getCreditCard();
                         double newBalance = creditCard.getBalance()+(bookingE.getTotalPrice() * 80 / 100);
                         creditCard.setBalance(newBalance);
                         creditCardService.saveCreditCard(creditCard);
                         payment.setMethod(PaymentMethod.CREDIT_CARD);
                         payment.setCreditCard(creditCard);
                     }else{
                         payment.setMethod(PaymentMethod.CASH_ON_DELIVERY);
                     }
                 }
                 
                 payment.setPaymentDate(new Date());
                 payment.setStatus(PaymentStatus.REFUND);
                 paymentService.savePayment(payment);
                 return "redirect:/admin/view-booking" + "?message=REFUND PAYMENT";
             }
         }
         return"redirect:/admin/404";
    }
    
    
    @RequestMapping("/edit-booking/{booking-id}")
    public String bookingViewCheck(Model model,
            @PathVariable("booking-id") int id){
        
        BookingEntity booking = bookingService.findBookingbyId(id);
        if (booking.getId() > 0) {
        List<BookingDetailEntity> bookingDetailEntitys = new ArrayList<>();
        List<BookingDetailEntity> listDetails = booking.getBookingDetails();
        if (!CollectionUtils.isEmpty(listDetails)) {
            for (BookingDetailEntity bde : listDetails) {
                int isContain = 0;
                if (!CollectionUtils.isEmpty(bookingDetailEntitys)) {
                    for (BookingDetailEntity bde1 : bookingDetailEntitys) {
                        if (bde1.getId() == bde.getId()) {
                            isContain++;
                        }
                    }
                }
                if (isContain == 0) {
                    bookingDetailEntitys.add(bde);
                }
            }
        }
        
        booking.setBookingDetails(bookingDetailEntitys);
//        double total = 0;
//        for(BookingDetailEntity bde:bookingDetailEntitys){            
//            total = total+bde.getPrice()*(1-bde.getDiscount()/100);
//        }
//        booking.setTotalPrice(total);
        
        
            model.addAttribute("action", "booking-update");
            model.addAttribute("bookingUpdate", booking);
            model.addAttribute("Services", serviceService.getAllServices());
            model.addAttribute("bookingUpdatePayments", paymentService.getPaymentByBooking(id));
            model.addAttribute("roomTypes", roomTypeService.getListRoomTypes());
            model.addAttribute("menu", "Booking Management");
            model.addAttribute("submenu", "View Booking");
            model.addAttribute("adminUser",getUserName());
            return "admin/booking-edit";
        } else {
            return "redirect:/admin/404";
        }
        
        
    }
    @RequestMapping("/delete-booking-detail/{bookingId}/{bookingDetailId}")
    public String deleteBookingDetail(Model model,
            @PathVariable("bookingId") int bookingId,
            @PathVariable("bookingDetailId") int bookingDetailId){
        bookingService.deleteBookingDetailById(bookingId, bookingDetailId);
        return "redirect:/admin/edit-booking/"+bookingId;
    }
    
    @RequestMapping(value = "/delete-booking-service/{bookingDetailId}/{serviceId}")
    public String deleteBookingService(Model model,
            @PathVariable("bookingDetailId") int id,
            @PathVariable("serviceId") int serviceId){
        
        BookingDetailEntity bookingDetail = bookingDetailService.getBookingDetailbyId(id);
        Set<ServiceEntity> serviceEntitys = bookingDetail.getServices();
        Set<ServiceEntity> serviceNews = new HashSet<>();
        int isService = 0;
        double totalPrice = 0;
        if (!CollectionUtils.isEmpty(serviceEntitys)) {
            for (ServiceEntity serviceEntity : serviceEntitys) {
                if(serviceEntity.getId()!=serviceId){
                    serviceNews.add(serviceEntity);
                    
                }else{
                    isService++;
                    totalPrice = totalPrice - serviceEntity.getAmount();
                }
            }
        }
        bookingService.updateTotalPrice(bookingDetail.getBooking().getId(), totalPrice);
        bookingDetail.setServices(serviceNews);
        bookingDetailService.saveBookingEntity(bookingDetail);
        if(isService>0){
            return "redirect:/admin/edit-booking/"+bookingDetail.getBooking().getId();
        }else{
            return "redirect:/admin/view-booking?type=error&message=Something wrong with your enter information";
        }
        
        
    }
    
    @RequestMapping(value = "/add-booking-service/{bookingDetailId}", method = RequestMethod.POST)
    public String addBookingService(Model model,
            @RequestParam("addservices") String[] services,
            @PathVariable("bookingDetailId") int id){
        
        BookingDetailEntity bookingDetail = bookingDetailService.getBookingDetailbyId(id);
        Set<ServiceEntity> serviceEntitys = bookingDetail.getServices();
        double totalPrice = 0;
        if(services != null && services.length > 0){
            for (String service : services) {
                ServiceEntity serviceEntity = serviceService.getServicebyId(Integer.parseInt(service));
                serviceEntitys.add(serviceEntity);
                totalPrice = totalPrice + serviceEntity.getAmount();
            }
        }
        bookingService.updateTotalPrice(bookingDetail.getBooking().getId(), totalPrice);
        bookingDetail.setServices(serviceEntitys);
        bookingDetailService.saveBookingEntity(bookingDetail);
        return "redirect:/admin/edit-booking/"+bookingDetail.getBooking().getId();
    }
    
    @RequestMapping(value = "/search-booking", method = RequestMethod.POST)
    public String searchBooking(Model model,
            @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date sDate,
            @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date eDate){
        
        if(sDate.after(eDate)){
            return "redirect:/admin/view-booking?message=End date must after Start date";
        }
        
        List<BookingEntity> bookings = bookingService.searchBookingDate(sDate, eDate);
        
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        
        model.addAttribute("inputsDat", simpleDateFormat.format(sDate));
        model.addAttribute("inputeDat", simpleDateFormat.format(eDate));
        model.addAttribute("bookings", bookings);
        model.addAttribute("menu", "Booking Management");
        model.addAttribute("submenu", "View Booking");
        
        return "admin/booking-view";
    }
    
    @RequestMapping(value = "/booking-update",method = RequestMethod.POST)
    public String editBooking(Model model,
            @ModelAttribute("booking") BookingEntity booking){
        return"";
    }
    
    
            
    @RequestMapping("/view-roomtype")
    public String roomTypeView(Model model){
        
        model.addAttribute("roomTypes", roomTypeService.getListRoomTypes());
        model.addAttribute("menu", "Room Type Manage");
        model.addAttribute("submenu", "View Room Type");
        model.addAttribute("adminUser",getUserName());
        return "admin/roomtype-view";
    }
    
    @RequestMapping("/edit-roomtype/{roomtype-id}")
    public String editRoomTypeView(Model model,
            @PathVariable("roomtype-id") int id){
        RoomTypeEntity roomType = new RoomTypeEntity();
        roomType = roomTypeService.getRoomTypeQueryById(id);
        if(roomType.getId() > 0){
            
        
        model.addAttribute("editRoomType", roomTypeService.getRoomTypeQueryById(id));
        
        model.addAttribute("roomtypeenums", RoomType.getEnumRoomType());
        model.addAttribute("action", "edit-roomtype");
        model.addAttribute("menu", "Room Type Manage");
        model.addAttribute("submenu", "View Room Type");
        model.addAttribute("adminUser",getUserName());
        return "admin/roomtype-add";
        }
        return "redirect:/admin/404";
    }
    
    @RequestMapping(value = "/edit-roomtype", method = RequestMethod.POST)
    public String editRoomType(Model model,
            @ModelAttribute("roomtype") RoomTypeEntity roomType,
            @RequestParam("files") MultipartFile[] files,
            HttpServletRequest request){
        
        List<ImageEntity> images = new ArrayList<>();
        
        String message = "";
        
        if (files != null && files.length > 0) {
            
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                if(file.getSize()==0l){
                    continue;
                }
                try {
                    byte[] bytes = file.getBytes();

                    ServletContext context = request.getServletContext();
                    String pathUrl = context.getRealPath("/images");

                    int index = pathUrl.indexOf("target");
                    String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
                    String nameGen = nameGenerater();
                    Path path = Paths.get(pathFolder +nameGen+ file.getOriginalFilename());
                    Files.write(path, bytes);

                    // sau khi upload file xong lấy file name ra để insert vào database
                    String name = nameGen+file.getOriginalFilename();
                    ImageEntity image = new ImageEntity();
                    image.setName(name);
                    images.add(image);
                    message = message + "You successfully uploaded file " + name;
                } catch (Exception e) {
                    message = message + "RoomType was edit without new images => " + e.getMessage();
                    model.addAttribute("action", "add-roomtype");
                    model.addAttribute("message", message);
                    model.addAttribute("menu", "Room Type Manage");
                    model.addAttribute("submenu", "Add Room Type");
                    roomTypeService.saveRoomType(roomType, "edit");
                    
                    return "redirect:/admin/view-roomtype";
                }
            }
            roomType.setImages(images);
            
            roomTypeService.saveRoomType(roomType, "add");
            
        } else {
            message = message + "RoomType was edit without new images ";
            
            roomTypeService.saveRoomType(roomType, "edit");
            
        }
        
        return "redirect:/admin/view-roomtype?message="+message;
        
    }
    
    
    @RequestMapping("/add-roomtype")
    public String addRoomTypeView(Model model,
            @RequestParam(name = "message", required = false) String message){
        model.addAttribute("roomtypeenums", RoomType.getEnumRoomType());
        model.addAttribute("action", "add-roomtype");
        model.addAttribute("menu", "Room Type Manage");
        model.addAttribute("submenu", "Add Room Type");
        model.addAttribute("message", message);
        model.addAttribute("adminUser",getUserName());
        return "admin/roomtype-add";
    }
    
    @RequestMapping(value = "/add-roomtype", method = RequestMethod.POST)
    public String addRoomType(Model model,
            @ModelAttribute("roomtype") RoomTypeEntity roomType,
            @RequestParam("files") MultipartFile[] files,
            HttpServletRequest request){
        
        List<ImageEntity> images = new ArrayList<>();
        
        List<RoomTypeEntity> roomtypesDB = roomTypeService.getListRoomTypes();
        for(RoomTypeEntity rte:roomtypesDB){
            if(roomType.getName().equalsIgnoreCase(rte.getName())){
                return "redirect:/admin/add-roomtype?type=error&message=RoomType "+roomType.getName()+" already in system. Please check your info";
            }
        }
        
        String message = "";
        if (files != null && files.length > 0) {
            
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                try {
                    byte[] bytes = file.getBytes();
                    if(file.getSize()==0l){
                    continue;
                    }
                    ServletContext context = request.getServletContext();
                    String pathUrl = context.getRealPath("/images");

                    int index = pathUrl.indexOf("target");
                    String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
                    String nameGen = nameGenerater();
                    Path path = Paths.get(pathFolder +nameGen+ file.getOriginalFilename());
                    Files.write(path, bytes);

                    // sau khi upload file xong lấy file name ra để insert vào database
                    String name = nameGen+file.getOriginalFilename();
                    ImageEntity image = new ImageEntity();
                    image.setName(name);
                    images.add(image);
                    message = message + "You successfully uploaded file " + name;
                } catch (Exception e) {
                    message = message + "You failed to upload  => " + e.getMessage();
                    model.addAttribute("action", "add-roomtype");
                    model.addAttribute("message", message);
                    model.addAttribute("menu", "Room Type Manage");
                    model.addAttribute("submenu", "Add Room Type");
                    return "admin/add-roomtype";
                }
            }
            roomType.setImages(images);
            
        } else {
            message = message + "RoomType was added without images " + " because the file was empty.";
            
        }
        roomTypeService.saveRoomType(roomType, "add");
        return "redirect:/admin/view-roomtype?message="+message;
        
        
    }
    
    @RequestMapping("/view-room")
    public String roomView(Model model){
        
        model.addAttribute("rooms", roomService.getAllRooms());
        model.addAttribute("menu", "Rooms");
        model.addAttribute("submenu", "View All Rooms");
        model.addAttribute("adminUser",getUserName());
        return "admin/room-view";
    }
    
    @RequestMapping("/add-room")
    public String addRoomView(Model model,
            @RequestParam(name = "message", required = false) String message){
        model.addAttribute("roomTypes", roomTypeService.getListRoomTypes());
        model.addAttribute("action", "add-room");
        model.addAttribute("menu", "Rooms");
        model.addAttribute("submenu", "Add Room Details");
        model.addAttribute("message", message);
        model.addAttribute("adminUser",getUserName());
        return "admin/room-add";
    }
    
    @RequestMapping(value = "/add-room", method = RequestMethod.POST)
    public String addRoom(Model model,
            @ModelAttribute("room") RoomEntity room,
            HttpServletRequest request){
        String message = "";
        List<RoomEntity> roomsDB = roomService.getAllRooms();
        for(RoomEntity roomcheck:roomsDB){
            if(roomcheck.getRoomNumber().equalsIgnoreCase(room.getRoomNumber())){
                message = message + "Room "+ room.getRoomNumber()+" already added";
                return "redirect:/admin/add-room?message="+message;
            }
        }
        roomService.saveRoom(room);
        message = message + "Successfull added new Room: "+room.getRoomNumber();
        return "redirect:/admin/view-room?type=success&message="+message;
    }
    
    @RequestMapping("/edit-room/{room-id}")
    public String editRoomView(Model model,
            @PathVariable("room-id") int id,
            @RequestParam(name = "message", required = false)  String message){
        RoomEntity room = new RoomEntity();
        room = roomService.findbyRoomId(id);
        if(room.getId()>0){
        model.addAttribute("roomEdit", roomService.findbyRoomId(id));
        model.addAttribute("roomTypes", roomTypeService.getListRoomTypes());
        model.addAttribute("action", "edit-room");
        model.addAttribute("menu", "Rooms");
        model.addAttribute("submenu", "View All Rooms");
        model.addAttribute("message", message);
        model.addAttribute("adminUser",getUserName());
        return "admin/room-add";
        }
        return "redirect:/admin/404";
    }
    
    @RequestMapping(value = "/edit-room", method = RequestMethod.POST)
    public String editRoom(Model model,
            @ModelAttribute("room") RoomEntity room,
            HttpServletRequest request){
        String message = "";
        
        roomService.saveRoom(room);
        message = message + "Successfull edit Room: "+room.getRoomNumber();
        return "redirect:/admin/view-room?type=success&message="+message;
    }
    
    
    @RequestMapping("/view-service")
    public String serviceView(Model model){
        
        model.addAttribute("services", serviceService.getAllServices());
        model.addAttribute("menu", "Services");
        model.addAttribute("submenu", "View All Services");
        model.addAttribute("adminUser",getUserName());
        return "admin/service-view";
    }
    
    @RequestMapping("/add-service")
    public String addServiceView(Model model){
        model.addAttribute("services", serviceService.getAllServices());
        model.addAttribute("action", "add-service");
        model.addAttribute("menu", "Services");
        model.addAttribute("submenu", "Add Service");
        model.addAttribute("adminUser",getUserName());
        return "admin/service-add";
    }
    
    @RequestMapping(value = "/add-service", method = RequestMethod.POST)
    public String addService(Model model,
            @ModelAttribute("service") ServiceEntity service,
            @RequestParam("files") MultipartFile[] files,
            HttpServletRequest request){
        
        List<ImageEntity> images = new ArrayList<>();
        
        
        
        String message = "";
        if (files != null && files.length > 0) {
            
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                try {
                    byte[] bytes = file.getBytes();
                    if(file.getSize()==0l){
                        continue;
                    }
                    ServletContext context = request.getServletContext();
                    String pathUrl = context.getRealPath("/images");

                    int index = pathUrl.indexOf("target");
                    String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
                    String nameGen = nameGenerater();
                    Path path = Paths.get(pathFolder +nameGen+ file.getOriginalFilename());
                    Files.write(path, bytes);

                    // sau khi upload file xong lấy file name ra để insert vào database
                    String name = nameGen+file.getOriginalFilename();
                    ImageEntity image = new ImageEntity();
                    image.setName(name);
                    image.setService(service);
                    images.add(image);
                    message = message + "You successfully uploaded file " + name;
                } catch (Exception e) {
                    message = message + "You failed to upload  => " + e.getMessage();
                    model.addAttribute("action", "add-service");
                    model.addAttribute("message", message);
                    return "admin/add-service";
                }
            }
            service.setImages(images);
            
        } else {
            message = message + "Service was added without images " + " because the file was empty.";
            
        }
        
        serviceService.saveService(service, "add");
        return "redirect:/admin/view-service?message="+message;
    }
    
    @RequestMapping("/edit-service/{service-id}")
    public String editServiceView(Model model,
            @PathVariable("service-id") int id,
            @RequestParam(name = "message", required = false)  String message){
        ServiceEntity service = new ServiceEntity();
        service = serviceService.getServicebyQueryId(id);
        if(service.getId()>0){
        model.addAttribute("serviceEdit", serviceService.getServicebyQueryId(id));
        model.addAttribute("action", "edit-service");
        model.addAttribute("menu", "Services");
        model.addAttribute("submenu", "View All Services");
        model.addAttribute("message", message);
        model.addAttribute("adminUser",getUserName());
        return "admin/service-add";
        }
        return "redirect:/admin/404";
    }
    
    @RequestMapping(value = "/edit-service", method = RequestMethod.POST)
    public String editService(Model model,
            @ModelAttribute("service") ServiceEntity service,
            @RequestParam("files") MultipartFile[] files,
            HttpServletRequest request){
        
        List<ImageEntity> images = new ArrayList<>();    
        
        String message = "";
        if (files != null && files.length > 0) {
            
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                try {
                    byte[] bytes = file.getBytes();
                    if(file.getSize()==0l){
                        continue;
                    }
                    ServletContext context = request.getServletContext();
                    String pathUrl = context.getRealPath("/images");

                    int index = pathUrl.indexOf("target");
                    String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
                    String nameGen = nameGenerater();
                    Path path = Paths.get(pathFolder +nameGen+ file.getOriginalFilename());
                    Files.write(path, bytes);

                    // sau khi upload file xong lấy file name ra để insert vào database
                    String name = nameGen+file.getOriginalFilename();
                    ImageEntity image = new ImageEntity();
                    image.setName(name);
                    image.setService(service);
                    images.add(image);
                    message = message + "You successfully uploaded file " + name;
                } catch (Exception e) {
                    message = message + "You failed to upload  => " + e.getMessage();
                    model.addAttribute("action", "add-service");
                    model.addAttribute("message", message);
                    return "admin/add-service";
                }
            }
            service.setImages(images);
            
        } else {
            message = message + "Service was edit without images " + " because the file was empty.";
            
        }
        
        serviceService.saveService(service, "add");
        return "redirect:/admin/view-service?message="+message;
    }
    
    @RequestMapping("/view-convenient")
    public String convenientView(Model model){
        
        model.addAttribute("convenients", convenientService.getAllConvenients());
        model.addAttribute("menu", "Convenient");
        model.addAttribute("submenu", "View All Convenient");
        model.addAttribute("adminUser",getUserName());
        return "admin/convenient-view";
    }
    
    @RequestMapping("/add-convenient")
    public String addConvenientView(Model model){
        model.addAttribute("convenients", convenientService.getAllConvenients());
        model.addAttribute("action", "add-convenient");
        model.addAttribute("menu", "Convenient");
        model.addAttribute("submenu", "Add Convenient");
        model.addAttribute("adminUser",getUserName());
        return "admin/convenient-add";
    }
    
    @RequestMapping(value = "/add-convenient", method = RequestMethod.POST)
    public String addConvenient(Model model,
            @ModelAttribute("convenient") ConvenientEntity convenient,
            HttpServletRequest request){
        String message = "Successfull added new Convenient"+convenient.getName();
        convenientService.saveConvenient(convenient);
        return "redirect:/admin/view-convenient?message="+message;
    }
    
    @RequestMapping("/edit-convenient/{convenient-id}")
    public String editConvenientView(Model model,
            @PathVariable("convenient-id") int id,
            @RequestParam(name = "message", required = false)  String message){
        
        ConvenientEntity convenient = new ConvenientEntity();
        convenient = convenientService.findConvenientById(id);
        if(convenient.getId() > 0){
        model.addAttribute("convenientEdit", convenientService.findConvenientById(id));
        model.addAttribute("action", "edit-convenient");
        model.addAttribute("menu", "Convenient");
        model.addAttribute("submenu", "Add Convenient");
        model.addAttribute("message", message);
        model.addAttribute("adminUser",getUserName());
        return "admin/convenient-add";
        }
        return "redirect:/admin/404";
    }
    
    @RequestMapping(value = "/edit-convenient", method = RequestMethod.POST)
    public String editConvenient(Model model,
            @ModelAttribute("convenient") ConvenientEntity convenient,
            HttpServletRequest request){
        String message = "Successfull edit new Convenient"+convenient.getName();
        convenientService.saveConvenient(convenient);
        return "redirect:/admin/view-convenient?type=success&message="+message;
    }
    
    @RequestMapping("/view-promotion")
    public String promotionView(Model model){
        
        model.addAttribute("promotions", promotionService.getAllPromotions());
        model.addAttribute("menu", "Promotions");
        model.addAttribute("submenu", "View All Promotions");
        model.addAttribute("adminUser",getUserName());
        return "admin/promotion-view";
    }
    
    @RequestMapping(value = "/search-roomtype-promotion", method = RequestMethod.POST)
    public String searchRoomTypeForPromotion(Model model,
            @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date sDate,
            @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date eDate){
        
        if(sDate.after(eDate)){
            return "redirect:/admin/add-promotion?message=End date must after Start date";
        }
        
        List<RoomTypeEntity> roomTypesUsed = roomTypeService.getRoomTypeInPromotion(sDate, eDate);
        List<RoomTypeEntity> roomTypes = roomTypeService.getListRoomTypes();
        List<RoomTypeEntity> rtUsed = new ArrayList<>();
        
        for(RoomTypeEntity rte:roomTypesUsed){
            for(RoomTypeEntity rte1:roomTypes){
                if(rte.getId()==rte1.getId()){
                    rtUsed.add(rte1);
                }
            }
        }
        
        for(RoomTypeEntity rte:rtUsed){
            roomTypes.remove(rte);
        }
        
              
        
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        model.addAttribute("today", simpleDateFormat.format(new Date()));
        model.addAttribute("inputsDat", simpleDateFormat.format(sDate));
        model.addAttribute("inputeDat", simpleDateFormat.format(eDate));
        model.addAttribute("sizeroomtypes", roomTypes.size());
        model.addAttribute("roomtypes", roomTypes);
        model.addAttribute("action", "add-promotion");
        model.addAttribute("menu", "Promotions");
        model.addAttribute("submenu", "Add Promotion");
        return "admin/promotion-add";
    }
    
    @RequestMapping("/add-promotion")
    public String addPromotionView(Model model,
            @RequestParam(name = "message", required = false) String message){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        model.addAttribute("today", simpleDateFormat.format(new Date()));
        model.addAttribute("sizeroomtypes", 0);
        model.addAttribute("action", "add-promotion");
        model.addAttribute("message", message);
        model.addAttribute("menu", "Promotions");
        model.addAttribute("submenu", "Add Promotion");
        model.addAttribute("adminUser",getUserName());
        return "admin/promotion-add";
    }
    
    @RequestMapping(value = "/add-promotion", method = RequestMethod.POST)
    public String addPromotion(Model model,
            @ModelAttribute("promotion") PromotionFormAdmin promotion,
            @RequestParam("files") MultipartFile[] files,
            HttpServletRequest request){
        PromotionEntity promotionEntity = new PromotionEntity();
        
        promotionEntity.setName(promotion.getName());
        promotionEntity.setDiscount(promotion.getDiscount());
        promotionEntity.setStartDate(promotion.getStartDate());
        promotionEntity.setEndDate(promotion.getEndDate());
        promotionEntity.setDescription(promotion.getDescription());
        if(CollectionUtils.isEmpty(promotion.getRoomTypes())){
            return "redirect:/admin/add-promotion?message=No RoomType. Please Select your roomType";
        }
        HashSet<RoomTypeEntity> roomtypes = new HashSet<>();
        for(String roomtype:promotion.getRoomTypes()){
            
            if(roomtype != null && roomtype != ""){
                roomtypes.add(roomTypeService.getRoomTypeById(Integer.parseInt(roomtype)));
            }
        }
        promotionEntity.setRoomTypes(roomtypes);
        
        
        List<ImageEntity> images = new ArrayList<>();

        String message = "";
        if (files != null && files.length > 0) {
            
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                
                try {
                    byte[] bytes = file.getBytes();
                    if(file.getSize()==0l){
                        continue;
                    }
                    ServletContext context = request.getServletContext();
                    String pathUrl = context.getRealPath("/images");

                    int index = pathUrl.indexOf("target");
                    String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
                    String nameGen = nameGenerater();
                    Path path = Paths.get(pathFolder + nameGen +file.getOriginalFilename());
                    Files.write(path, bytes);

                    // sau khi upload file xong lấy file name ra để insert vào database
                    String name = nameGen+file.getOriginalFilename();
                    ImageEntity image = new ImageEntity();
                    image.setName(name);
                    image.setPromotion(promotionEntity);
                    images.add(image);
                    message = message + "You successfully uploaded file " + name;
                } catch (Exception e) {
                    message = message + "You failed to upload  => " + e.getMessage();
                    model.addAttribute("action", "add-promotion");
                    model.addAttribute("message", message);
                    model.addAttribute("menu", "Promotions");
                    model.addAttribute("submenu", "Add Promotion");
                    return "admin/add-promotion";
                }
            }
            promotionEntity.setImages(images);
            
        } else {
            message = message + "Service was added without images " + " because the file was empty.";
            
        }
        promotionService.savePromotion(promotionEntity);
        
        return "redirect:/admin/view-promotion?message="+message;
        
    }
    
    @RequestMapping("/edit-promotion/{promotion-id}")
    public String editPromotionView(Model model,
            @PathVariable("promotion-id") int id,
            @RequestParam(name = "message", required = false) String message){
        
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        PromotionEntity promotion = new PromotionEntity();
        promotion = promotionService.findPromotionById(id);
        if(promotion.getId()>0){
        
        model.addAttribute("today", simpleDateFormat.format(new Date()));
        model.addAttribute("promotionEdit", promotionService.findPromotionById(id));
        model.addAttribute("sizeroomtypes", 0);
        model.addAttribute("action", "edit-promotion");
        model.addAttribute("message", message);
        model.addAttribute("menu", "Promotions");
        model.addAttribute("submenu", "Add Promotion");
        model.addAttribute("adminUser",getUserName());
        return "admin/promotion-edit";
        }
        return "redirect:/admin/404";
    }
    
    @RequestMapping(value = "/edit-promotion", method = RequestMethod.POST)
    public String editPromotion(Model model,
            @ModelAttribute("promotion") PromotionFormAdmin promotion,
            @RequestParam("files") List<MultipartFile> files,
            HttpServletRequest request){
        
        PromotionEntity promotionEntity = new PromotionEntity();
        
        promotionEntity.setId(promotion.getId());
        promotionEntity.setName(promotion.getName());
        promotionEntity.setDiscount(promotion.getDiscount());
        promotionEntity.setStartDate(promotion.getStartDate());
        promotionEntity.setEndDate(promotion.getEndDate());
        promotionEntity.setDescription(promotion.getDescription());
        HashSet<RoomTypeEntity> roomtypes = new HashSet<>();
        for(String roomtype:promotion.getRoomTypes()){
            
            if(roomtype != null && roomtype != ""){
                roomtypes.add(roomTypeService.getRoomTypeById(Integer.parseInt(roomtype)));
            }
        }
        promotionEntity.setRoomTypes(roomtypes);

        List<ImageEntity> images = new ArrayList<>();
        
        String message = "";
        if (null != files && files.size() > 0) {
            
            for (MultipartFile file : files) {
                if(file.getSize()==0l){
                    continue;
                }
                try {
                    byte[] bytes = file.getBytes();
                    
                    ServletContext context = request.getServletContext();
                    String pathUrl = context.getRealPath("/images");

                    int index = pathUrl.indexOf("target");
                    String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
                    
                    Path path = Paths.get(pathFolder  +file.getOriginalFilename());
                    Files.write(path, bytes);

                    // sau khi upload file xong lấy file name ra để insert vào database
                    String name = file.getOriginalFilename();
                    ImageEntity image = new ImageEntity();
                    image.setName(name);
                    image.setPromotion(promotionEntity);
                    images.add(image);
                    message = message + "You successfully uploaded file " + name;
                } catch (Exception e) {
                    message = "You dont have new image  => " + e.getMessage();
                    model.addAttribute("action", "add-promotion");
                    model.addAttribute("message", message);
                    model.addAttribute("menu", "Promotions");
                    model.addAttribute("submenu", "Add Promotion");
                    
                }
            }
            
            promotionEntity.setImages(images);
            
        } else {
            message = message + "Service was edit without new images " + " because the file was empty.";
            return "redirect:/admin/view-promotion?type=success&message="+message;
        }
        promotionService.savePromotion(promotionEntity);
        
        return "redirect:/admin/view-promotion?type=success&message=Edit Service successfull";
    }
    
    @RequestMapping("/view-comment")
    public String commentView(Model model){
        
        model.addAttribute("comments", commentService.getAllComments());
        model.addAttribute("votes", voteService.getAllVotes());
        model.addAttribute("menu", "Comment and Vote");
        model.addAttribute("submenu", "View Comment and Vote");
        model.addAttribute("adminUser",getUserName());
        return "admin/comment-vote-view";
        
    }
    
    @RequestMapping("/delete-comment/{comment-id}")
    public String deleteComment(Model model,
            @PathVariable("comment-id") int id){
        if(commentService.findCommentbyId(id).getId()>0){
        commentService.deleteComment(id);
        
        return "redirect:/admin/view-comment?type=success&message=delete comment success";
        }
        return "redirect:/admin/404";
        
    }
    
    @RequestMapping("/delete-vote/{vote-id}")
    public String deleteVote(Model model,
            @PathVariable("vote-id") int id){
        if(voteService.findVotebyId(id).getId()>0){
        voteService.deleteVote(id);
        
        return "redirect:/admin/view-comment?type=success&message=delete vote success";
        }
        return "redirect:/admin/404";
        
    }
    
    @RequestMapping(value = "/payment-card" , method = RequestMethod.POST)
    public String paymentCard(Model model,
            @ModelAttribute("creditCard") CreditCardEntity creditCard){
        
        CreditCardEntity cce = creditCardService.findByNumberCard(creditCard.getNumber());
        
        if(cce.getId() > 0 ){
            
            if (cce.getName().equalsIgnoreCase(creditCard.getName()) && cce.getExpDate().equals(creditCard.getExpDate()) && cce.getCcvCode() == creditCard.getCcvCode()) {

                if (creditCard.getExpDate().before(new Date())) {
                    return "redirect:/admin/check-out/"+creditCard.getId()+"?message=Invalid Card exp";
                } 
                
                if(cce.getBalance() > creditCard.getBalance()){
                    double newBalance = cce.getBalance() - creditCard.getBalance();
                    BookingEntity bookingE = bookingService.findbyId(creditCard.getId());
                    PaymentEntity payment = new PaymentEntity();
                    payment.setAmount(creditCard.getBalance());                                      
                    payment.setBooking(bookingE);
                    cce.setBalance(newBalance);
                    creditCardService.saveCreditCard(cce);
                    payment.setCreditCard(cce);
                    payment.setMethod(PaymentMethod.CREDIT_CARD);
                    payment.setPaymentDate(new Date());
                    payment.setStatus(PaymentStatus.PAYMENT_FINAL);
                    paymentService.savePayment(payment);
                    
                    return "redirect:/admin/check-out/"+creditCard.getId()+"?message=Payment Successful";
                }else{
                    return "redirect:/admin/check-out/"+creditCard.getId()+"?message=Credit Card Not Enough Money";
                }
                
                
            }else{
                
                return "redirect:/admin/check-out/"+creditCard.getId()+"?message=Invalid Card exp";
            }
                        
            
                                    
        }else{
            return "redirect:/admin/check-out/"+creditCard.getId()+"?message=Invalid CreditCard";
        }
        
        
    }
    
    @RequestMapping(value = "/payment-cash", method = RequestMethod.POST)
    public String paymentCash(Model model,
            @RequestParam("cashtotal") double total,
            @RequestParam("bookingidcash") int id) {
        BookingEntity bookingE = bookingService.findbyId(id);
        PaymentEntity payment = new PaymentEntity();
        payment.setAmount(total);
        payment.setBooking(bookingE);        
        
        payment.setMethod(PaymentMethod.CASH_ON_DELIVERY);
        payment.setPaymentDate(new Date());
        payment.setStatus(PaymentStatus.PAYMENT_FINAL);
        paymentService.savePayment(payment);
        return "redirect:/admin/check-out/"+id+"?message=Payment Successful";
    }
    
    @RequestMapping("/view-payment")
    public String paymentView(Model model){
        
        model.addAttribute("payments", paymentService.getAllPayment());
        model.addAttribute("menu", "Payment");
        model.addAttribute("submenu", "View All Payments");
        model.addAttribute("adminUser",getUserName());
        return "admin/payment-view";
    }
    
    public String nameGenerater() {
        
        String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        int length = 7;
        for (int i = 0; i < length; i++) {

            int index = random.nextInt(alphabet.length());

            char randomChar = alphabet.charAt(index);

            sb.append(randomChar);
        }

        String randomString = sb.toString();
        return randomString.toLowerCase();
    }
    public static Date getFirstDateOfMonth(Date date){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));
        return cal.getTime();
    }
    
    public static Date getLastDateOfMonth(Date date){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        return cal.getTime();
    }
    
    public static LocalDate datetoLocal(Date date){
        
        ZoneId defaultZoneId = ZoneId.systemDefault();
		
	Instant instant = date.toInstant();
	
	LocalDate localDate = instant.atZone(defaultZoneId).toLocalDate();
        return localDate;
    }
    
    public static String getUserName() {        
        String username = "";
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) principal;                
                username = userDetails.getUsername();
            }
        }
        return username;
    }
}
