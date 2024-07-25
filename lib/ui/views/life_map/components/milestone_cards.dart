import 'package:flutter/widgets.dart';
import 'package:my_life_calendar_app/ui/common/app_colors.dart';
import 'package:my_life_calendar_app/ui/common/app_textstyles.dart';

class Milestonecard extends StatelessWidget {
  final String? title;
  final String? description;

  const Milestonecard(
      {super.key, required this.description, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 150,
        child: Container(
          decoration: BoxDecoration(
              color: kcMiletoneCard,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  title!,
                  style: ktsHeader5, //header5
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  height: 95,
                  child: Text(
                    description!,
                    style: ktsBodyNormal, //body1
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
