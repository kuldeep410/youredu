import 'package:flutter/material.dart';
import 'package:lms/web/web_top_nav_bar.dart';
import 'package:lms/web/widgets/academy_content.dart';
import 'package:lms/web/widgets/most_treanding_category_content.dart';
import 'package:lms/web/widgets/web_constructors_content.dart';
import 'package:lms/web/widgets/web_most_popular_content.dart';
import 'package:lms/web/widgets/web_organization_content.dart';
import 'package:lms/web/widgets/web_recommanded_content.dart';
import 'package:lms/web/widgets/web_treanding_content.dart';
import 'widgets/header_banner_section.dart';
import 'widgets/web_top_rated_content.dart';

class WebLandingPage extends StatelessWidget {
  const WebLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WebTopNavBar(),
            const SizedBox(
              height: 140,
            ),
            const HeaderBannerSection(),
            const SizedBox(
              height: 140,
            ),
            const AcademyContent(),
            const WebMostPopularContent(),
            const WebTreandingContent(),
            const WebTopRatedContent(),
            const WebRecommandedContent(),
            const WebInstructorsContent(),
            const WebOrganizationsContent(),
            const WebMostTreandingCategoryContent(),
            Container()
          ],
        ),
      ),
    );
  }
}

