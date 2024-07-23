import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/ui/common/app_strings.dart';
import 'package:my_life_calendar_app/ui/components/app_scafold.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';
import 'package:my_life_calendar_app/ui/views/life_calendar/components/custom_icons.dart';
import 'package:stacked/stacked.dart';

import 'life_calendar_viewmodel.dart';

class LifeCalendarView extends StackedView<LifeCalendarViewModel> {
  const LifeCalendarView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LifeCalendarViewModel viewModel,
    Widget? child,
  ) {
    return AppScafold(
        child: ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "${viewModel.getGreetingMessage()},",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue[200]!,
                    border: Border.all(width: 1.5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DashedCircularProgressBar.aspectRatio(
                    aspectRatio: 0.5, // width ÷ height
                    valueNotifier: viewModel.lifeProgress,

                    progress: viewModel.lifeProgress.value,
                    startAngle: 225,
                    maxProgress: 100,
                    sweepAngle: 270,
                    foregroundColor: const Color.fromARGB(255, 244, 116, 88),
                    backgroundColor: const Color(0xffeeeeee),
                    foregroundStrokeWidth: 5,
                    backgroundStrokeWidth: 5,
                    animation: true,
                    seekSize: 6,
                    seekColor: const Color(0xffeeeeee),
                    child: Center(
                      child: ValueListenableBuilder(
                          valueListenable: viewModel.lifeProgress,
                          builder: (_, double value, __) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${value.toInt()}%',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20),
                                  ),
                                  const Text(
                                    ksLifeProgress,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              )),
                    ),
                  ),
                ),
              ),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.purple[200],
                    border: Border.all(width: 1.5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DashedCircularProgressBar.aspectRatio(
                    aspectRatio: 1, // width ÷ height
                    valueNotifier: viewModel.weeksLeft,
                    progress: viewModel.weeksLeft.value,
                    maxProgress: viewModel
                        .showTotalWeeks(viewModel.userProfile!.lifeExpectancy!)
                        .toDouble(),
                    corners: StrokeCap.butt,
                    foregroundColor: const Color.fromARGB(255, 244, 116, 88),
                    backgroundColor: const Color(0xffeeeeee),
                    foregroundStrokeWidth: 5,
                    backgroundStrokeWidth: 6,
                    animation: true,
                    child: Center(
                      child: ValueListenableBuilder(
                        valueListenable: viewModel.weeksLeft,
                        builder: (_, double value, __) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${value.toInt()}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20),
                              ),
                              Text(
                                "/${viewModel.showTotalWeeks(viewModel.userProfile!.lifeExpectancy!).toInt()} weeks",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        verticalSpace(50),
        InkWell(
          onDoubleTap: () {
            viewModel.navigateBack();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: viewModel.lifeCalendarModel!.years.length,
                itemBuilder: (context, yearindex) {
                  return SizedBox(
                    height: 8,
                    child: ListView.builder(
                      itemCount: viewModel
                          .lifeCalendarModel!.years[yearindex].weeks.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, weekindex) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 0.4, right: 0.4),
                          child: CustomsIcons(
                              color: viewModel.getColor(
                                  viewModel.lifeCalendarModel!.years[yearindex]
                                      .yearNumber!,
                                  viewModel.lifeCalendarModel!.years[yearindex]
                                      .weeks[weekindex].isLived!),
                              islived: viewModel.lifeCalendarModel!
                                  .years[yearindex].weeks[weekindex].isLived),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ));
  }

  @override
  void onViewModelReady(LifeCalendarViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.getUserProfile();
  }

  @override
  LifeCalendarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LifeCalendarViewModel();
}
