import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_editing_app/models/text_model.dart';
import 'package:image_editing_app/ui/screens/widgets/defaultbuttons.dart';
import 'package:image_editing_app/utils/utils.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import '../screens/edit_image_screen.dart';

abstract class EditImageFunc extends State<EditImageScreen> {
  TextEditingController textcontroller = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  int currentIndex = 0;

  void removeText(BuildContext context) {
    setState(() {
      texts.removeAt(currentIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          'Text was deleted',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  void setCurrentIndex(BuildContext context, i) {
    setState(() {
      currentIndex = i;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          'Selected for styling',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  void changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  void changeFontWeight(FontWeight fontWeight) {
    setState(() {
      texts[currentIndex].fontWeight = fontWeight;
    });
  }

  void changeFontStyle(FontStyle fontStyle) {
    setState(() {
      texts[currentIndex].fontStyle = fontStyle;
    });
  }

  void increaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize += 2;
    });
  }

  void decreaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize -= 2;
    });
  }

  void alignLeft() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  void alignCenter() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  void alignRight() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  void addLines() {
    setState(() {
      if (texts[currentIndex].text.contains('\n')) {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll('\n', ' ');
      } else {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll(' ', '\n');
      }
    });
  }

  saveToGallery(BuildContext context) {
    if (texts.isNotEmpty) {
      screenshotController.capture().then((Uint8List? image) {
        saveImage(image!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image saved to gallery.'),
          ),
        );
      }).catchError((err) => print(err));
    }
  }

  saveImage(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = "screenshot_$time";
    await requestPermission(Permission.storage);
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  List<TextModel> texts = [];
  addNewText(BuildContext context) {
    setState(() {
      texts.add(
        TextModel(
          color: Colors.white,
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          left: 0,
          text: textcontroller.text,
          textAlign: TextAlign.left,
          top: 0,
        ),
      );
      Navigator.of(context).pop();
    });
  }

  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add New Text'),
        content: TextField(
          controller: textcontroller,
          maxLines: 3,
          decoration: const InputDecoration(
              suffixIcon: Icon(Icons.edit),
              filled: true,
              hintText: 'Type your text here'),
        ),
        actions: [
          DefaultButton(
              onpressed: () => Navigator.of(context).pop(),
              child: const Text('Back'),
              color: Colors.black,
              textColor: Colors.white),
          DefaultButton(
              onpressed: () => addNewText(context),
              child: const Text('Add Text'),
              color: Colors.green,
              textColor: Colors.white)
        ],
      ),
    );
  }
}
