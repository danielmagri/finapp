import 'package:flutter/material.dart'
    show FocusNode, FocusScope, GestureDetector, StatelessWidget, Widget;

class FocusFixer extends StatelessWidget {
  FocusFixer({required this.child});
  final Widget child;

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_focusNode),
      child: child,
    );
  }
}
