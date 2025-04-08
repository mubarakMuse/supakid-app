import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  var graphPoints = <ChartData>[
    ChartData(0, 0.6),
    ChartData(1, 0.7),
    ChartData(2, 0.5),
    ChartData(3, 0.75),
    ChartData(4, 0.6),
    ChartData(5, 0.7),
  ].obs; // Sample Data
}

class ChartData {
  final double x;
  final double y;

  ChartData(this.x, this.y);
}