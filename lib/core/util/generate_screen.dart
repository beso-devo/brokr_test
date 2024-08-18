import 'package:brokr/features/add_new_beneficiary/presentation/page/add_new_beneficiary_riverpod_page.dart';
import 'package:flutter/material.dart';
import '../../features/main_page/presentation/pages/main_page.dart';
import '../../features/sign_in/presentation/pages/sign_in_page.dart';
import '../../features/sign_up/presentation/pages/continue_as_guest_page.dart';
import '../../features/sign_up/presentation/pages/sign_up_page.dart';
import '../../features/splash/presentation/page/splash_page.dart';

class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String? name = value.name;
    print("the name is $name");
    final args = value.arguments;
    switch (name) {
      case GeneralScreens.SPLASH_PAGE:
        return MaterialPageRoute(builder: (context) => SplashPage());

      case GeneralScreens.SIGN_IN:
        return MaterialPageRoute(builder: (context) => SignInPage());

      case GeneralScreens.SIGN_UP:
        return MaterialPageRoute(builder: (context) => SignUpPage());

      case GeneralScreens.CONTINUE_AS_GUEST:
        return MaterialPageRoute(builder: (context) => ContinueAsGuestPage());

      case GeneralScreens.MAIN_PAGE:
        return MaterialPageRoute(builder: (context) => MainPage());

      case GeneralScreens.ADD_BENEFICIARY:
        return MaterialPageRoute(builder: (context) => AddNewBeneficiaryRiverPodPage());

      // case GeneralScreens.TOP_UP_BENEFICIARY:
      //   return MaterialPageRoute(
      //       builder: (context) =>
      //           BeneficiaryTopUpPage((args as Map)["beneficiary"]));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

class GeneralScreens {
  static const String SPLASH_PAGE = "/";
  static const String SIGN_IN = "/sign_in";
  static const String SIGN_UP = "/sign_up";
  static const String CONTINUE_AS_GUEST = "/sign_up_guest";
  static const String MAIN_PAGE = "/admin-main-pages";
  static const String ADD_BENEFICIARY = "/add-beneficiary";
  static const String TOP_UP_BENEFICIARY = "/top-up-beneficiary";
}
