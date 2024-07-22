import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/components/app_scafold.dart';
import 'package:my_life_calendar_app/ui/common/app_strings.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'on_boarding_viewmodel.dart';

class OnBoardingView extends StackedView<OnBoardingViewModel> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnBoardingViewModel viewModel,
    Widget? child,
  ) {
    return AppScafold(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        verticalSpaceMassive,
        const Center(
            child: Text(
          "Welcome to",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        )),
        const Center(
            child: Text(
          "Life Calendar",
          style: TextStyle(fontSize: 32),
        )),
        verticalSpaceMassive,
        const SizedBox(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 25,
                    ),
                    horizontalSpaceTiny,
                    SizedBox(
                      width: 400,
                      child: ListTile(
                        title: Text("Your Own Personal Calendar",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        subtitle: Text(ksYourOwnPersonalCalendarDescription),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 25,
                    ),
                    horizontalSpaceTiny,
                    SizedBox(
                      width: 400,
                      child: ListTile(
                        title: Text("Add your Life Milestones",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        subtitle: Text(ksAddYourLifeMilestonesDescription),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.track_changes,
                      size: 25,
                    ),
                    horizontalSpaceTiny,
                    SizedBox(
                      width: 400,
                      child: ListTile(
                        title: Text("Track your Life Progress",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        subtitle: Text(ksTrackYourLifeProgressDescription),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpace(200),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
              height: 55,
              child: ElevatedButton(
                  onPressed: () {
                    viewModel.goToNextPage();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.purple[300]),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                      side:
                          const WidgetStatePropertyAll(BorderSide(width: 2.5))),
                  child: const Text(
                    "Get Started",
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ))),
        )
        // AppButton(
        //     buttonName: "Get Started",
        //     isLoading: false,
        //     onPressed: () {
        //       viewModel.goToNextPage();
        //     })
      ],
    ));
  }

  @override
  OnBoardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnBoardingViewModel();
}
