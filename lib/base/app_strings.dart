class DatabaseStrings {
  static const String databaseName = 'address.db';
  static const String tableName = 'addressTable';
  static const String createDB =
      'CREATE TABLE addressTable (id INTEGER PRIMARY KEY AUTOINCREMENT, country TEXT, state TEXT, city TEXT, pincode TEXT, type TEXT, isCheck INTEGER DEFAULT 0)';
}

class NavbarStrings {
  static const String home = 'Home';
  static const String explore = 'Explore';
  static const String cart = 'Cart';
  static const String favourite = 'Favourite';
  static const String account = 'Account';
}

class SplashStrings {
  static const String slogan = 'Your needs in just one place';
}

class LoginPageStrings {
  static const String logoFacebook = 'Facebook';
  static const String logoGoogle = 'Google';
  static const String emailId = 'Email Id';
  static const String emailIdHint = 'Enter Your Email Id';
  static const String password = 'Password';
  static const String passwordHint = 'Enter Your Password';
  static const String orContinueWith = 'Or Continue With';
  static const String question = 'Don\'t You Have an Account?';
  static const String login = 'Login';
  static const String register = 'Register';
  static const String noUserFound = 'No user found for that email.';
  static const String wrongPass = 'Wrong password provided for that user.';
}

class RegisterPageStrings {
  static const String register = 'Register';
  static const String yourName = 'Your Name';
  static const String yourNameHint = 'Enter Your Name';
  static const String emailId = ' Email Id';
  static const String emailIdHint = 'Enter Your Email Id';
  static const String password = 'Password';
  static const String passwordHint = 'Enter Your Password';
  static const String confirmPassword = 'Confirm Password';
  static const String confirmPasswordHint = 'Enter Your Password';
  static const String contactNumber = 'Contact Number';
  static const String contactNumberHint = 'Enter Your Contact Number';
  static const String question = 'Already Have an Account?';
  static const String orContinueWith = 'Or Continue With';
  static const String login = 'Login';
  static const String weakPass = 'The password provided is too weak.';
  static const String duplicateEmail = 'The account already exists for that email.';
}

class HomePageStrings {
  static const String hintSearch = 'Search products and brands';
  static const String topCategories = 'Top Categories';
  static const String topProducts = 'Top Products';
  static const String exploreAll = 'Explore All';
  static const String shopNow = 'Shop Now';
  static const String dealsOfTheWeek = 'Deals Of The Week';
  static const String featureItems = 'Feature Items';
}

class ExplorePageStrings {
  static const String appbarTitle = 'Explore';
  static const String groceries = 'Groceries';
  static const String vegetables = 'Vegetables';
  static const String fruits = 'Fruits';
  static const String dairyProducts = 'Dairy Products';
  static const String bakeryItems = 'Bakery Items';
  static const String seeAll = 'See all';
}

class FruitPageStrings {
  static const String appbarTitle = 'Fruits';
  static const String subscribe = 'Subscribe';
  static const String subscribed = 'Subscribed';
  static const String buyOnce = 'Buy Once';
}

class CartPageStrings {
  static const String appbarTitle = 'My Cart';
  static const String ticketCode = 'code';
  static const String ticket1Code = 'GETFIRST';
  static const String ticket2Code = 'DOLLAR5';
  static const String ticket1TextFirst = 'FLAT';
  static const String ticket1TextSecond = '50% off';
  static const String ticket1TextThird = 'on your first order';
  static const String ticket1TextFourth = 'Use coupon code to get OFFER';
  static const String ticket2TextFirst = 'Get';
  static const String ticket2TextSecond = '\$5 off';
  static const String ticket2TextThird = 'on minimum purchase of \$20';
  static const String ticket2TextFourth = 'Applicable on Grocery only..';
  static const String promoCode = 'Promo code can be applied on payment screen';
  static const String paymentDetails = 'Payment details';
  static const String totalMRP = 'TotalMRP';
  static const String discount = 'Discount';
  static const String shippingCharges = 'Shipping Charges';
  static const String totalMRPValue = '\$9.97';
  static const String discountValue = '\$0.00';
  static const String shippingChargesValue = 'Free';
  static const String total = 'Total';
  static const String totalValue = '\$9.97';
  static const String checkoutButton = 'Checkout';
}

