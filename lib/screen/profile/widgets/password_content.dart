import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/widgets/text_form_field.dart';
import 'package:lms/screen/profile/edit_profile_screen/edit_profile_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/elevated_button_widget.dart';

class PasswordContent extends StatefulWidget {
  final EditProfileProvider? provider;
  const PasswordContent({Key? key, this.provider}) : super(key: key);

  @override
  State<PasswordContent> createState() => _PasswordContentState();
}

class _PasswordContentState extends State<PasswordContent> {
  final _passwordFormKey = GlobalKey<FormState>();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _passwordFormKey,
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          FromField(
            title: "Current Password",
            hintText: "***********",
            controller: widget.provider?.oldPasswordController,
            validator: (textValue) {
              if (textValue == null || textValue.isEmpty) {
                return 'Current Password is required!';
              }
              return null;
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          // FromField(
          //   title: "New Password",
          //   hintText: "Enter new password",
          // ),
    
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Password',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: widget.provider?.newPasswordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                    hintText: 'Enter new password',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey.withOpacity(.2),
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.hintTextColor,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder()),
                    validator: (textValue) {
                  if (textValue == null || textValue.isEmpty) {
                    return 'New Password is required!';
                  }
                  return null;
                },
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Re-enter New Password',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: widget.provider?.confirmPasswordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                    hintText: 'Re-enter New Password',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey.withOpacity(.2),
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.hintTextColor,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder()),
                       validator: (textValue) {
                  if (textValue == null || textValue.isEmpty) {
                    return 'Re-enter Password is required!';
                  }
                  return null;
                },
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          ElevatedButtonWidget(
            text: "Update",
            onPressed: () {
            if(_passwordFormKey.currentState!.validate()){
                widget.provider?.updatePassword(context);
            }
            },
          )
        ],
      ),
    );
  }
}
