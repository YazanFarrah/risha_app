import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/features/account/bindings/account_edit_bindings.dart';
import 'package:risha_app/features/account/bindings/account_settings_bindings.dart';
import 'package:risha_app/features/account/bindings/account_reset_password_binding.dart';
import 'package:risha_app/features/account/bindings/categories_bindings.dart';
import 'package:risha_app/features/account/presentation/screens/account_categories_screen.dart';
import 'package:risha_app/features/account/presentation/screens/account_edit_screen.dart';
import 'package:risha_app/features/account/presentation/screens/account_reset_password_screen.dart';
import 'package:risha_app/features/account/presentation/screens/account_settings_screen.dart';
import 'package:risha_app/features/auth/presentation/screens/auth_login_screen.dart';
import 'package:risha_app/features/auth/presentation/screens/auth_signup_screen.dart';
import 'package:risha_app/features/home/bindings/home_bindings.dart';
import 'package:risha_app/features/shared/bindings/notifications_bindings.dart';
import 'package:risha_app/features/shared/presentation/screens/nav_bar.dart';
import 'package:risha_app/features/auth/bindings/auth_binding.dart';
import 'package:get/get.dart';
import 'package:risha_app/features/shared/presentation/screens/notifications_screen.dart';
import 'package:risha_app/features/shared/presentation/screens/user_state_screen.dart';

class AppRouter {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutePaths.userState,
      page: () => const UserState(),
    ),
    GetPage(
      name: RoutePaths.navScreen,
      page: () => NavBar(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutePaths.login,
      page: () => const AuthLoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutePaths.signup,
      page: () => const AuthSignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutePaths.settings,
      page: () => const AccountSettingsScreen(),
      binding: AccountBindings(),
    ),
    GetPage(
      name: RoutePaths.accountEdit,
      page: () => const AccountEditScreen(),
      binding: AccountEditBindings(),
    ),
    GetPage(
      name: RoutePaths.categories,
      page: () => const AccountCategoriesScreen(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: RoutePaths.accountResetPassword,
      page: () => const AccountResetPasswordScreen(),
      binding: AccountResetPasswordBinding(),
    ),
    GetPage(
      name: RoutePaths.notifications,
      page: () => const NotificationsScreen(),
      binding: NotificationsBindings(),
    ),
  ];
}
