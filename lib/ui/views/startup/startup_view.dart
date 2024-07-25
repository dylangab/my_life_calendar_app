import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_life_calendar_app/ui/common/app_strings.dart';
import 'package:my_life_calendar_app/ui/common/app_textstyles.dart';
import 'package:my_life_calendar_app/ui/components/app_scafold.dart';
import 'package:stacked/stacked.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return const AppScafold(
        child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Image(image: AssetImage("assets/gif/loading_gif.gif")),
          ),
          verticalSpaceMedium,
          Text(
            ksLifeCalendar,
            style: ktsHeader1,
          ),
        ],
      ),
    ));
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
