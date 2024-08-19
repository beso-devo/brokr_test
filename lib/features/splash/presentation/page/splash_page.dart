import 'dart:async';
import 'package:brokr/features/splash/presentation/provider/splash_logic.dart';
import 'package:brokr/features/splash/presentation/provider/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/generate_screen.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    Future.delayed((const Duration(milliseconds: 1000))).then((c) {
      Navigator.pushNamedAndRemoveUntil(
          context, GeneralScreens.SIGN_UP, (route) => false);
      /// Here we can read the user loggedin status field in shared or whatever..
      /// ref.read(splashLogicProvider.notifier).mapToCheckUserStatus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        SplashState state = ref.watch(splashLogicProvider);
        goToTruthPage(state.userStatus);

        return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: AppBar(
                backgroundColor: MAIN1,
                elevation: 0.0,
              )),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: MAIN1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/waving-hand.png',
                    height: 150,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    "Brokr App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void goToTruthPage(int status) {
    print("Hello the status is: $status");
    switch (status) {
      case -2:
        Navigator.pushNamedAndRemoveUntil(
            context, GeneralScreens.SIGN_UP, (route) => false);
        break;
      // case 1:
      //   Navigator.pushNamedAndRemoveUntil(
      //       context, GeneralScreens.MAIN_PAGE, (route) => false);
      //   break;
    }
  }
}
