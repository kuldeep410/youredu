import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/search/search_page_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'widgets/search_design_cart.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchPageProvider(),
      child: Consumer<SearchPageProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Search'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              provider.getSearchValue(value);
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13.h, horizontal: 16.w),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.title.withOpacity(0.3),
                                    fontWeight: FontWeight.w600),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.border),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Image.asset(
                                    'assets/home_page/payment/Vector.png',
                                    scale: 1.5,
                                  ),
                                ),
                                border: const OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    provider.searchPageResponse?.data?.isEmpty == true
                        ?  Text(
                          'No Result Found',
                      style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.title),
                              )
                        // const NoResultFoundCart()
                        : SizedBox(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.searchPageResponse?.data
                                      ?.length ??
                                  0,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data = provider
                                    .searchPageResponse?.data?[index];
                                return SearchDesignCart(
                                  webinar: data,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CourseDetailsScreen(
                                              id: provider.searchPageResponse
                                                      ?.data?[index].id),
                                        ));
                                  },
                                );
                              },
                            ),
                          ),
                    //
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
