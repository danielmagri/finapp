import 'package:flutter/material.dart'
    show
        BottomAppBar,
        Color,
        Column,
        Expanded,
        Icon,
        IconData,
        InkWell,
        MainAxisAlignment,
        MainAxisSize,
        Material,
        MaterialType,
        NotchedShape,
        Row,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        ValueChanged,
        Widget;

class FABBottomBarItem {
  const FABBottomBarItem({required this.iconData, required this.text});
  final IconData iconData;
  final String text;
}

class FABBottomBar extends StatefulWidget {
  FABBottomBar({
    required this.initialPage,
    required this.items,
    this.height = 50,
    this.iconSize = 22,
    this.textSize = 12,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
  }) {
    assert(items.length == 2 || items.length == 4);
  }

  final int initialPage;
  final List<FABBottomBarItem> items;
  final double height;
  final double iconSize;
  final double textSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomBar> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.initialPage;
    super.initState();
  }

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(context) {
    var items = List<Widget>.generate(widget.items.length, (index) {
      return _buildTabItem(
          item: widget.items[index], index: index, onPressed: _updateIndex);
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() =>
      Expanded(child: SizedBox(height: widget.height));

  Widget _buildTabItem({
    required FABBottomBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    var color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color, fontSize: widget.textSize),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}