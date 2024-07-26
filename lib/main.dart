import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/services/service_locator.dart';
import 'package:cinemate/core/utils/determine_initial_route.dart';
import 'package:cinemate/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ServicesLocator().init();
  final pageRoute = await determineInitialRoute();
  runApp(MyApp(pageRoute: pageRoute));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.pageRoute});

  final String pageRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: OnGenerateRoute.routes,
      initialRoute: pageRoute,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: Builder(builder: (context) {
            return ResponsiveScaledBox(
              width: ResponsiveValue<double>(context, conditionalValues: [
                const Condition.between(start: 0, end: 450, value: 375),
                const Condition.between(start: 450, end: 800, value: 500),
                const Condition.between(start: 800, end: 1100, value: 600),
                const Condition.between(start: 1100, end: 1400, value: 680),
                const Condition.between(start: 1400, end: 9999, value: 900),
              ]).value,
              child: child!,
            );
          }),
        );
      },
    );
  }
}
