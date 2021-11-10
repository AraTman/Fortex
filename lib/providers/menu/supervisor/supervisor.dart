import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/providers/menu/components/module_return.dart';

class SupervisorSideMenu extends StatelessWidget {
  const SupervisorSideMenu({
    final Key? key,
  }) : super(key: key);

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
               IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: const Icon(
                    Icons.home,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/supervisorDashboard');
                  }),
             
              IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: const Icon(
                    Icons.location_city,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/spcompany');
                  }),
                      IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: const Icon(
                    Icons.person,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/spemployee');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
