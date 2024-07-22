import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardingViewModel extends BaseViewModel {
  // Service instance for navigation
  final _navigationService = locator<NavigationService>();

  // Navigates to the Create Profile view
  void goToNextPage() {
    _navigationService.navigateToCreateProfileView();
  }
}
