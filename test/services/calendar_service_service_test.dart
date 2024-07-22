import 'package:flutter_test/flutter_test.dart';
import 'package:my_life_calendar_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CalendarServiceServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
