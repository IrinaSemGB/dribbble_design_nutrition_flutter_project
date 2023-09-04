import 'package:dribbble_design_nutrition_flutter_project/screens/nutrition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) => runApp(const NutritionApp()));
}

class NutritionApp extends StatelessWidget {
  const NutritionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NutritionScreen(),
    );
  }
}
