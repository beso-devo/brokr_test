import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'core/di/injection_container.dart';
import 'core/util/constants.dart';
import 'core/util/custom_scroll_behavior.dart';
import 'core/util/generate_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final prefs = getIt<SharedPreferences>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          theme: ThemeData(fontFamily: "Josefin"),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              ),
              child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: child!,
              ),
            );
          },
          initialRoute: GeneralScreens.SPLASH_PAGE,
          onGenerateRoute: GenerateScreen.onGenerate,
        );
      },
    );
  }
}
