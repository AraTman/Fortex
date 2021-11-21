// ignore: implementation_imports, unused_import
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/components/app_bar_actions_items.dart';
import 'package:fortextm/core/components/header.dart';
import 'package:fortextm/providers/menu/menu.dart';

// ignore: must_be_immutable
class PurchasingDashboard extends StatefulWidget {
  const PurchasingDashboard({Key? key}) : super(key: key);
  
  @override
  _PurchasingDashboardState createState() => _PurchasingDashboardState();
}

class _PurchasingDashboardState extends State<PurchasingDashboard> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
   
  @override
  Widget build(BuildContext context) {
    final Map list = ModalRoute.of(context)?.settings.arguments as Map;
    SizeConfig().init(context);

    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(
          width: 100,
          child: SideMenu(
            code: list['code'],
          )),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu, color: AppColors.black)),
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
                child: SideMenu(
                  code: list['code'],
                ),
              ),
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderProvider(
                          title: 'Dashboards',
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                       
                      ],
                    ),
                  ),
                )),
            if (Responsive.isDesktop(context))
              SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const AppBarActionItems(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
