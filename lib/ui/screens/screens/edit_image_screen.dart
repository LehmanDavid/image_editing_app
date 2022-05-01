import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editing_app/ui/screens/widgets/image_text.dart';
import 'package:screenshot/screenshot.dart';
import '../widgets/edit_image_func.dart';

class EditImageScreen extends StatefulWidget {
  final String selectedimage;
  const EditImageScreen({Key? key, required this.selectedimage})
      : super(key: key);

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageFunc {
  bool isItalic = false;
  bool isBold = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar,
        body: Screenshot(
          controller: screenshotController,
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  _selectedImage,
                  for (int i = 0; i < texts.length; i++)
                    Positioned(
                      left: texts[i].left,
                      top: texts[i].top,
                      child: GestureDetector(
                        onTap: () => setCurrentIndex(context, i),
                        onLongPress: () {
                          setState(() {
                            currentIndex = i;
                            removeText(context);
                          });
                        },
                        child: Draggable(
                          feedback: ImageText(
                            textModel: texts[i],
                          ),
                          child: ImageText(
                            textModel: texts[i],
                          ),
                          onDragEnd: (drag) {
                            final renderBox =
                                context.findRenderObject() as RenderBox;
                            Offset off = renderBox.globalToLocal(drag.offset);
                            setState(() {
                              texts[i].top = off.dy - 70;
                              texts[i].left = off.dx;
                            });
                          },
                        ),
                      ),
                    ),
                  creatorText.text.isNotEmpty
                      ? Positioned(
                          left: 0,
                          bottom: 0,
                          child: Text(
                            creatorText.text,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: _addTextButton);
  }

  AppBar get _appBar => AppBar(
        backgroundColor: const Color(0xFF403e3e),
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              IconButton(
                onPressed: () => saveToGallery(context),
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                tooltip: 'Save Image',
              ),
              IconButton(
                onPressed: () => increaseFontSize(),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                tooltip: 'Increase font size',
              ),
              IconButton(
                onPressed: () => decreaseFontSize(),
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                tooltip: 'Decrease font size',
              ),
              IconButton(
                onPressed: () => alignLeft,
                icon: const Icon(
                  Icons.format_align_left,
                  color: Colors.white,
                ),
                tooltip: 'Align Left',
              ),
              IconButton(
                onPressed: () => alignCenter,
                icon: const Icon(
                  Icons.format_align_center,
                  color: Colors.white,
                ),
                tooltip: 'Align Center',
              ),
              IconButton(
                onPressed: () => alignRight,
                icon: const Icon(
                  Icons.format_align_right,
                  color: Colors.white,
                ),
                tooltip: 'Align Right',
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isBold = !isBold;
                  });
                  isBold
                      ? changeFontWeight(FontWeight.normal)
                      : changeFontWeight(FontWeight.bold);
                },
                icon: const Icon(
                  Icons.format_bold,
                  color: Colors.white,
                ),
                tooltip: 'Bold',
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isItalic = !isItalic;
                  });
                  isItalic
                      ? changeFontStyle(FontStyle.normal)
                      : changeFontStyle(FontStyle.italic);
                },
                icon: const Icon(
                  Icons.format_italic,
                  color: Colors.white,
                ),
                tooltip: 'Italic',
              ),
              IconButton(
                onPressed: () => addLines(),
                icon: const Icon(
                  Icons.space_bar,
                  color: Colors.white,
                ),
                tooltip: 'Add New Line',
              ),
              Tooltip(
                message: 'White',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.white),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Red',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.red),
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Black',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.black),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Blue',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.blue),
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Yellow',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.yellow),
                  child: const CircleAvatar(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Green',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.green),
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Purple',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.purple),
                  child: const CircleAvatar(
                    backgroundColor: Colors.purple,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Orange',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.orange),
                  child: const CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      );

  Widget get _selectedImage => Center(
        child: Image.file(
          File(widget.selectedimage),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
      );

  Widget get _addTextButton => FloatingActionButton(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add New Text',
        child: const Icon(Icons.edit),
      );
}
