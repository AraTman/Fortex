// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/providers/maindashboard/components/module_card.dart';
import 'components/header.dart';

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 12,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ModuleHeader(),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                         const ModuleWidget(),
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
