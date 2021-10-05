import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/base/base_page.dart';
import '../../../shared/widgets/custom_auto_complete.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/skeleton.dart';
import 'add_transaction_controller.dart';

class AddTransactionBottomSheet extends StatefulWidget {
  const AddTransactionBottomSheet({Key? key}) : super(key: key);

  @override
  _AddTransactionBottomSheetState createState() =>
      _AddTransactionBottomSheetState();
}

class _AddTransactionBottomSheetState extends BaseStateWithController<
    AddTransactionBottomSheet, AddTransationController> {
  @override
  void initState() {
    reactionsDisposers = [
      controller.addState.handleReactionState(
          success: (data) => appNavigation.pop(context, data), error: print),
    ];
    controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          label: 'valor',
          controller: controller.valueController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          hasNext: true,
        ),
        Observer(
            builder: (_) => controller.listPayeesState.handleState(
                () => Skeleton(width: 10, height: 10),
                (data) => CustomAutoComplete(
                    controller: controller.payeeController,
                    items: data?.map((e) => e.title).toList() ?? [],
                    label: 'Local'))),
        CustomTextField(
          label: 'valor',
          controller: controller.categoryController,
        ),
        ElevatedButton(
            onPressed: () {
              controller.addTransaction();
            },
            child: Text('Adicionar')),
        SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom,
        )
      ],
    );
  }
}
