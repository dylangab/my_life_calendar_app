import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/ui/views/life_map/components/custom_timeline_tile.dart';
import 'package:my_life_calendar_app/ui/views/life_map/components/milestone_cards.dart';
import 'package:stacked/stacked.dart';

import 'life_map_viewmodel.dart';

class LifeMapView extends StackedView<LifeMapViewModel> {
  const LifeMapView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LifeMapViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          title: const Center(
            child: Text(
              "Life Map",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: FutureBuilder(
          future: viewModel.timeline(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (viewModel.milestoneList!.isEmpty) {
              return Container(
                child: const Center(
                  child: Text("You haven't added any mile stone"),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: viewModel.milestoneList!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Customtimelinetile(
                        isfirst: index == 0,
                        islast: index == viewModel.milestoneList!.length - 1,
                        milestoneWidget: Milestonecard(
                            description:
                                viewModel.milestoneList![index]!.description,
                            title: viewModel.milestoneList![index]!.title)),
                  );
                },
              );
            }
          },
        ));
  }

  @override
  LifeMapViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LifeMapViewModel();
}
