import 'package:flutter/material.dart';
import 'package:my_extension/my_extension.dart';
import 'package:onborading_page/views/onboarding_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: context.theme.copyWith(
          scaffoldBackgroundColor: context.colorScheme.background,
        ),
        debugShowCheckedModeBanner: false,
        home: const OnboardingPage());
  }
}
