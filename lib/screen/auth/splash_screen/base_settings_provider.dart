// import 'package:flutter/material.dart';
// import 'package:lms/data/model/base_settings_response/base_settings_response.dart';
// import 'package:lms/data/repository/base_settings_repository.dart/base_settings_repository.dart';

// class BaseSettingsProvider extends ChangeNotifier {
//   BaseSettingsResponse? baseSettingsResponse;

//   BaseSettingsProvider() {
//     baseSettings();
//   }

//   void baseSettings() async {
//     var apiResponse = await BaseSettingsRepository.getBaseSettingsApi();

//     if (apiResponse.success == true) {
//       baseSettingsResponse = apiResponse.data;
//     }
//   }
// }
