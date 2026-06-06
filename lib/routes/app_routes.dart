import 'package:e_commerce/features/authentication/screens/onboarding_screen/onboarding_screen.dart';
import 'package:e_commerce/features/personalization/screens/address/address.dart';
import 'package:e_commerce/features/personalization/screens/edit_profile/edit_profile.dart';
import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../features/authentication/screens/forget_password/forget_password.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class UAppRoutes {
  static final screens = [
    GetPage(name: URoutes.home, page: () => NavigationMenu()),
    GetPage(name: URoutes.store, page: () => StoreScreen()),
    GetPage(name: URoutes.wishList, page: () => WishlistScreen()),
    GetPage(name: URoutes.profile, page: () => ProfileScreen()),
    GetPage(name: URoutes.order, page: () => OrderScreen()),
    GetPage(name: URoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: URoutes.cart, page: () => CartScreen()),
    GetPage(name: URoutes.editProfile, page: () => EditProfileScreen()),
    GetPage(name: URoutes.userAddress, page: () => AddressScreen()),
    GetPage(name: URoutes.signup, page: () => SignupScreen()),
    GetPage(name: URoutes.verifyEmail, page: () => VerifyEmailScreen()),
    GetPage(name: URoutes.signIn, page: () => LoginScreen()),
    GetPage(name: URoutes.forgetPassword, page: () => ForgetPassWordScreen()),
    GetPage(name: URoutes.onBoarding, page: () => OnboardingScreen()),
  ];
}
