import 'package:flutter/material.dart';
import 'package:lms/data/model/payment_list_response/payment_list_response.dart';
import 'package:lms/data/repository/payment_list_repository/payment_list_repository.dart';
import 'package:lms/screen/home/course_details/payment_web_view/payment_webview.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/utils/shared_preferences.dart';

class PaymentMethodProvider extends ChangeNotifier {
  PaymentListResponse? paymentListResponse;
  String? userId;

  PaymentMethodProvider() {
    getPaymentListApi();
    getUserData();
  }

  void getPaymentRequestApi(
    context,
    String? userId,
    int? courseId,
    String? paymentName,
  ) async {
    String? url =
        "${AppConst.baseUrlApi}/checkout/payment/$userId/$courseId/$paymentName";

    NavUtil.navigateScreen(
        context,
        PaymentWebView(
          url: url,
        ));

    notifyListeners();
  }

  void getUserData() async {
    userId = await SPUtill.getValue(SPUtill.keyUserId);

    notifyListeners();
  }

  void getPaymentListApi() async {
    var apiResponse = await PaymentListRepository.getPaymentListApi();
    if (apiResponse.success == true) {
      paymentListResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
