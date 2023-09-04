import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';
import '../constants/app_titles.dart';


class CarbsButton extends StatefulWidget {
  final double height;
  const CarbsButton({super.key, required this.height});

  @override
  State<CarbsButton> createState() => _CarbsButtonState(height: this.height);
}

class _CarbsButtonState extends State<CarbsButton> {

  double height;
  _CarbsButtonState({required this.height});

  bool buttonWasPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (event) => setState(() => buttonWasPressed = true),
      onTapUp: (event) => setState(() => buttonWasPressed = false),
      onTapCancel: () => setState(() => buttonWasPressed = false),
      child: Container(
        width: height,
        height: height * 1.06,
        child: CustomPaint(
          painter: CarbsButtonPainter(fillColor: buttonWasPressed ? AppColors.black.withOpacity(0.08) : AppColors.white),
          child: Center(
            child: Text(
              AppTitles.carbs,
              style: TextStyle(
                fontFamily: 'Bogart',
                color: buttonWasPressed ? AppColors.orange.withOpacity(0.5) : AppColors.orange,
                fontSize: height * 0.215,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CarbsButtonPainter extends CustomPainter {

  final Color fillColor;
  CarbsButtonPainter({required this.fillColor});

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
        ..moveTo(width * 0.45, height * 0.045)
        ..quadraticBezierTo(width * 1.25, height * 0.25, width * 0.83, height * 0.822)
        ..quadraticBezierTo(width * 0.48, height * 1.2, width * 0.2, height * 0.6)
        ..quadraticBezierTo(width * -0.11, height * -0.1, width * 0.45, height * 0.045),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}