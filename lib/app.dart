import 'package:bt_movie_app/common/app_disable_glow_behavior.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/detail_view_model.dart';
import 'package:bt_movie_app/ui/pages/home_screen/home_page.dart';
import 'package:bt_movie_app/ui/pages/home_screen/home_view_model.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_view_model.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/upcoming_releases_list/upcoming_releases_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DetailViewModel>(
          create: (BuildContext context) {
            return DetailViewModel();
          },
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) {
            return HomeViewModel();
          },
        ),
        ChangeNotifierProvider<MostPopularViewModel>(
          create: (BuildContext context) {
            return MostPopularViewModel();
          },
        ),
        ChangeNotifierProvider<UpcomingReleasesViewModel>(
          create: (BuildContext context) {
            return UpcomingReleasesViewModel();
          },
        ),
      ],
      child: MaterialApp(
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
        home: const HomePage(),
      ),
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
