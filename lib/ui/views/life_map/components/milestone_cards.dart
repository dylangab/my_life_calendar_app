import 'package:flutter/widgets.dart';

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
              color: const Color.fromARGB(255, 247, 219, 240),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  title!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  height: 95,
                  child: Text(
                    description!,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
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
