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
  static const String emailIdHint ='Enter Your Email Id';
  static const String password = 'Password';
  static const String passwordHint = 'Enter Your Password';
  static const String question = 'Don\'t You Have an Account?';
  static const String login =  'Login';
  static const String register = 'Register';
}
class RegisterPageStrings {
  static const String register = 'Register';
  static const String yourName = 'Your Name';
  static const String yourNameHint = 'Enter Your Name';
  static const String emailId =' Email Id';
  static const String emailIdHint ='Enter Your Email Id';
  static const String password = 'Password';
  static const String passwordHint = 'Enter Your Password';
  static const String confirmPassword = 'Confirm Password';
  static const String confirmPasswordHint = 'Enter Your Password';
  static const String contactNumber = 'Contact Number';
  static const String contactNumberHint ='Enter Your Contact Number';
  static const String question = 'Already Have an Account?';
  static const String orContinueWith = 'Or Continue With';
  static const String login =  'Login';

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
  static const String descriptionContent = 'Green apples have less sugar and carbs, and more fiber, protein, potassium, iron, and vitamin K,'
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
  static const String pinCodeSnackBar = 'PinCode must be numeric and have 6 characters';
}
class EditAddressStrings {
  static const String appbarTitle = 'Edit Address';
}
class FaqStrings {
  static const String appBarTitle = 'FAQ';
  static const String question1 = 'Where do you Deliver?';
  static const String content1 = 'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products with a wide range of product selection in the online store and proceed to checkout or just call customer care and place an order. i.e. 1800-123-1947';
  static const String question2 = 'How can I order ar SG Grocery?';
  static const String content2 = 'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products with a wide range of product selection in the online store and proceed to checkout or just call customer care and place an order. i.e. 1800-123-1947';
  static const String question3 = 'How do I know at what time I will receive my Delivery?';
  static const String content3 = 'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products with a wide range of product selection in the online store and proceed to checkout or just call customer care and place an order. i.e. 1800-123-1947';
  static const String question4 = 'What is minimum order value?';
  static const String content4 = 'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products with a wide range of product selection in the online store and proceed to checkout or just call customer care and place an order. i.e. 1800-123-1947';
  static const String question5 = 'What if I want to return something?';
  static const String content5 = 'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products with a wide range of product selection in the online store and proceed to checkout or just call customer care and place an order. i.e. 1800-123-1947';
  static const String titleQuestion = 'Not Listed Your Question/Query?';
  static const String hintText = 'Write your Question/Query here';
  static const String buttonName = 'Submit';
}
class MyOrdersStrings{
  static const String appBarTitle = 'My Orders';
  static const String title = 'Order History';
}
class ContactUsStrings{
  static const String appBarTitle = 'Contact Us';
  static const String getInTouch = 'Get In Touch!';
  static const String getInTouchDetail = 'One of our workspace experts will reach out to you based on your communicatoin preferences.';
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
  static const String content1 = 'What began little, with a solitary idea of a store that provides rebate and the basic thought of moving more for less, has become in the course of the last 10 years into the biggest retailer in this whole country.';
  static const String content2 = 'Every week, about 265 million clients and individuals visit our in excess of 13,200 stores under 55 standards in 27 nations and eCommerce sites in 4 nations. With financial year 2018 income of \$500.3 billion, ‘Organization Name’ utilizes over 2.2 million partners around the world.';
  static const String content3 = 'SG Grocery keeps on being an innovator in support ability, corporate magnanimity and work opportunity. It’s everything part of our relentless promise to making openings and conveying an incentive to clients and networks the world over.';
  static const String whyChooseUs = '~ Why Choose us? ~';
  static const String weDoNot = 'We do not buy from the open market & traders.';
  static const String detail = 'We would like to give the best to our valuable customer that’s why our experts check quality of every products before we deliver it to you and promises to do further to keep faith constant.';
  static const String organic = '100% Organic Food';
  static const String fastDelivery = 'Fast Delivery';
  static const String service = '24/7 Service';
  static const String secure = 'Secure Payment';
  static const String privacyPolicy = 'Privacy Policy';
  static const String termsAndServices = 'Terms And Services';
}