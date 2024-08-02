import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/profile_response/user_certificate_response.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class CertificateContent extends StatelessWidget {
  final UserCertificateResponse? userCertificateResponse;
  const CertificateContent({super.key, this.userCertificateResponse});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: userCertificateResponse?.data?.certificates == null
            ? Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Image.asset(
                    'assets/mentors/file_box.png',
                    height: 214.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomText(
                    text: "Certificate not found",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.title,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies enim, donec',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.6,
                      letterSpacing: 1.2,
                      color: AppColors.body,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : SliverList(delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final data =
                      userCertificateResponse?.data?.certificates?[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        text: data?.title ?? "",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.title,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: data?.certificate?.file ?? '',
                        placeholder: (context, url) => Center(
                          child:
                              Image.asset("assets/home_page/ic_no_image.png"),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/home_page/ic_no_image.png"),
                      ),
                    ],
                  );
                },
              )));
  }
}
