import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
   TextFieldWidget(
      {Key? key, required this.hintText, this.maxLines = 1, this.onSaved,this.onChanged})
      : super(key: key);
  final int maxLines;
  final String hintText;
  final void Function(String?)? onSaved;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field must be not empty';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([Color? color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}
