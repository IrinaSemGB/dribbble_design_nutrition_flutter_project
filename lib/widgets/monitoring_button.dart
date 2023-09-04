import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';
import '../constants/app_titles.dart';

class MonitoringButton extends StatefulWidget {

  final double height;
  MonitoringButton({Key? key, required this.height}) : super(key: key);

  @override
  State<MonitoringButton> createState() => _MonitoringButtonState(height: this.height);
}

class _MonitoringButtonState extends State<MonitoringButton> {

  double height;
  _MonitoringButtonState({required this.height});

  bool buttonWasPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (event) => setState(() => buttonWasPressed = true),
      onTapUp: (event) => setState(() => buttonWasPressed = false),
      onTapCancel: () => setState(() => buttonWasPressed = false),
      child: Container(
        height: height,
        width: height * 1.167,
        child: CustomPaint(
          painter: MonitoringButtonPainter(
            fillColor: buttonWasPressed ? AppColors.lavender.withOpacity(0.6) : AppColors.lavender,
          ),
          child: Center(
            child: Text(
              AppTitles.monitoring,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Bogart',
                color: buttonWasPressed ? AppColors.darkGreen.withOpacity(0.3) : AppColors.white,
                fontSize: height * 0.15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MonitoringButtonPainter extends CustomPainter {

  final Color fillColor;
  MonitoringButtonPainter({required this.fillColor});

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
        ..moveTo(width * 0.19, height * 0.1)
        ..quadraticBezierTo(width * 0.45, height * -0.06, width * 0.74, height * 0.1)
        ..quadraticBezierTo(width * 1.19, height * 0.38, width * 0.74, height * 0.83)
        ..quadraticBezierTo(width * 0.42, height * 1.1, width * 0.2, height * 0.89)
        ..quadraticBezierTo(width * 0.09, height * 0.8, width * 0.05, height * 0.6)
        ..quadraticBezierTo(width * -0.02, height * 0.26, width * 0.19, height * 0.1)
      ,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
