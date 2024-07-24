import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_life_calendar_app/ui/bottom_sheets/add_milestone/add_milestone_sheet.form.dart';
import 'package:my_life_calendar_app/ui/bottom_sheets/add_milestone/components/customTextFields.dart';
import 'package:my_life_calendar_app/ui/common/app_colors.dart';
import 'package:my_life_calendar_app/ui/common/app_strings.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_milestone_sheet_model.dart';

@FormView(
    fields: [FormTextField(name: 'title'), FormTextField(name: 'description')])
class AddMilestoneSheet extends StackedView<AddMilestoneSheetModel>
    with $AddMilestoneSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddMilestoneSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddMilestoneSheetModel viewModel,
    Widget? child,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: Container(
        decoration: const BoxDecoration(
            color: kcWhite,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: ListView(
          children: [
            verticalSpaceSmall,
            Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                  ),
                )),
                child: const Center(
                    child: Text(
                  ksAddMilestone,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ))),
            ListTile(
              leading: const Icon(Icons.calendar_month_outlined),
              title: const Text(
                ksMilestoneDate,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(dateformater(request.data['packedDate'])),
            ),
            verticalSpaceSmall,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                ksMilestoneTitle,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            verticalSpaceSmall,
            CustomTextFields(
                controller: titleController,
                focusNode: titleFocusNode,
                hintText: ksMilestoneTitleHinttext),
            verticalSpaceMedium,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                ksMilestoneDescription,
                style: TextStyle(fontSize: 20),
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                controller: descriptionController,
                focusNode: descriptionFocusNode,
                inputFormatters: [LengthLimitingTextInputFormatter(200)],
                maxLines: null,
                minLines: 1,
                maxLength: 100,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    hintText: ksMilestoneDescriptionHinttext,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                  height: 55,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kcPurpleLight,
                          side: const BorderSide(width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                      onPressed: () {
                        viewModel.addDate(request.data['packedDate']);
                        viewModel.addMilestone(
                            descriptionController.value.text.trim(),
                            titleController.value.text.trim(),
                            request.data['packedDate']);
                        viewModel.navigateBack();
                      },
                      child: const Text(
                        ksAddMilestone,
                        style: TextStyle(
                          color: kcBlack,
                          fontSize: 18,
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }

  @override
  AddMilestoneSheetModel viewModelBuilder(BuildContext context) =>
      AddMilestoneSheetModel();
}
