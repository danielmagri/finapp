import 'package:flutter/material.dart'
    show
        AutovalidateMode,
        BorderSide,
        Colors,
        DropdownButtonFormField,
        DropdownButtonHideUnderline,
        DropdownMenuItem,
        EdgeInsets,
        FontWeight,
        InputDecoration,
        Key,
        OutlineInputBorder,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;

class CustomDropDown<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>>? items;
  final String label;
  final Function(T?) onChanged;
  final T? value;
  final bool isExpanded;

  const CustomDropDown({
    Key? key,
    this.items,
    required this.label,
    required this.onChanged,
    this.value,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  _CustomDropDownState<T> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  bool isValidated = false;

  static OutlineInputBorder get _border => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.2),
      );

  static OutlineInputBorder get _filledBorder => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 1.2),
      );

  @override
  void initState() {
    if (widget.value != null) {
      isValidated = _validator(widget.value) == null;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(CustomDropDown<T> oldWidget) {
    if (widget.value != oldWidget.value) {
      isValidated = _validator(widget.value) == null;
    }
    super.didUpdateWidget(oldWidget);
  }

  String? _validator(value) => value != null ? null : "";

  @override
  Widget build(context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<T>(
        items: widget.items?.isEmpty == true
            ? [DropdownMenuItem(child: Text('vazio'))]
            : widget.items,
        selectedItemBuilder:
            widget.value == null && widget.items?.isEmpty == true
                ? (context) => [const SizedBox()]
                : null,
        value: widget.value,
        isExpanded: widget.isExpanded,
        validator: _validator,
        autovalidateMode: AutovalidateMode.always,
        // icon: Flexible(child: Image.asset(Images.IC_DROPDOWN)),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15.5),
          labelText: widget.label,
          labelStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.blue),
          focusedBorder: _filledBorder,
          enabledBorder: isValidated ? _filledBorder : _border,
          errorBorder: _border,
          focusedErrorBorder: _filledBorder,
          errorStyle: const TextStyle(height: 0),
        ),
        onChanged: (value) {
          setState(() {
            isValidated = _validator(value) == null;
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
