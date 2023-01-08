import 'package:beta/utils/display.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const Layout(
      {Key? key,
      required this.webScreenLayout,
      required this.mobileScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          //web
          return webScreenLayout;
        }
        //mobile
        return mobileScreenLayout;
      },
    );
  }
}
