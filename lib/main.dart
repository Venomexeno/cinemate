import 'package:cinemate/core/constants/app_routes.dart';
import 'package:cinemate/on_generate_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: OnGenerateRoute.routes,
      initialRoute: AppRoutes.authPageRoute,
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
