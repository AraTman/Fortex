import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/init/app_bar_actions_items.dart';
import 'package:fortextm/providers/menu/components/header.dart';
import 'package:fortextm/providers/menu/warehouse/sidemenu.dart';

import 'widget/expanded.dart';

// ignore: must_be_immutable
class INVStock extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  INVStock({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer:  SizedBox(width: 100, child: WarehouseSideMenu(id: 2,)),
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
                child: WarehouseSideMenu(id: 2,),
              ),
            Expanded(
                flex: 14,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderProvider(title: 'Stok'),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        Wrap(
                          runSpacing: 50,
                          spacing: 50,
                          children: const [
                            LokasyonCard(),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
