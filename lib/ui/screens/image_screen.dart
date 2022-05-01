import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editing_app/ui/screens/widgets/edit_image_func.dart';



class EditImageScreen extends StatefulWidget {
  final String selectedimage;
  const EditImageScreen({Key? key, required this.selectedimage})
      : super(key: key);

  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageFunc {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.file(
          File(widget.selectedimage),
        ),
        floatingActionButton: _addTextButton);
  }

  Widget get _addTextButton => FloatingActionButton(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add New Text',
        child: const Icon(Icons.edit),
      );
}
