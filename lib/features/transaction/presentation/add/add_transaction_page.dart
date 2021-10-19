import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../../shared/base/base_page.dart';
import '../../../../shared/inputs/formatters/currency_text_input_formatter.dart';
import '../../../../shared/model/category.dart';
import '../../../../shared/widgets/custom_drop_down.dart';
import '../../../../shared/widgets/skeleton.dart';
import 'add_transaction_controller.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends BaseStateWithController<
    AddTransactionPage, AddTransactionController> {
  @override
  void initState() {
    controller.initialize();
    reactionsDisposers = [
      controller.addState.handleReactionState(
          success: (data) => appNavigation.pop(context, data), error: print),
    ];
    super.initState();
  }

  void showDateSeletion() {
    final initialDate = controller.dates[2].item2;
    showDatePicker(
            context: context,
            initialDate: initialDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then(controller.setCustomDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
            cursorWidth: 0,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: CurrencyTextInputFormatter().format('0,00')),
            keyboardType: TextInputType.number,
            inputFormatters: [controller.currencyTextInput],
          ),
          Row(
            children: [
              Text('Data'),
              Observer(
                builder: (context) => Wrap(
                  children: List<Widget>.generate(
                    controller.dates.length,
                    (index) {
                      return ChoiceChip(
                        label: Text(
                            index == 2 && controller.dates[2].item2 != null
                                ? DateFormat("dd/MM/yyyy")
                                    .format(controller.dates[2].item2!)
                                : controller.dates[index].item1),
                        selected: controller.dateSelected == index,
                        onSelected: (selected) {
                          controller.selectDate(index);
                          if (index == 2) {
                            showDateSeletion();
                          }
                        },
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          ),
          Observer(
              builder: (_) => controller.listCategoriesState.handleState(
                    () => Skeleton(width: 100, height: 100),
                    (data) => CustomDropDown<Category>(
                        label: 'Categorias',
                        items: data
                            ?.map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.title),
                                ))
                            .toList(),
                        onChanged: (e) {
                          controller.categorySelected = e;
                        }),
                  )),
          ElevatedButton(
              onPressed: () {
                controller.addTransaction();
              },
              child: Text('Adicionar')),
        ],
      ),
    );
  }
}
