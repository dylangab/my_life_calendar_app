import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/ui/common/app_colors.dart';
import 'package:my_life_calendar_app/ui/common/app_textstyles.dart';

import 'package:my_life_calendar_app/ui/components/app_scafold.dart';
import 'package:my_life_calendar_app/ui/common/app_strings.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:stacked/stacked.dart';

import 'create_profile_viewmodel.dart';

class CreateProfileView extends StackedView<CreateProfileViewModel> {
  const CreateProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateProfileViewModel viewModel,
    Widget? child,
  ) {
    return AppScafold(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        verticalSpace(100),
        const Center(
            child: Text(
          ksCreateProfile,
          style: ktsHeader1, // header1
        )),
        verticalSpaceSmall,
        const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              ksWelocomeToOurApp,
              style: ktsBodyNormal, // body1
            ),
          ),
        ),
        verticalSpaceLarge,
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.face,
                  size: 25,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          ksLifeExpectancy,
                          style: ktsHeader5, // header5
                        ),
                      ),
                      Slider(
                          divisions: 20,
                          max: 100,
                          value: viewModel.lifeExpectancySilderValue,
                          onChanged: (value) {
                            viewModel.updateSliderValue(value);
                          })
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  " ${viewModel.lifeExpectancySilderValue.ceil()}",
                  style: ktsHeader5, // header5
                ),
              )
            ],
          ),
        ),
        verticalSpace(50),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: ListTile(
            onTap: () {
              viewModel.showpickDateDialog();
            },
            leading: const Icon(Icons.cake_rounded),
            title: const Text(
              ksYourBirthDate,
              style: ktsHeader5, // header5
            ),
            subtitle: Text(dateformater(viewModel.pickeddate!)),
          ),
        ),
        verticalSpace(350),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
              height: 55,
              child: ElevatedButton(
                  onPressed: () {
                    viewModel.createUserProfile(
                        viewModel.lifeExpectancySilderValue.toInt(),
                        viewModel.pickeddate!);
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(kcPurpleLight),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                      side:
                          const WidgetStatePropertyAll(BorderSide(width: 2.5))),
                  child: const Text(
                    ksStart,
                    style: ktsButtonText, // buttontextstyle
                  ))),
        )
      ],
    ));
  }

  @override
  CreateProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateProfileViewModel();
}
