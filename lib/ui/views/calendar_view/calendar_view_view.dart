import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/ui/common/app_colors.dart';
import 'package:my_life_calendar_app/ui/common/app_strings.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';
import 'package:my_life_calendar_app/ui/views/calendar_view/components/milestone.dart';
import 'package:stacked/stacked.dart';

import 'calendar_view_viewmodel.dart';

class CalendarViewView extends StackedView<CalendarViewViewModel> {
  const CalendarViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CalendarViewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Center(
          child: Text(
            "Calendar view",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            verticalSpace(40),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: ListWheelScrollView.useDelegate(
                        overAndUnderCenterOpacity: 0.3,
                        physics: const FixedExtentScrollPhysics(),
                        itemExtent: 20,
                        perspective: 0.009,
                        diameterRatio: 0.9,
                        onSelectedItemChanged: (value) {
                          viewModel.getPickedWeek(value);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: viewModel.calendar != null
                              ? viewModel.calendar!
                                  .years[viewModel.selectedyear!].weeks.length
                              : 0,
                          builder: (context, index) {
                            return Text(
                              "Week ${index + 1}",
                              style: const TextStyle(fontSize: 16),
                            );
                          },
                        ),
                      ),
                    ),
                    horizontalSpaceMedium,
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: ListWheelScrollView.useDelegate(
                        overAndUnderCenterOpacity: 0.3,
                        physics: const FixedExtentScrollPhysics(),
                        itemExtent: 20,
                        perspective: 0.009,
                        diameterRatio: 0.9,
                        onSelectedItemChanged: (value) {
                          viewModel.getPickedYear(value);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: viewModel.calendar != null
                              ? viewModel.calendar!.years.length
                              : 0,
                          builder: (context, index) {
                            return Text(
                              "Year ${viewModel.calendar!.years[index].yearNumber}",
                              style: const TextStyle(fontSize: 16),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            verticalSpaceMedium,
            Container(
              height: 250,
              decoration: const BoxDecoration(),
              child: GridView.builder(
                itemCount: viewModel.calendar != null
                    ? viewModel.calendar!.years[viewModel.selectedyear!]
                        .weeks[viewModel.selectedweek!].days.length
                    : 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      viewModel.savePickedDate(viewModel
                          .calendar!
                          .years[viewModel.selectedyear!]
                          .weeks[viewModel.selectedweek!]
                          .days[index]
                          .date!);
                      viewModel.showBottomSheet(viewModel.pickedDate!);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        height: 150,
                        width: 70,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5),
                              color: kcPurpleLight,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${formatToMonth(viewModel.calendar!.years[viewModel.selectedyear!].weeks[viewModel.selectedweek!].days[index].date!)}, ${formatToDay(viewModel.calendar!.years[viewModel.selectedyear!].weeks[viewModel.selectedweek!].days[index].date!)}",
                                ),
                                Text(
                                  "(${dateformater(viewModel.calendar!.years[viewModel.selectedyear!].weeks[viewModel.selectedweek!].days[index].date!)})",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            verticalSpaceSmall,
            const Divider(),
            verticalSpaceSmall,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Milestones",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            verticalSpaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.milestoneList!.length,
                itemBuilder: (context, index) {
                  if (viewModel.milestoneList!.isEmpty) {
                    return Container(
                      child: Center(
                        child: Text(
                          ksNoMilestone,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  } else {
                    return Milestone(
                        description:
                            viewModel.milestoneList![index]!.description!,
                        title: viewModel.milestoneList![index]!.title!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(CalendarViewViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getUserProfile();
  }

  @override
  CalendarViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CalendarViewViewModel();
}
