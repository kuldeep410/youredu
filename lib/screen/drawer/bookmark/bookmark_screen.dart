import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/bookmark/bookmark_screen_provider.dart';
import 'package:lms/screen/drawer/bookmark/components/bookmark_design_cart.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/widgets/bookmark_app_bar.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookmarkScreenProvider(),
      child: Consumer<BookmarkScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const BookmarkAppBar(appBarName: 'Your Bookmark'),
            ),
            body: provider.bookmarkResponse?.data?.bookmarks?.isEmpty ??
                    true == true
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: true,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "No Bookmark Found",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black26),
                            )),
                      )
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        provider.bookmarkResponse?.data?.bookmarks?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data =
                          provider.bookmarkResponse?.data?.bookmarks?[index];
                      return BookmarkDesignCart(
                        bookmarkResponse: data,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetailsScreen(
                                    id: provider.bookmarkResponse?.data
                                        ?.bookmarks?[index].id),
                              ));
                        },
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