class FavouritePageStrings {
  static const String appbarTitle = 'My Favourite';
}

class AccountPageStrings {
  static const String profile = 'Profile';
  static const String name = 'George D.';
  static const String email = '@george31';
  static const String myOrders = 'My orders';
  static const String mySubscriptions = 'My Subscriptions';
  static const String myAddresses = 'My Addresses';
  static const String faq = 'FAQ';
  static const String contactUs = 'Contact Us';
  static const String about = 'About';
  static const String logOut = 'Log Out';
}

class DetailsPageStrings {
  static const String details = 'Details';
  static const String specialPrice = 'Special price';
  static const String saleOff = '(42% off)';
  static const String description = 'Description';
  static const String descriptionContent =
      'Green apples have less sugar and carbs, and more fiber, protein, potassium, iron, and vitamin K,'
      ' taking the lead as a healthier variety, although the differences are ever so slight.';
  static const String relatedItems = 'Related items';
  static const String pinapple = 'Pinapple';
  static const String strawberry = 'Strawberry';
  static const String grapes = 'Grapes';
}

class SubscriptionStrings {
  static const String appbarTitle = 'My Subscription';
  static const String today = 'Today';
  static const String date = '(23 September 2021)';
}

class MyAddressesStrings {
  static const String appbarTitle = 'My Addresses';
  static const String addNewAddress = 'Add New Address';
}

class AddNewAddressStrings {
  static const String appbarTitle = 'Add New Address';
  static const String country = 'Country';
  static const String state = 'State';
  static const String city = 'City';
  static const String pincode = 'Pincode';
  static const String home = 'Home';
  static const String office = 'Office';
  static const String workOffice = 'Work/Office';
  static const String other = 'Other';
  static const String save = 'Save';
  static const String pinCodeSnackBar =
      'PinCode must be numeric and have 6 characters';
}

class EditAddressStrings {
  static const String appbarTitle = 'Edit Address';
}

class FaqStrings {
  static const String appBarTitle = 'FAQ';
  static const String question1 = 'Where do you Deliver?';
  static const String content1 =
      'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products with a wide range of product selection in the online store and proceed to checkout or just call customer care and place an order. i.e. 1800-123-1947';
  static const String question2 = 'How can I order ar SG Grocery?';
  static const String content2 =
      'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products with a wide range of product selection in the online store and proceed to checkout or just call customer care and place an order. i.e. 1800-123-1947';
  static const String question3 =
      'How do I know at what time I will receive my Delivery?';
  static const String content3 =
      'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products with a wide range of product selection in the online store and proceed to checkout or just call customer care and place an order. i.e. 1800-123-1947';
  static const String question4 = 'What is minimum order value?';
  static const String content4 =
      'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products with a wide range of product selection in the online store and proceed to checkout or just call customer care and place an order. i.e. 1800-123-1947';
  static const String question5 = 'What if I want to return something?';
  static const String content5 =
      'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products with a wide range of product selection in the online store and proceed to checkout or just call customer care and place an order. i.e. 1800-123-1947';
  static const String titleQuestion = 'Not Listed Your Question/Query?';
  static const String hintText = 'Write your Question/Query here';
  static const String buttonName = 'Submit';
}

class MyOrdersStrings {
  static const String appBarTitle = 'My Orders';
  static const String title = 'Order History';
}

class ContactUsStrings {
  static const String appBarTitle = 'Contact Us';
  static const String getInTouch = 'Get In Touch!';
  static const String getInTouchDetail =
      'One of our workspace experts will reach out to you based on your communicatoin preferences.';
  static const String yourDetails = 'Your Details';
  static const String firstName = 'First Name';
  static const String lastName = 'Last Name';
  static const String email = 'Email';
  static const String phoneNumber = 'Phone Number';
  static const String addInfo = 'Additional Info';
  static const String buttonName = 'Send Message';
  static const String addressInfo = '2464 Royal Ln. Mesa, New Jersey 45463';
  static const String phoneInfo = '+1 (773) 600-4866 , +1 (773) 600-4875';
  static const String emailInfo = 'sggrocery@gmail.com';
}

