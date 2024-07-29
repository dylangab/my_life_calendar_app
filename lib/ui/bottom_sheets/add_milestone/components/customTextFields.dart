import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFields extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final int? mixLines;
  final int? minLines;
  final int? maxLength;
  final int? inputLength;

  const CustomTextFields(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.hintText,
      required this.maxLength,
      required this.minLines,
      required this.mixLines,
      required this.inputLength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        maxLength: maxLength,
        maxLines: minLines,
        minLines: minLines,
        inputFormatters: [LengthLimitingTextInputFormatter(inputLength)],
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            hintText: hintText,
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(6)))),
      ),
    );
  }
}
