import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_life_calendar_app/ui/bottom_sheets/add_milestone/add_milestone_sheet.form.dart';
import 'package:my_life_calendar_app/ui/bottom_sheets/add_milestone/components/customTextFields.dart';
import 'package:my_life_calendar_app/ui/common/app_colors.dart';
import 'package:my_life_calendar_app/ui/common/app_strings.dart';
import 'package:my_life_calendar_app/ui/common/app_textstyles.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';
import 'package:my_life_calendar_app/ui/components/app_circular_progress_indicator.dart';
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
            borderRadius: BorderRadius.only(
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
                  style: ktsHeader4,
                ))),
            ListTile(
              leading: const Icon(Icons.calendar_month_outlined),
              title: const Text(
                ksMilestoneDate,
                style: ktsHeader5,
              ),
              subtitle: Text(
                dateformater(
                  request.data['packedDate'],
                ),
                style: ktsBodyNormal,
              ),
            ),
            verticalSpaceSmall,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(ksMilestoneTitle, style: ktsHeader5),
            ),
            verticalSpaceSmall,
            CustomTextFields(
              controller: titleController,
              focusNode: titleFocusNode,
              hintText: ksMilestoneTitleHinttext,
              maxLength: null,
              minLines: null,
              mixLines: null,
              inputLength: 0,
            ),
            verticalSpaceMedium,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                ksMilestoneDescription,
                style: ktsHeader5,
              ),
            ),
            verticalSpaceSmall,
            CustomTextFields(
                controller: descriptionController,
                focusNode: descriptionFocusNode,
                hintText: "description...",
                maxLength: null,
                minLines: null,
                mixLines: null,
                inputLength: 200),
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
                      onPressed: () async {
                        await viewModel.startLoadingButton();
                        viewModel.addDate(request.data['packedDate']);
                        viewModel.addMilestone(
                            descriptionController.value.text.trim(),
                            titleController.value.text.trim(),
                            request.data['packedDate']);
                        viewModel.navigateBack();
                      },
                      child: viewModel.isBusy
                          ? const AppCircularProgressIndicator()
                          : const Text(ksAddMilestone, style: ktsButtonText))),
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
