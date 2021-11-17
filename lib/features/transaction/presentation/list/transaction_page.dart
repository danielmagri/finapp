import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../../shared/base/base_page.dart';
import '../../../../shared/enums/transaction_type.dart';
import '../../../../shared/model/transaction.dart';
import '../../../../shared/widgets/skeleton.dart';
import 'transaction_controller.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState
    extends BaseStateWithController<TransactionPage, TransactionController> {
  @override
  void initState() {
    controller.getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (_) => controller.listTransactions.handleState(
          () => Skeleton(width: 100, height: 100),
          (data) => GroupedListView<Transaction, DateTime>(
            elements: data ?? [],
            groupBy: (element) => element.date,
            groupComparator: (value1, value2) => value2.compareTo(value1),
            itemComparator: (item1, item2) =>
                item1.value.compareTo(item2.value),
            order: GroupedListOrder.ASC,
            useStickyGroupSeparators: true,
            groupSeparatorBuilder: (value) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DateFormat("dd/MM/yyyy").format(value),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            itemBuilder: (c, element) {
              return Card(
                margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 1.0),
                child: Container(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    title: Text(element.valueText),
                    subtitle: element.type == TransactionType.OUTCOME ? Text(controller
                            .getCategoryModel(element.categoryId!)
                            ?.title ??
                        '') : Text('Renda'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
