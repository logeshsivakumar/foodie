import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:foodie_app/Rounded_password_field.dart';
import 'package:foodie_app/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie_app/rounded_input_field.dart';
import 'package:foodie_app/roundedbutton.dart';

import 'package:foodie_app/center_page.dart';

class Body extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Foodie",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/images/login1.png",
            height: 500,
            width: 500,
          ),
          RoundedInputField(
            hintText: "Your Mail",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "LOGIN",
            press: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CenterPage(
                            title: "Foodie",
                          )));
            },
          )
        ],
      ),
    ));
  }
}
