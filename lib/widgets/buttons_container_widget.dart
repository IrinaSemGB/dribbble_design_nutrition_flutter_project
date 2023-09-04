import 'dart:math' show pi;
import 'package:dribbble_design_nutrition_flutter_project/widgets/carbs_button_widget.dart';
import 'package:dribbble_design_nutrition_flutter_project/widgets/food_button_widget.dart';
import 'package:dribbble_design_nutrition_flutter_project/widgets/nutrition_button_widget.dart';
import 'package:dribbble_design_nutrition_flutter_project/widgets/recipes_button_widget.dart';
import 'package:dribbble_design_nutrition_flutter_project/widgets/support_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'monitoring_button.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
      ),
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: height * 0.055,
            left: 0,
            child: MonitoringButton(height: height * 0.34),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SupportButtonWidget(height: height * 0.32),
          ),
          Positioned(
            top: height * 0.34,
            right: height * 0.015,
            child: FoodButton(height: height * 0.25),
          ),
          Positioned(
            top: height * 0.395,
            left: 0,
            child: NutritionButton(height: height * 0.27),
          ),
          Positioned(
            top: height * 0.6,
            left: height * 0.04,
            child: RecipesButton(height: height * 0.37),
          ),
          Positioned(
            top: height * 0.6,
            right: height * 0.02,
            child: CarbsButton(height: height *  0.24),
          ),
          Positioned(
            bottom: -height * 0.02,
            right: height * 0.04,
            width: height * 0.13,
            child: Transform.rotate(
              angle: pi / 6,
              child: Image.asset('assets/images/arrow.png')),
          ),
        ],
      ),
    );
  }
}