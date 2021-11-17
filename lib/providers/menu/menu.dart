import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/models/menu.dart';
import 'package:fortextm/providers/menu/components/module_return.dart';

import 'components/menu_list.dart';

// ignore: must_be_immutable
class SideMenu extends StatefulWidget {
  SideMenu({final Key? key, required this.id}) : super(key: key);
  late int id;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(color: AppColors.secondaryBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ModuleReturn(),
              const Divider(),
               MenuListWidget(id: widget.id,),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 22,
              ),
              const Divider(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/whsettings');
                    setState(() {});
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.settings,
                        color: AppColors.lgunder,
                      ),
                      Text(
                        'Ayarlar',
                        style: TextStyle(color: AppColors.lgunder),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
