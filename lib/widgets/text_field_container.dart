import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/text_field_button.dart';

class TextFieldContainer extends StatelessWidget {
  TextFieldContainer(
      { this.controller,
        this.width,
        this.height,
        this.image,
        this.alignment,
        this.fontSize,
        this.borderRadius,});

  final TextEditingController controller;
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
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: TextFieldButton(
          controller: controller,
          fontSize: fontSize),
    );
  }
}