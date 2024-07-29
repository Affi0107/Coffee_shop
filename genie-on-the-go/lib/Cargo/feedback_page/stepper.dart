import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:linear_step_indicator/linear_step_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Statusindicator extends StatefulWidget {
  Statusindicator({super.key});

  @override
  State<Statusindicator> createState() => _StepperrState();
}

class _StepperrState extends State<Statusindicator> {
  // final pgc = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              isFirst: true,
              endChild: Text(
                "Payment",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              indicatorStyle: IndicatorStyle(
                  height: 30,
                  color: Colors.green,
                  iconStyle:
                      IconStyle(iconData: Icons.done, color: Colors.white)),
              beforeLineStyle: LineStyle(color: Colors.green),
            ),
          ),
          Expanded(
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              endChild: Text("Order Completed",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              indicatorStyle: IndicatorStyle(
                  height: 30,
                  color: Colors.green,
                  iconStyle:
                      IconStyle(iconData: Icons.done, color: Colors.white)),
              beforeLineStyle: LineStyle(color: Colors.green),
            ),
          ),
          Expanded(
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              isLast: true,
              indicatorStyle: IndicatorStyle(height: 30),
              endChild: Text("Delivered",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
