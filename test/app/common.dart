
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initWidgetTest({required WidgetTester widgetTester}) async {
  widgetTester.binding.window.physicalSizeTestValue = const Size(1000, 1920);
  widgetTester.binding.window.devicePixelRatioTestValue = 1;
  addTearDown(widgetTester.binding.window.clearPhysicalSizeTestValue);
  addTearDown(widgetTester.binding.window.clearDevicePixelRatioTestValue);
  SharedPreferences.setMockInitialValues(<String, Object>{});
  await widgetTester.runAsync(
    () async {
      await EasyLocalization.ensureInitialized();
    },
  );
}

