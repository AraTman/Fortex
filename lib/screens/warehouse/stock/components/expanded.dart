import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LokasyonCard extends StatelessWidget {
  const LokasyonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: SizedBox(
          width: 600,
          child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          children: <Widget>[
            const Text(
               'Hammadde Depo',
               style: TextStyle(fontSize: 25),
             ),
             SfLinearGauge(
               ranges: const [
                 LinearGaugeRange(
                     startValue: 0,
                     endValue: 25,
                     color: Colors.red,
                     edgeStyle: LinearEdgeStyle.startCurve,
                     startWidth: 10,
                     endWidth: 10),
                 LinearGaugeRange(
                     startValue: 25,
                     endValue: 50,
                     color: Colors.deepOrange,
                     startWidth: 10,
                     endWidth: 10),
                 LinearGaugeRange(
                     startValue: 50,
                     endValue: 75,
                     color: Colors.orange,
                     startWidth: 10,
                     endWidth: 10),
                 LinearGaugeRange(
                     startValue: 75,
                     edgeStyle: LinearEdgeStyle.endCurve,
                     endValue: 100,
                     color: Colors.green,
                     startWidth: 10,
                     endWidth: 10)
               ],
               markerPointers: const [
                 LinearShapePointer(
                   value: 50,
                 ),
               ],
             ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Lokasyonlar",
                      style: Theme.of(context).textTheme.subtitle1,
                    )),
                collapsed: const Text(
                  '',
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(5))
                      const Padding(
                          padding:  EdgeInsets.only(bottom: 10),
                          child:  Text(
                            'loremIpsum',
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
      ),
    ),
        ));
  }
}
