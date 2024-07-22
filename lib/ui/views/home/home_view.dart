import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/components/app_scafold.dart';
import 'package:my_life_calendar_app/ui/views/calendar_view/calendar_view_view.dart';
import 'package:my_life_calendar_app/ui/views/life_calendar/life_calendar_view.dart';
import 'package:my_life_calendar_app/ui/views/life_map/life_map_view.dart';
import 'package:stacked/stacked.dart';
import 'package:my_life_calendar_app/ui/common/app_colors.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return AppScafold(
        child: PageView(
      controller: viewModel.pageController,
      children: const [
        LifeCalendarView(),
        CalendarViewView(),
      ],
    ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
