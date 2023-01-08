import 'package:beta/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // login pic
          SvgPicture.asset(
            'assets/pics/ice_cream.svg',
            //color: primaryColor,
            height: 69,
          ),

          //SvgPicture.asset('ice_cream.svg'),

          // email input

          // password input

          // submit

          // sign-up prompt
        ]),
      )),
    );
  }
}
