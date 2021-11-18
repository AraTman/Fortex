// ignore: implementation_imports, unused_import
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/init/app_bar_actions_items.dart';
import 'package:fortextm/providers/menu/menu.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'components/activity.dart';
import 'components/header.dart';

// ignore: must_be_immutable
class WarehouseDashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  WarehouseDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
 final Map list = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      key: _drawerKey,
      drawer:  SizedBox(width: 100, child: SideMenu(code: list['code'],)),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu, color: AppColors.black),),
              // ignore: prefer_const_literals_to_create_immutables
              actions: [
                const AppBarActionItems(),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
               Expanded(
                flex: 1,
                child: SideMenu(code: list['code'],),
              ),
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const WarehouseHeader(),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        Wrap(
                          children: [
                            SizedBox(
                              width: 250,
                              child: _getRadialGauge(),
                            ),
                          ],
                        ),
                        if (!Responsive.isDesktop(context)) const ActivityList()
                      ],
                    ),
                  ),
                ),),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration:
                        const BoxDecoration(color: AppColors.secondaryBg),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30,),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const AppBarActionItems(),
                          const ActivityList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        title: const GaugeTitle(
            text: 'Stok doluluk oranı',
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 25,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10,),
            GaugeRange(
                startValue: 25,
                endValue: 50,
                color: Colors.orangeAccent,
                startWidth: 10,
                endWidth: 10,),
            GaugeRange(
                startValue: 50,
                endValue: 75,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10,),
            GaugeRange(
                startValue: 75,
                endValue: 100,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10,)
          ], pointers: const <GaugePointer>[
            NeedlePointer(value: 90)
          ], annotations: const <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text('90.0',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                angle: 90,
                positionFactor: 0.5,)
          ],)
        ],);
  }
}
