import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/app/app.router.dart';
import 'package:my_life_calendar_app/services/hive_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardingViewModel extends BaseViewModel {
  // Service instance for navigation
  final _navigationService = locator<NavigationService>();
  final _hiveService = locator<HiveService>();

  // Navigates to the Create Profile view
  void goToNextPage() {
    _navigationService.navigateToCreateProfileView();
  }

  Future<void> loadingButton() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 3)); // Simulating network call
    setBusy(false);
  }

  Future<void> startLoadingButton() async {
    await runBusyFuture(loadingButton());
  }

  void deleteUserData() {
    _hiveService.deleteUserData();
    _hiveService.deletedates();
  }
}
