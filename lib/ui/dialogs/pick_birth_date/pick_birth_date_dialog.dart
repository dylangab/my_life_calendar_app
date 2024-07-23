import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/ui/common/app_colors.dart';
import 'package:my_life_calendar_app/ui/common/app_strings.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'pick_birth_date_dialog_model.dart';

class PickBirthDateDialog extends StackedView<PickBirthDateDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const PickBirthDateDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PickBirthDateDialogModel viewModel,
    Widget? child,
  ) {
    return SizedBox(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: kcWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: ScrollDatePicker(
                    selectedDate: viewModel.pickedDate!,
                    onDateTimeChanged: (value) {
                      request.data['pickedDate'] = value;
                    }),
              ),
              verticalSpaceMedium,
              Center(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kcPurpleLight,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1.5),
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {},
                child: const SizedBox(
                  height: 40,
                  width: 70,
                  child: Center(
                    child: Text(
                      ksSave,
                      style: TextStyle(fontSize: 18, color: kcBlack),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  PickBirthDateDialogModel viewModelBuilder(BuildContext context) =>
      PickBirthDateDialogModel();
}
