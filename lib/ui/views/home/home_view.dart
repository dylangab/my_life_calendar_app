import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/ui/components/app_scafold.dart';
import 'package:my_life_calendar_app/ui/views/calendar/calendar_view_view.dart';
import 'package:my_life_calendar_app/ui/views/life_calendar/life_calendar_view.dart';
import 'package:stacked/stacked.dart';

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
