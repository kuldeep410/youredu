import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/dashboard/widgets/indicator.dart';
import 'package:lms/utils/app_consts.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.7,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 60.r,
                    sections: showingSections(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0.h),
                child: Wrap(
                  children: <Widget>[
                    const Indicator(
                      color: Color(0xff29D697),
                      text: 'Basic HTML',
                      isSquare: true,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Indicator(
                      color: Color(0xfff8b250),
                      text: 'Basic CSS',
                      isSquare: true,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Indicator(
                      color: Color(0xff845bef),
                      text: 'JavaScript',
                      isSquare: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 110.h,
            right: 0,
            left: 0,
            child: Image.asset(
              'assets/home_page/pie_img.png',
              height: 94.h,
            )),
        Positioned(
            bottom: 140.h,
            right: 0,
            left: 145.w,
            child: Text(
              "65%",
              style: TextStyle(
                  color: AppColors.success,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 15.0 : 10.0;
      final radius = isTouched ? 30.0 : 20.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 20,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.primary,
            value: 20,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.white,
            value: 20,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 20,
            title: '35%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
