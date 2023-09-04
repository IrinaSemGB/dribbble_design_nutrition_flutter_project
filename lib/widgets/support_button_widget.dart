import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';
import '../constants/app_titles.dart';

class SupportButtonWidget extends StatefulWidget {
  final double height;
  const SupportButtonWidget({Key? key, required this.height}) : super(key: key);

  @override
  State<SupportButtonWidget> createState() => _SupportButtonWidgetState(height: this.height);
}

class _SupportButtonWidgetState extends State<SupportButtonWidget> {

  double height;
  _SupportButtonWidgetState({required this.height});

  bool buttonWasPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (event) => setState(() => buttonWasPressed = true),
      onTapUp: (event) => setState(() => buttonWasPressed = false),
      onTapCancel: () => setState(() => buttonWasPressed = false),
      child: Container(
        width: height * 1.26,
        height: height,
        child: CustomPaint(
          painter: SupportButton(fillColor: buttonWasPressed ? AppColors.lightBlue.withOpacity(0.6) : AppColors.lightBlue),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  AppTitles.support,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: buttonWasPressed ? AppColors.white : AppColors.yellow,
                    fontFamily: 'Bogart',
                    fontSize: height * 0.15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SupportButton extends CustomPainter {

  final Color fillColor;
  SupportButton({required this.fillColor});

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
        ..moveTo(width * 0.1, height * 0.047)
        ..quadraticBezierTo(width * 0.65, height * -0.03, width * 0.9, height * 0.335)
        ..quadraticBezierTo(width * 1.02, height * 0.57, width * 0.885, height * 0.75)
        ..quadraticBezierTo(width * 0.8, height * 0.88, width * 0.6, height * 0.955)
        ..quadraticBezierTo(width * 0.5, height * 0.99, width * 0.4, height * 0.93)
        ..quadraticBezierTo(width * 0.271, height * 0.84, width * 0.325, height * 0.6)
        ..quadraticBezierTo(width * 0.333, height * 0.45, width * 0.24, height * 0.355)
        ..quadraticBezierTo(width * 0.13, height * 0.25, width * 0.1, height * 0.229)
        ..quadraticBezierTo(width * -0.05, height * 0.12, width * 0.1, height * 0.047),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
