import 'package:flutter/material.dart';
import 'package:untitled1/core/view/registration_screen.dart';

import '../common/wdgets/background_image.dart';
import '../common/wdgets/bottom_text.dart';
import '../common/wdgets/reuseable_elevated_button.dart';
import '../common/wdgets/text_feild_style.dart';
import '../common/wdgets/text_style.dart';



class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Set Password",
                      style: titleTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Minimum length password 8 character with Latter and number combination ",
                      style: subtitleTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      validator: (String? text) {
                        return null;
                      },
                      decoration: textFeildStyle("Password"),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: conformPasswordController,
                      validator: (String? text) {
                        return null;
                      },
                      //reuse form feild decoration
                      decoration: textFeildStyle("Conform Password"),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    //reuse elevated button
                    ReuseableElevatedButton(text:"Confirm",onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    //reuse bottom text
                    BottomText(

                        onTap: () {
                                                  },
                        buttonText: "Sign in",
                        firstText: "Have Account?")
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
