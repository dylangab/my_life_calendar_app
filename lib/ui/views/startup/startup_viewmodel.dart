import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  // Service instance for navigation
  final _navigationService = locator<NavigationService>();

  // Runs startup logic before entering the application
  Future runStartupLogic() async {
    // Simulate a delay for splash screen or initial loading
    await Future.delayed(const Duration(seconds: 3));

    // Open the Hive box to get the user profile
    var userProfile = Hive.box('user_profile');

    // Check if the user profile exists and navigate accordingly
    if (userProfile.get('user_profile') != null) {
      // Navigate to the home view if user profile exists
      _navigationService.replaceWithHomeView();
    } else {
      // Navigate to the onboarding view if user profile does not exist
      _navigationService.replaceWithOnBoardingView();
    }
  }
}
