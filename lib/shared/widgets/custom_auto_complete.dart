import 'package:flutter/material.dart'
    show
        Autocomplete,
        BorderSide,
        Colors,
        EdgeInsets,
        FontWeight,
        InputDecoration,
        Key,
        OutlineInputBorder,
        State,
        StatefulWidget,
        TextFormField,
        TextInputAction,
        TextStyle,
        Widget;
import 'package:flutter/widgets.dart';

class CustomAutoComplete extends StatefulWidget {
  final TextEditingController? controller;
  final List<String> items;
  final String label;
  final Function(String)? onSelected;
  final Function()? onDone;
  final bool hasNext;

  const CustomAutoComplete({
    Key? key,
    this.controller,
    required this.items,
    required this.label,
    this.onDone,
    this.hasNext = false,
    this.onSelected,
  }) : super(key: key);

  @override
  _CustomAutoCompleteState createState() => _CustomAutoCompleteState();
}

class _CustomAutoCompleteState extends State<CustomAutoComplete> {
  bool isValidated = false;

  static OutlineInputBorder get _border => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.2),
      );

  static OutlineInputBorder get _filledBorder => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 1.2),
      );

  String? validate(String? text) {
    if (text == null || text.isEmpty) {
      return '';
    }

    if (!widget.items.any((e) => e == text)) {
      return '';
    }

    return null;
  }

  @override
  Widget build(context) {
    return Autocomplete<String>(
      onSelected: (value) {
        widget.controller?.text = value;
        setState(() {
          isValidated = validate(value) == null;
        });
        widget.onSelected?.call(value);
      },
      optionsBuilder: (textEditingValue) => widget.items
          .where((item) =>
              item.toLowerCase().contains(textEditingValue.text.toLowerCase()))
          .toList(),
      fieldViewBuilder: (context, fieldTextEditingController, fieldFocusNode,
          onFieldSubmitted) {
        return TextFormField(
          controller: fieldTextEditingController,
          textInputAction:
              widget.hasNext ? TextInputAction.next : TextInputAction.done,
          focusNode: fieldFocusNode,
          onEditingComplete: widget.onDone,
          onChanged: (value) {
            widget.controller?.text = value;

            setState(() {
              isValidated = validate(value) == null;
            });
            if (isValidated) widget.onSelected?.call(value);
          },
          style: const TextStyle(
              fontSize: 15, color: Colors.blue, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            focusedBorder: _filledBorder,
            enabledBorder: isValidated ? _filledBorder : _border,
            errorBorder: _border,
            focusedErrorBorder: _filledBorder,
            errorStyle: const TextStyle(height: 0),
            labelText: widget.label,
            labelStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.blue),
          ),
          validator: validate,
        );
      },
    );
  }
}
