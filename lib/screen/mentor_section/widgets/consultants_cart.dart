import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/mentors_response/mentors_response.dart';
import 'package:lms/screen/mentor_section/mentors_profile_details/mentors_profile_details.dart';
import 'package:lms/screen/mentor_section/widgets/mentors_design_cart.dart';

class ConsultantsCart extends StatelessWidget {
  final MentorsResponse? mentorsResponse;
  const ConsultantsCart({Key? key, this.mentorsResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mentorsResponse?.data?.instructors?.isEmpty ?? true == true
        ? const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: true,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Consultants not found",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26),
                    )),
              )
            ],
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 180.h,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemCount: mentorsResponse?.data?.instructors?.length ?? 0,
            itemBuilder: (context, index) {
              final data = mentorsResponse?.data?.instructors?[index];
              return MentorsDesignCart(
                image: data?.image,
                name: data?.name,
                title: data?.role,
                // rating: double.parse("${data?.rating}"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MentorsProfile(users: data),
                      ));
                },
              );
            },
          );
  }
}
