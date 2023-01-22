import 'package:beta/utils/palette.dart';
import 'package:beta/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _usernameController.dispose();
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

          // blank avatar
          Stack(
            children: [
              const CircleAvatar(
                radius: 69,
                backgroundImage: AssetImage("assets/pics/default.png"),
              ),
              Positioned(
                bottom: -12,
                left: 90,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_a_photo),
                ),
              ),
            ],
          ),

          // for spacing
          const SizedBox(
            height: 30,
          ),

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

          // username input
          TextInput(
            hintText: 'Enter username',
            textInputType: TextInputType.text,
            textEditingController: _usernameController,
          ),

          // for spacing
          const SizedBox(
            height: 30,
          ),

          // password input
          TextInput(
            hintText: 'Enter password',
            textInputType: TextInputType.emailAddress,
            textEditingController: _passController,
            isPass: true,
          ),

          // for spacing
          const SizedBox(
            height: 30,
          ),

          // submit
          InkWell(
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

        ]),
      )),
    );
  }
}
