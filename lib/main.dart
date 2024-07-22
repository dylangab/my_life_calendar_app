import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_life_calendar_app/app/app.bottomsheets.dart';
import 'package:my_life_calendar_app/app/app.dialogs.dart';
import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/app/app.router.dart';
import 'package:my_life_calendar_app/models/milestone_model.dart';
import 'package:my_life_calendar_app/models/user_model.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  Hive.registerAdapter(UserProfileAdapter());
  Hive.registerAdapter(MilestoneAdapter());
  await Hive.openBox('user_profile');
  await Hive.openBox<Milestone>('user_milestone');
  await Hive.openBox<DateTime>('user_dates');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
