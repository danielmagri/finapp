import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/base/base_page.dart';
import '../../../shared/widgets/skeleton.dart';
import '../widgets/budget_header.dart';
import 'budget_controller.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState
    extends BaseStateWithController<BudgetPage, BudgetController> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.fetchBudgets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (_) {
          _snapAppbar();
          return false;
        },
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          slivers: [
            SliverAppBar(
              pinned: true,
              stretch: false,
              flexibleSpace: BudgetHeader(),
              expandedHeight: BudgetHeader.maxHeight,
            ),
            Observer(
              builder: (_) => controller.budgetsState.handleState(
                () => SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Skeleton(width: 100, height: 100))),
                (data) => SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(controller
                                    .getCategoryModel(data![index].categoryId)
                                    ?.title ??
                                ''),
                          ),
                          Text(data[index].amountSpent.toString())
          //                 TextField(
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 14),
          //   cursorWidth: 0,
          //   decoration: InputDecoration(
          //       border: InputBorder.none,
          //       hintText: CurrencyTextInputFormatter().format('0,00')),
          //   keyboardType: TextInputType.number,
          //   // inputFormatters: [controller.currencyTextInput],
          // ),
                        ],
                      ),
                    );
                  }, childCount: data?.length ?? 0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _snapAppbar() {
    final scrollDistance = BudgetHeader.maxHeight - BudgetHeader.minHeight;

    if (_controller.offset > 0 && _controller.offset < scrollDistance) {
      final double snapOffset;
      if (_controller.offset / scrollDistance > 0.5) {
        snapOffset = scrollDistance;
      } else {
        snapOffset = 0;
      }

      Future.microtask(() => _controller.animateTo(snapOffset,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn));
    }
  }
}
