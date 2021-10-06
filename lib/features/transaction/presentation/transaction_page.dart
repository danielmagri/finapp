import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/base/base_page.dart';
import '../../../shared/widgets/skeleton.dart';
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
      body: Column(
        children: [
          Observer(
              builder: (_) => controller.listTransactions.handleState(
                  () => Skeleton(width: 100, height: 100),
                  (data) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: data?.length,
                      itemBuilder: (_, index) =>
                          Text(data![index].value.toString()))))
        ],
      ),
    );
  }
}
