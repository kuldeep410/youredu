import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/profile/my_profile_provider.dart';
import 'package:lms/screen/profile/widgets/certificate_cart.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProfileProvider(),
      child: Consumer<MyProfileProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Certificate'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(22.0),
              child: CertificateCart(
                  userCertificateResponse: provider.userCertificateResponse),
            ),
          );
        },
      ),
    );
  }
}
