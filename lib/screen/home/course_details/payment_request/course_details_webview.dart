import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/utils/shared_preferences.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_android/webview_flutter_android.dart' as web;
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart'
    as web;

class CourseDetailsWebView extends StatefulWidget {
  final int? courseId;
  final String? userId;

  const CourseDetailsWebView({super.key, this.courseId, this.userId});

  @override
  State<CourseDetailsWebView> createState() => _CourseDetailsWebViewState();
}

class _CourseDetailsWebViewState extends State<CourseDetailsWebView> {
  final userId = SPUtill.getValue(SPUtill.keyUserId);
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is web.WebKitWebViewPlatform) {
      params = web.WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <web.PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');

            /// https://olearn.onesttech.com/payments/verify/Stripe?status=success
            if (request.url.toLowerCase().contains("status=success")) {
              NavUtil.pushAndRemoveUntil(context, const BottomNavBar());
            } else {
              // CustomDialog.showMessage(context);
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(
          "${AppConst.baseUrlApi}/student/course/${widget.courseId}/${widget.userId}/learn/lecture"));

    // #docregion platform_features
    if (controller.platform is web.AndroidWebViewController) {
      web.AndroidWebViewController.enableDebugging(true);
      (controller.platform as web.AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: "Course Learning"),
      ),
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
