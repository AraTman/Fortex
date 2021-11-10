import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';


class Example9Vertical extends StatelessWidget {
  const Example9Vertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TimelineTile(
                  alignment: TimelineAlign.center,
                  isFirst: true,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.purple,
                  ),
                  beforeLineStyle: const LineStyle(
                    color: Colors.purple,
                    thickness: 6,
                  ),
                  startChild: Container(
                    constraints: const BoxConstraints(
                      minHeight: 120,
                    ),
                    color: Colors.amberAccent,
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  beforeLineStyle: const LineStyle(
                    color: Colors.purple,
                    thickness: 6,
                  ),
                  afterLineStyle: const LineStyle(
                    color: Colors.deepOrange,
                    thickness: 6,
                  ),
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.cyan,
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  isLast: true,
                  beforeLineStyle: const LineStyle(
                    color: Colors.deepOrange,
                    thickness: 6,
                  ),
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.red,
                  ),
                  endChild: Container(
                    constraints: const BoxConstraints(
                      minHeight: 80,
                    ),
                    color: Colors.lightGreenAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
