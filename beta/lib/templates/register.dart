import 'package:beta/output/authorizations.dart';
import 'package:beta/utils/palette.dart';
import 'package:beta/widgets/text_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:beta/utils/tools.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
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
              _image!=null?CircleAvatar(
                radius: 69,
                backgroundImage: MemoryImage(_image!),
                )
              : const CircleAvatar(
                radius: 69,
                backgroundImage: AssetImage("assets/pics/pp.png"),
              ),
              Positioned(
                bottom: -12,
                right: 5,
                child: IconButton(
                  onPressed: selectImage,
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
            textEditingController: _passwordController,
            isPass: true,
          ),

          // for spacing
          const SizedBox(
            height: 30,
          ),

          // submit
          InkWell(
            onTap:() async{
              String response = await Authorizations().registerUser(
                email: _emailController.text, 
                password: _passwordController.text, 
                username: _usernameController.text,
                file: _image!,                
                );
            }, 
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
