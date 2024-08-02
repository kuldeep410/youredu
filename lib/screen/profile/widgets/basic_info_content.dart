import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/widgets/text_form_field.dart';
import 'package:lms/screen/profile/edit_profile_screen/edit_profile_provider.dart';
import 'package:lms/widgets/elevated_button_widget.dart';

class BasicInfoContent extends StatelessWidget {
  final EditProfileProvider? provider;
  const BasicInfoContent({Key? key, this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        FromField(
          title: "Full Name",
          hintText: "Write your full name",
          controller: provider?.editNameController,
        ),
        SizedBox(
          height: 24.h,
        ),
        FromField(
          title: "Email Address",
          hintText: "Write your email address",
          controller: provider?.emailEditController,
        ),
        SizedBox(
          height: 24.h,
        ),
        FromField(
          title: "Phone Number",
          hintText: "+01 | 023-6894-523",
          controller: provider?.phoneEditController,
        ),
        SizedBox(
          height: 24.h,
        ),
        // FromField(
        //     controller: provider?.dateEditController,
        //     title: "Date of Birth",
        //     hintText: "23-06-1995",
        //     suffixIcon: IconButton(
        //         onPressed: () {},
        //         icon: const Icon(Icons.calendar_today_outlined))),
        InkWell(
          onTap: () => provider?.selectDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  provider?.joinDateEdit != null
                      ? "${provider?.joinDateEdit!.toLocal()}".split(" ")[0]
                      : "${provider?.userDateOfBirth}".split(" ")[0],
                  style: const TextStyle(fontSize: 14),
                ),
                const Icon(Icons.date_range_outlined)
              ],
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        ElevatedButtonWidget(
          text: "Update",
          onPressed: () {
            provider?.editProfileInfo(context);
          },
        )
      ],
    );
  }
}
