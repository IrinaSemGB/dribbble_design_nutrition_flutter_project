import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';
import '../constants/app_titles.dart';

class FoodButton extends StatefulWidget {
  final double height;
  const FoodButton({super.key, required this.height});

  @override
  State<FoodButton> createState() => _FoodButtonState(height: this.height);
}

class _FoodButtonState extends State<FoodButton> {

  double height;
  _FoodButtonState({required this.height});

  bool buttonWasPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (event) => setState(() => buttonWasPressed = true),
      onTapUp: (event) => setState(() => buttonWasPressed = false),
      onTapCancel: () => setState(() => buttonWasPressed = false),
      child: Container(
        width: height * 1.25,
        height: height,
        child: CustomPaint(
          painter: FoodButtonPainter(fillColor: buttonWasPressed ? AppColors.aquamarine.withOpacity(0.8) : AppColors.aquamarine),
          child: Center(
            child: Text(
              AppTitles.food,
              style: TextStyle(
                fontFamily: 'Bogart',
                color: buttonWasPressed ? AppColors.darkGreen.withOpacity(0.5) : AppColors.darkGreen,
                fontSize: height * 0.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FoodButtonPainter extends CustomPainter {

  final Color fillColor;
  FoodButtonPainter({required this.fillColor});

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
        ..moveTo(width * 0.235, height * 0.094)
        ..quadraticBezierTo(width * 0.53, height * -0.065, width * 0.845, height * 0.21)
        ..quadraticBezierTo(width * 1.125, height * 0.51, width * 0.845, height * 0.805)
        ..quadraticBezierTo(width * 0.53, height * 1.09, width * 0.2, height * 0.88)
        ..cubicTo(width * -0.21, height * 0.54, width * 0.11, height * 0.14, width * 0.235, height * 0.095),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}