import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/ui/common/app_strings.dart';
import 'package:my_life_calendar_app/ui/common/app_textstyles.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';

class InformationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const InformationCard(
      {super.key, required this.body, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
          ),
          horizontalSpaceTiny,
          SizedBox(
            width: 400,
            child: ListTile(
              title: Text(title, style: ktsHeader5), // header5
              subtitle: Text(body),
            ),
          ),
        ],
      ),
    );
  }
}
