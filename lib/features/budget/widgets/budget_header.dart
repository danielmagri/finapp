import 'package:flutter/material.dart'
    show
        AlwaysStoppedAnimation,
        Animation,
        BoxConstraints,
        Expanded,
        FontWeight,
        Icon,
        IconButton,
        Icons,
        Key,
        LayoutBuilder,
        MediaQuery,
        Opacity,
        Positioned,
        Row,
        Stack,
        StackFit,
        StatelessWidget,
        Text,
        TextAlign,
        TextSpan,
        TextStyle,
        Tween,
        Widget,
        kToolbarHeight;

class BudgetHeader extends StatelessWidget {
  static const maxHeight = 120.0;
  static const minHeight = kToolbarHeight;

  final String month;
  final String avaiableMoney;
  final Function(int offset) monthChange;

  const BudgetHeader(
      {Key? key,
      required this.month,
      required this.avaiableMoney,
      required this.monthChange})
      : super(key: key);

  double _calculateExpandRatio(double paddingTop, BoxConstraints constraints) {
    var expandRatio = (constraints.maxHeight - minHeight - paddingTop) /
        (maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;

    return expandRatio;
  }

  @override
  Widget build(context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(paddingTop, constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: paddingTop,
                left: 0,
                right: 0,
                child: _buildMonth(animation, month, monthChange)),
            Positioned(
              top: paddingTop +
                  Tween<double>(begin: 0, end: 50).evaluate(animation),
              left: 0,
              right: 0,
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Disponível',
                    style: TextStyle(
                        fontSize: Tween<double>(begin: 14, end: 18)
                            .evaluate(animation)),
                  ),
                  TextSpan(
                    text: '\nR\$ $avaiableMoney',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Tween<double>(begin: 18, end: 24)
                            .evaluate(animation)),
                  ),
                ]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMonth(Animation<double> animation, String month,
          Function(int offset) monthChange) =>
      Opacity(
        opacity: Tween<double>(begin: 0, end: 1).evaluate(animation),
        child: Row(
          children: [
            IconButton(
                onPressed: () => monthChange.call(-1),
                icon: Icon(Icons.arrow_back_ios)),
            Expanded(child: Text(month, textAlign: TextAlign.center)),
            IconButton(
                onPressed: () => monthChange.call(1),
                icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      );
}
