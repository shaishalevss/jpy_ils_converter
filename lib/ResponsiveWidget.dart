import 'package:flutter/material.dart';
import 'package:responsive_app/SizeInformation.dart';

class ResponsiveWidget extends StatelessWidget {
  final AppBar appBar;
  final Widget Function(BuildContext context, SizeInformation constraints)
      builder;

  ResponsiveWidget({@required this.builder, this.appBar});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    SizeInformation information =
        SizeInformation(width: width, height: height, orientation: orientation);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar,
        body: builder(context, information),
      ),
    );
  }
}
