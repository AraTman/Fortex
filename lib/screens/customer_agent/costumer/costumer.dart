import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/providers/menu/costumer_agent/side_menu.dart';
import 'package:fortextm/providers/app_bar_actions_items.dart';

import 'components/header.dart';

class Costumer extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  Costumer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 100, child: CostumerSideMenu()),
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
              const Expanded(
                flex: 1,
                child: CostumerSideMenu(),
                
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
                        const HeaderCostumer(),
                      
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                            const Divider(
       color: Colors.black,
      ),
       SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                             
                              
                          ],
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
