import 'package:flutter/material.dart'
    show BorderSide, Colors, EdgeInsets, FontWeight, InputDecoration, Key, OutlineInputBorder, State, StatefulWidget, TextEditingController, TextFormField, TextInputAction, TextInputType, TextStyle, Widget;
import 'package:flutter/services.dart' show TextInputFormatter, TextInputType;

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String? suffixText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function()? onDone;
  final bool hasNext;

  CustomTextField({
    Key? key,
    this.controller,
    required this.label,
    this.suffixText,
    this.keyboardType,
    this.inputFormatters,
    this.hasNext = false,
    this.validator,
    this.onDone,
    this.maxLength,
  })  : assert(maxLength == null || maxLength > 0),
        super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isValidated = false;

  static OutlineInputBorder get _border => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.2),
      );

  static OutlineInputBorder get _filledBorder => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.2),
      );

  @override
  Widget build(context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      textInputAction:
          widget.hasNext ? TextInputAction.next : TextInputAction.done,
      onEditingComplete: widget.onDone,
      maxLength: widget.maxLength,
      style: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          isDense: true,
          focusedBorder: _filledBorder,
          enabledBorder: isValidated ? _filledBorder : _border,
          errorBorder: _border,
          focusedErrorBorder: _filledBorder,
          counterText: "",
          errorStyle: const TextStyle(height: 0),
          labelText: widget.label,
          labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.blue),
          suffixText: widget.suffixText,
          suffixStyle: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w400,
              fontSize: 16)),
      validator: (value) {
        final res = widget.validator?.call(value);
        setState(() {
          isValidated = res == null && widget.validator != null;
        });
        return res;
      },
    );
  }
}
