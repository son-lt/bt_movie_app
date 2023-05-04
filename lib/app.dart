import 'package:bt_movie_app/common/app_disable_glow_behavior.dart';
import 'package:bt_movie_app/ui/pages/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Movie App',
            theme: ThemeData(
              textTheme: GoogleFonts.beVietnamProTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: DisableGlowBehavior(),
                child: child!,
              );
            },
            home: const HomeScreen(),
          );
        });
  }
}
