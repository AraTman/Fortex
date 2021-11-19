// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/components/app_bar_actions_items.dart';
import 'package:fortextm/core/components/header.dart';

import '../../core/components/app_bar_actions_items.dart';
import 'components/module_card.dart';

// ignore: must_be_immutable
class ModuleDashboard extends StatelessWidget {
  // ignore: unused_field
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  ModuleDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(child: AppBarActionItems()),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 4,
            ),
            Center(
                child: HeaderProvider(
              title: 'Moduls',
            )),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 4,
            ),
            ModuleList()
          ],
        ),
      ),
    ));
  }
}
