import 'package:chatgpt/design/app.theme.dart';
import 'package:chatgpt/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}
