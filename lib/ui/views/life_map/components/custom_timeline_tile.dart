import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/ui/common/app_colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Customtimelinetile extends StatelessWidget {
  final bool? isfirst;
  final bool? islast;
  final Widget? milestoneWidget;
  const Customtimelinetile(
      {super.key,
      required this.isfirst,
      required this.islast,
      required this.milestoneWidget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: TimelineTile(
        beforeLineStyle: const LineStyle(color: kcPurple),
        indicatorStyle: const IndicatorStyle(color: kcPurple, width: 25),
        endChild: milestoneWidget,
        isFirst: isfirst!,
        isLast: islast!,
        hasIndicator: true,
      ),
    );
  }
}
