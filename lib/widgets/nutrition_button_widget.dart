import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';
import '../constants/app_titles.dart';

class NutritionButton extends StatefulWidget {
  final double height;
  const NutritionButton({super.key, required this.height});

  @override
  State<NutritionButton> createState() => _NutritionButtonState(height: this.height);
}

class _NutritionButtonState extends State<NutritionButton> {

  double height;
  _NutritionButtonState({required this.height});

  bool buttonWasPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (event) => setState(() => buttonWasPressed = true),
      onTapUp: (event) => setState(() => buttonWasPressed = false),
      onTapCancel: () => setState(() => buttonWasPressed = false),
      child: Container(
        width: height * 1.21,
        height: height,
        child: CustomPaint(
          painter: NutritionButtonPaint(fillColor: buttonWasPressed ? AppColors.blue.withOpacity(0.4) : AppColors.blue),
          child: Center(
            child: Text(
              AppTitles.nutrition,
              style: TextStyle(
                fontFamily: 'Bogart',
                color: buttonWasPressed ? AppColors.black.withOpacity(0.2) : AppColors.lime,
                fontSize: height * 0.19,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NutritionButtonPaint extends CustomPainter {

  final Color fillColor;
  NutritionButtonPaint({required this.fillColor});

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
        ..moveTo(width * 0.315, height * 0.1)
        ..quadraticBezierTo(width * 0.7, height * -0.1, width * 0.91, height * 0.1)
        ..quadraticBezierTo(width * 1.1, height * 0.35, width * 0.82, height * 0.75)
        ..quadraticBezierTo(width * 0.43, height * 1.24, width * 0.1, height * 0.75)
        ..quadraticBezierTo(width * -0.12, height * 0.35, width * 0.315, height * 0.1),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}