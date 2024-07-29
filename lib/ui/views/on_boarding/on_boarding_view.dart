import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/ui/common/app_colors.dart';
import 'package:my_life_calendar_app/ui/common/app_textstyles.dart';
import 'package:my_life_calendar_app/ui/components/app_circular_progress_indicator.dart';
import 'package:my_life_calendar_app/ui/components/app_scafold.dart';
import 'package:my_life_calendar_app/ui/common/app_strings.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';
import 'package:my_life_calendar_app/ui/views/on_boarding/components/informationCard.dart';
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
          ksWelcome,
          style: ktsHeader2, // header2
        )),
        const Center(
            child: Text(
          ksLifeCalendar,
          style: ktsHeader1, //header1
        )),
        verticalSpaceMassive,
        const SizedBox(
          child: Column(
            children: [
              InformationCard(
                  body: ksYourOwnPersonalCalendarDescription,
                  icon: Icons.calendar_month_outlined,
                  title: ksYourOwnPersonalCalendar),
              verticalSpaceMedium,
              InformationCard(
                  body: ksAddYourLifeMilestonesDescription,
                  icon: Icons.add,
                  title: ksAddYourLifeMilestones),
              verticalSpaceMedium,
              InformationCard(
                  body: ksTrackYourLifeProgressDescription,
                  icon: Icons.track_changes,
                  title: ksTrackYourLifeProgress)
            ],
          ),
        ),
        verticalSpace(200),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
              height: 55,
              child: ElevatedButton(
                  onPressed: () async {
                    await viewModel.startLoadingButton();
                    viewModel.goToNextPage();
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(kcPurpleLight),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                      side:
                          const WidgetStatePropertyAll(BorderSide(width: 2.5))),
                  child: viewModel.isBusy
                      ? const AppCircularProgressIndicator()
                      : const Text(
                          ksGetStarted,
                          style: ktsBodyNormal, // buttontextstyle
                        ))),
        )
      ],
    ));
  }

  @override
  OnBoardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnBoardingViewModel();
}