class AboutStrings {
  static const String appBarTitle = 'About';
  static const String content1 =
      'What began little, with a solitary idea of a store that provides rebate and the basic thought of moving more for less, has become in the course of the last 10 years into the biggest retailer in this whole country.';
  static const String content2 =
      'Every week, about 265 million clients and individuals visit our in excess of 13,200 stores under 55 standards in 27 nations and eCommerce sites in 4 nations. With financial year 2018 income of \$500.3 billion, ‘Organization Name’ utilizes over 2.2 million partners around the world.';
  static const String content3 =
      'SG Grocery keeps on being an innovator in support ability, corporate magnanimity and work opportunity. It’s everything part of our relentless promise to making openings and conveying an incentive to clients and networks the world over.';
  static const String whyChooseUs = '~ Why Choose us? ~';
  static const String weDoNot = 'We do not buy from the open market & traders.';
  static const String detail =
      'We would like to give the best to our valuable customer that’s why our experts check quality of every products before we deliver it to you and promises to do further to keep faith constant.';
  static const String organic = '100% Organic Food';
  static const String fastDelivery = 'Fast Delivery';
  static const String service = '24/7 Service';
  static const String secure = 'Secure Payment';
  static const String privacyPolicy = 'Privacy Policy';
  static const String termsAndServices = 'Terms And Services';
}

class PrivacyPolicyStrings {
  static const String appBarTitle = 'Privacy Policy';
  static const String privacyPolicy = 'Privacy Policy';
  static const String lastUpdate = 'Last update on Nov,2021';
  static const String privacyPolicyDetail =
      'SG Grocery is committed to protecting your privacy. This Privacy Policy explains our data processing practices and your options regarding the ways in which your personal data is used. If you have concerning your personal information or any questions please contact us to given email at customercare@SGGrocery.us please note that the practices of SG grocery with respect to data collected and used by Grocery Factory only in connection with this website with links to this policy are governed by Grocery Factory privacy policy ("Privacy Policy") as amended from time to time and not the privacy policy in effect at the time the data was collected. Please regularly review our Privacy Policy. If you have objections to the Privacy Policy, you can immediately contact us.';
  static const String informationCollected = 'Information collected:';
  static const String informationCollectedDetail1 =
      'SG grocery collects the details provided by you on registration together with information we learn about you from your use of our service and your visits to our website. We also collect information about the transactions you undertake including details of payment cards used. We may collect additional information in connection with your participation in any promotions or competitions offered by us and information you provide when giving us feedback or completing profile forms. We also monitor customer traffic patterns and site usage which enables us to improve the services we provide.';
  static const String informationCollectedDetail2 =
      'Use of your information and your preferences: We will use your information to provide and personalize our service. We will also use your contact details to regularly communicate with you. We may use your information to send you to offer and news from Grocery Factory and services, for this we may contact you by post, email, or telephone for these purposes. We like to hear your views to help us improve our service.';
  static const String useOf = 'Use of your information and your preferences:';
  static const String useOfDetail =
      'We will use your information to provide and personalize our service. We will also use your contact details to regularly communicate with you. We may use your information to send you to offer and news from SG Groecery and services, for this we may contact you by post, email, or telephone for these purposes. We like to hear your views to help us improve our service.';
  static const String legal = 'Legal Disclaimer:';
  static const String legalDetail =
      'We reserve the right to disclose your personally identifiable information as required by law and when believe it is necessary to share information in order to investigate, prevent, or take action regarding illegal activities, suspected fraud, situations involving potential threats to the physical safety of any person, violations of SG Grocery in terms of use, or as otherwise required by law.';
  static const String change = 'Changes in this Privacy Statement:';
  static const String changeDetail =
      'SG Grocery reserve the right to modify this privacy statement at any time, so please review it time to time. If we make material changes to this policy, we will notify you here.';
}

