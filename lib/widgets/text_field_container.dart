import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/text_field_button.dart';

class TextFieldContainer extends StatelessWidget {
  TextFieldContainer(
      {TextEditingController this.myILSController,
        TextEditingController this.myJPYController,
        double this.width,
        double this.height,
        ExactAssetImage this.image,
        Alignment this.alignment,
        double this.fontSize,
        BorderRadius this.borderRadius,});

  final TextEditingController myILSController;
  final TextEditingController myJPYController;
  final double width;
  final double height;
  final ExactAssetImage image;
  final Alignment alignment;
  final double fontSize;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xFFFFFFF0),
          width: 2,
        ),
        borderRadius: borderRadius,
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: TextFieldButton(
          myILSController: myILSController,
          myJPYController: myJPYController,
          fontSize: fontSize),
    );
  }
}