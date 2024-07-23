// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/pick_birth_date/pick_birth_date_dialog.dart';

enum DialogType {
  infoAlert,
  pickBirthDate,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.pickBirthDate: (context, request, completer) =>
        PickBirthDateDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
