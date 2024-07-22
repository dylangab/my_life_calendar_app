import 'package:flutter/material.dart';

import 'package:my_life_calendar_app/components/app_scafold.dart';
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
          "Create your Profile",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
        verticalSpaceSmall,
        const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              ksWelocomeToOurApp,
              style: TextStyle(fontWeight: FontWeight.w400),
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
                          "Life Expectancy",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
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
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
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
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    content: SizedBox(
                      height: 200,
                      width: 300,
                      child: ScrollDatePicker(
                          selectedDate: viewModel.pickeddate,
                          onDateTimeChanged: viewModel.onChangedForDatePicker),
                    ),
                    actions: [
                      Center(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 247, 219, 240),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          viewModel.navigateBack();
                        },
                        child: const SizedBox(
                          height: 40,
                          width: 70,
                          child: Center(
                            child: Text(
                              "Save",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                      ))
                    ],
                  );
                },
              );
            },
            leading: const Icon(Icons.cake_rounded),
            title: const Text(
              "Your Birth Date",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            subtitle: Text("${dateformater(viewModel.pickeddate)}"),
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
                        viewModel.pickeddate);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.purple[300]),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                      side:
                          const WidgetStatePropertyAll(BorderSide(width: 2.5))),
                  child: Text(
                    "Start",
                    style: const TextStyle(fontSize: 18, color: Colors.black),
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
