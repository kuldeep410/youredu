import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/data/model/profile_response/edit_profile_response.dart';
import 'package:lms/data/repository/profile_repository/edit_profile_repository.dart';
import 'package:lms/screen/auth/login_screen/login_screen.dart';
import 'package:lms/screen/home/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/utils/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;

import 'components/custom_dialog_image.dart';

class EditProfileProvider extends ChangeNotifier {
  String? userName;
  String? userAvatar;
  String? userJoinDate;
  String? userDateOfBirth;
  File? imagePath;
  final editNameController = TextEditingController();
  final phoneEditController = TextEditingController();
  final emailEditController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  EditProfileResponse? editProfileRespnse;
  DateTime? selectedDate;
  DateTime? joinDateEdit;
  // String? filename;
  ///Pick image from Camera and Gallery
  Future<dynamic> pickImage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogImagePicker(
          onCameraClick: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(
                source: ImageSource.camera,
                maxHeight: 300,
                maxWidth: 300,
                imageQuality: 90);
            imagePath = File(image!.path);
            // updateProfileImage(imagePath);
            notifyListeners();
            if (kDebugMode) {
              print(File(image.path));
            }
          },
          onGalleryClick: () async {
            final ImagePicker pickerGallery = ImagePicker();
            final XFile? imageGallery = await pickerGallery.pickImage(
                source: ImageSource.gallery,
                maxHeight: 300,
                maxWidth: 300,
                imageQuality: 90);
            imagePath = File(imageGallery!.path);
            // updateProfileImage(imagePath);
            if (kDebugMode) {
              print(File(imageGallery.path));
            }
          },
        );
      },
    );
    notifyListeners();
  }

  EditProfileProvider() {
    getUserData();
  }
  void getUserData() async {
    userName = await SPUtill.getValue(SPUtill.keyName);
    userAvatar = await SPUtill.getValue(SPUtill.keyAvatar);
    userDateOfBirth = await SPUtill.getValue(SPUtill.keyDateBirth);
    userJoinDate = await SPUtill.getValue(SPUtill.keyJoinDate);
    setControllerData();
    notifyListeners();
  }

  void setControllerData() async {
    editNameController.text = await SPUtill.getValue(SPUtill.keyName) ?? '';
    phoneEditController.text = await SPUtill.getValue(SPUtill.keyMobile) ?? '';
    emailEditController.text = await SPUtill.getValue(SPUtill.keyEmail) ?? '';
    emailEditController.text = await SPUtill.getValue(SPUtill.keyEmail) ?? '';
    // dateEditController.text = await SPUtill.getValue(SPUtill.keyJoinDate) ?? '';
  }

  /// Select date data of joining function.....
  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate:
            joinDateEdit != null ? joinDateEdit!.toLocal() : DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      joinDateEdit = selectedDate!.toLocal();
      notifyListeners();
    }
  }

  void setDataSharePreferences(EditProfileResponse? editProfileRespnse) {
    SPUtill.setValue(SPUtill.keyName, editProfileRespnse?.data?.user?.name);
    SPUtill.setValue(SPUtill.keyEmail, editProfileRespnse?.data?.user?.email);
    SPUtill.setValue(SPUtill.keyMobile, editProfileRespnse?.data?.user?.mobile);
    SPUtill.setValue(SPUtill.keyAvatar, editProfileRespnse?.data?.user?.avatar);
    SPUtill.setValue(SPUtill.keyJoinDate,
        editProfileRespnse?.data?.user?.joinDate.toString());
    SPUtill.setValue(SPUtill.keyDateBirth,
        editProfileRespnse?.data?.user?.dateOfBirth.toString());
  }

  void editProfileInfo(context) async {
    final data = dio.FormData.fromMap({
      'name': editNameController.text,
      'phone': phoneEditController.text,
      'date_of_birth': joinDateEdit.toString(),
      'email': emailEditController.text,
      'profile_image': imagePath?.path != null
          ? await dio.MultipartFile.fromFile(
              imagePath?.path ?? editProfileRespnse?.data?.user?.avatar ?? '',
              filename:
                  imagePath?.path ?? editProfileRespnse?.data?.user?.avatar,
            )
          : null,
    });

    var apiResponse = await EditProfileRepository.editProfileData(data);

    if (apiResponse.success = true) {
      setDataSharePreferences(apiResponse.data);
      NavUtil.pushAndRemoveUntil(context, const BottomNavBar());
      Fluttertoast.showToast(
          msg: apiResponse.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: apiResponse.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    notifyListeners();
  }

  void updatePassword(context) async {
    final data = dio.FormData.fromMap({
      'old_password': oldPasswordController.text,
      'password': newPasswordController.text,
      'password_confirmation': confirmPasswordController.text,
    });
    var apiResponse = await EditProfileRepository.updatePassword(data);

    if (apiResponse.success = true) {
      logOut(context);
      Fluttertoast.showToast(
          msg: apiResponse.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: apiResponse.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    notifyListeners();
  }
}

void logOut(context) async {
  await SPUtill.deleteKey(
    SPUtill.keyAuthToken,
  );
  await SPUtill.deleteKey(
    SPUtill.keyName,
  );
  await SPUtill.deleteKey(
    SPUtill.keyEmail,
  );
  await SPUtill.deleteKey(
    SPUtill.keyMobile,
  );
  await SPUtill.deleteKey(
    SPUtill.keyAvatar,
  );
  await SPUtill.deleteKey(
    SPUtill.keyStatus,
  );
  await SPUtill.deleteKey(
    SPUtill.keyJoinDate,
  );
  await SPUtill.deleteKey(
    SPUtill.keyDateBirth,
  );
  NavUtil.pushAndRemoveUntil(context, const LogInScreen());
}
