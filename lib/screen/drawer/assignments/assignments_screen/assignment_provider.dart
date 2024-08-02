import 'package:flutter/material.dart';
import 'package:lms/data/model/assignment_response/assignment_response.dart';
import 'package:lms/data/repository/assignment_repository/assignment_repository.dart';

class AssignmentProvider extends ChangeNotifier {
  AssignmentResponse? assignmentResponse;

  AssignmentProvider() {
    assignmentApi();
  }

  void assignmentApi() async {
    var apiResponse = await AssignmentRepository.getAssignmentRepositoryData();

    if (apiResponse.success == true) {
      assignmentResponse = apiResponse.data;
      notifyListeners();
    }
  }
}