import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lms/data/repository/assignment_repository/assignment_upload_repository.dart';
import 'package:lms/screen/drawer/assignments/assignments_screen/assignments_screen.dart';
import 'package:lms/utils/nav_utail.dart';

class AssignmentUploadProvider extends ChangeNotifier {
  File? file;
  File? assignmentFile;
  String? assignmentFileName;
  int? assignmentId;

  AssignmentUploadProvider({int? assignmentId}) {
    // uploadFile(BuildContext, assignmentId);
  }

  pickAssignmentFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      assignmentFile = File(result.files.single.path!);
      assignmentFileName = result.files.first.name;
      debugPrint(result.files.first.bytes.toString());
      debugPrint(result.files.first.size.toString());
      debugPrint(result.files.first.extension.toString());
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  void uploadFile(context, int? assignmentId) async {
    var fromData = FormData.fromMap({});

    fromData.files.add(MapEntry(
        'assignment_file', await MultipartFile.fromFile(assignmentFile!.path)));
    var response =
        await AssignmentUploadRepository.getAssignmentUploadRepositoryData(
            assignmentId, fromData);
    if (response.success == true) {
      Fluttertoast.showToast(msg: "${response.data?.message}");
      NavUtil.replaceScreen(context, const AssignmentsScreen());
    } else {
      Fluttertoast.showToast(msg: "${response.data?.message}");
      Navigator.pop(context);
    }
  }
}
