import 'package:dribbble_design_nutrition_flutter_project/constants/app_colors.dart';
import 'package:dribbble_design_nutrition_flutter_project/constants/app_titles.dart';
import 'package:flutter/material.dart';
import '../widgets/buttons_container_widget.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;
    final mainContainerHeight = height - (height * 0.125);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.085,
          bottom: height * 0.04,
          left: width * 0.03,
        ),
        child: Center(
          child: Container(
            height: mainContainerHeight,
            width: mainContainerHeight * 0.49,
            child: Column(
              children: [
                Container(
                  height: mainContainerHeight * 0.28,
                  child: RichText(
                    text: TextSpan(
                      text: AppTitles.mainTitleThe,
                      style: TextStyle(
                        fontFamily: 'Bogart',
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        fontSize: height * 0.056,
                        height: 1.1,
                      ),
                      children: [
                        TextSpan(
                          text: AppTitles.mainTitleUltimate,
                          style: TextStyle(
                            color: AppColors.blue,
                          ),
                        ),
                        TextSpan(
                          text: AppTitles.mainTitleMain,
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonsContainer(
                  height: mainContainerHeight * 0.72,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}