class TermsOfServicesStrings {
  static const String appBarTitle = 'Terms of services';
  static const String termsAndConditions = 'Terms and Conditions';
  static const String detailBold =
      'WELCOME TO ALL SG Grocery, LLC AND THANK YOU FOR REGISTERING WITH US! IT IS IMPORTANT THAT YOU REVIEW THIS AGREEMENT BECAUSE, BY ACCESSING THIS WEBSITE, BY PLACING AN ORDER WITH US BY TELEPHONE, EMAIL, FAX, OR THROUGH THIS WEBSITE, YOU ARE AGREEING TO THE TERMS AND CONDITIONS THAT GOVERN THE USE OF THE SITE AND THE TERMS UPON WHICH WE AGREE TO DELIVER TO YOU.';
  static const String detail =
      'By placing an order with us by telephone, fax, email, or online, you agree to the terms of this Agreement (the “Agreement”) which shall cover the terms of our deliveries to you and your use of our website. This Agreement is between you and All Seasons Grocery, LLC (the “Company” or “All Seasons Grocery”) that states the terms and conditions under which you may use the Site and receive deliveries from us. All Seasons Grocery is the owner of the following trademarks: All Seasons Grocery, www.allseasonsgrocery.com, and the All Seasons Grocery logo. This Agreement is binding on you whether you purchase from us via the telephone, email, fax, or our website.';
  static const String ourDelivery = 'OUR DELIVERY SERVICE';
  static const String ourDeliveryDetail =
      'When you place an order, we use all reasonable efforts to deliver to you at the time of your choosing or by 5:00 pm on the day of your arrival. Once you place your order by telephone, fax, email, or online, we will act as bailee for the ordered products. You can modify an existing order at any time up until the order leaves the store by calling our customer service number at 435-655-5071 or 435-655-1914. Please note that we reserve the right to refuse service to anyone. We reserve the right to change the cost of deliveries and/or our delivery fees at any time';
  static const String price = 'PRICE AND AVAILABILITY';
  static const String priceDetail =
      'From time to time, products you order may be unavailable. If we are unable to fulfill your entire order, we will make every reasonable effort to substitute the closest product. We do not set the prices for the items you select on your grocery list. We pay the prices that each individual store has already set. To receive delivery, you do not need to be present to receive your order from our driver. In the case of bad weather or unforeseen delivery complications, deliveries may be delayed. We will make every effort to get your groceries to you by 5:00 pm on the date of your arrival.';
  static const String payment = 'PAYMENT';
  static const String paymentDetail =
      'We accept only credit/debit cards. In the event your card is declined, we reserve the right to collect funds for any uncollected transactions owed us should a payment made via credit card be declined. If you fail to pay any fees or charges when due, we may charge such amount directly to the credit card identified in your Customer Account Information and we may suspend or terminate your access to our Service. You shall be responsible and liable for any fees, including but not limited to attorney’s fees and collection costs, that we may incur in our efforts to collect any unpaid balances from you.';
}

class PaymentStrings {
  static const String appBarTitle = 'Payment';
  static const String contactDetails = 'Contact Details';
  static const String chooseDelivery = 'Choose Delivery Address';
  static const String question = 'Do you have a promo code / Coupon?';
  static const String enterCode = 'Enter your code';
  static const String applyButton = 'Apply Now';
  static const String choosePayment = 'Choose payment method';
  static const String cod = 'Cash On Delivery';
  static const String upi = 'UPI';
  static const String wallet = 'Wallet';
  static const String card = 'Credit/Debit Card';
  static const String addNewCard = 'Add New Card';
  static const String enterCvv = 'Enter CVV';
  static const String hintCvv = 'e.g.123';
  static const String pay = 'Pay \$9.97';
  static const String text =
      'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our ';
  static const String privacy = 'privacy policy.';
}

class MyWalletStrings {
  static const appBarTitle = 'My Wallet';
  static const myBalance = 'My Balance';
  static const percent = '\$20';
  static const use = 'Use to pay 100% on any orders';
}
