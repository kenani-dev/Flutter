import 'package:beta/utils/palette.dart';
import 'package:beta/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(flex: 2, child: Container()),

          // login pic
          SvgPicture.asset(
            'assets/pics/ice_cream.svg',
            //color: primaryColor,
            height: 269,
          ),
          const SizedBox(height: 69),

          // email input
          TextInput(
            hintText: 'Enter email',
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailController,
          ),

          // for spacing
          const SizedBox(
            height: 30,
          ),

          // password input
          TextInput(
            hintText: 'Enter password',
            textInputType: TextInputType.emailAddress,
            textEditingController: _passwordController,
            isPass: true,
          ),

          // for spacing
          const SizedBox(
            height: 30,
          ),

          // submit
          InkWell(
            onTap: (() {
              
            }),
            child: Container(
              child: const Text('Submit'),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  //color: Color.fromARGB(0, 255, 255, 255)
                  color: tertiaryColor),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Flexible(
            flex: 2,
            child: Container(),
          ),

          // sign-up prompt
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text("New user?"),
                padding: const EdgeInsets.symmetric(
                  vertical: 9,
                ),
              ),
              GestureDetector(
                onTap: (() {
                  
                }),
                child: Container(
                  child: const Text(
                    "Register here.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 9,
                  ),
                ),
              ),
            ],
          ),
        ]),
      )),
    );
  }
}
