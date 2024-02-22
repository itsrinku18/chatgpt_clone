import 'package:chatgpt/design/app_colors.dart';
import 'package:chatgpt/features/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenBgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              SizedBox(
                height: 200,
                width: 240,
                child: SvgPicture.asset(
                  "assets/img.svg",
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Welcome to ChatGpt",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.pinkBgColor),
              ),
              const SizedBox(height: 16),
              Text(
                "Our Work to create safe and beneficial AI requires a deep understanding of the potential risks and benefits as well as careful consideration of the impact.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: AppColors.pinkBgColor),
              ),
              Spacer(),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.pinkBgColor))),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen() ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Try ChatGpt",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, color: AppColors.pinkBgColor),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.pinkBgColor,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
