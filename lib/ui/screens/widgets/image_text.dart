import 'package:flutter/material.dart';
import 'package:image_editing_app/models/text_model.dart';

class ImageText extends StatelessWidget {
  final TextModel textModel;
  const ImageText({
    Key? key,
    required this.textModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textModel.text,
      textAlign: textModel.textAlign,
      style: TextStyle(
          color: textModel.color,
          fontSize: textModel.fontSize,
          fontWeight: textModel.fontWeight,
          fontStyle: textModel.fontStyle),
    );
  }
}
