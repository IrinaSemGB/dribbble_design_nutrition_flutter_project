import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';
import '../constants/app_titles.dart';

class RecipesButton extends StatefulWidget {
  final double height;
  const RecipesButton({super.key, required this.height});

  @override
  State<RecipesButton> createState() => _RecipesButtonState(height: this.height);
}

class _RecipesButtonState extends State<RecipesButton> {

  double height;
  _RecipesButtonState({required this.height});

  bool buttonWasPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (event) => setState(() => buttonWasPressed = true),
      onTapUp: (event) => setState(() => buttonWasPressed = false),
      onTapCancel: () => setState(() => buttonWasPressed = false),
      child: Container(
        width: height * 1.16,
        height: height,
        child: CustomPaint(
          painter: RecipeButtonPainter(fillColor: buttonWasPressed ? AppColors.lightGreen.withOpacity(0.5) : AppColors.lightGreen),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppTitles.recipes,
                  style: TextStyle(
                    fontFamily: 'Bogart',
                    fontSize: height * 0.14,
                    color: buttonWasPressed ? AppColors.khaki.withOpacity(0.6) : AppColors.khaki,
                    wordSpacing: 1.5,
                  ),
                ),
                Text(
                  AppTitles.library,
                  style: TextStyle(
                    height: 0.9,
                    fontFamily: 'Bogart',
                    fontSize: height * 0.14,
                    color: buttonWasPressed ? AppColors.khaki.withOpacity(0.6) : AppColors.khaki,
                    wordSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeButtonPainter extends CustomPainter {

  final Color fillColor;
  RecipeButtonPainter({required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {

    final width = size.width;
    final height = size.height;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = fillColor
      ..isAntiAlias = true;

    canvas.drawPath(
      Path()
        ..moveTo(width * 0.525, height * 0.1)
        ..quadraticBezierTo(width * 0.6, height * -0.015, width * 0.738, height * 0.1)
        ..quadraticBezierTo(width * 0.86, height * 0.2, width * 0.95, height * 0.5)
        ..quadraticBezierTo(width * 1.025, height * 0.84, width * 0.738, height * 0.929)
        ..quadraticBezierTo(width * 0.44, height * 1.02, width * 0.2, height * 0.895)
        ..cubicTo(width * -0.11, height * 0.695, width * 0.05, height * 0.35, width * 0.15, height * 0.292)
        ..quadraticBezierTo(width * 0.2, height * 0.258, width * 0.25, height * 0.248)
        ..quadraticBezierTo(width * 0.45, height * 0.215, width * 0.525, height * 0.1)
      ,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}