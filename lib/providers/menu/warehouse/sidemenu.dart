import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/providers/menu/components/module_return.dart';

class WarehouseSideMenu extends StatefulWidget {
  const WarehouseSideMenu({
    final Key? key,
  }) : super(key: key);

  @override
  State<WarehouseSideMenu> createState() => _WarehouseSideMenuState();
}

class _WarehouseSideMenuState extends State<WarehouseSideMenu> {
  int value = 0;
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/warehouseDashboard');
                    setState(() {});
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.dashboard_customize,
                        color: AppColors.lgunder,
                      ),
                      Text(
                        'Anasayfa',
                        style: TextStyle(color: AppColors.lgunder),
                      ),
                    ],
                  )),
              const Divider(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/warehouseDashboard');
                    setState(() {});
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.receipt,
                        color: AppColors.lgunder,
                      ),
                      Text(
                        'Belgesiz mal',
                        style: TextStyle(color: AppColors.lgunder),
                      ),
                    ],
                  )),
              const Divider(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/inv03');
                    setState(() {});
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.inventory_2,
                        color: AppColors.lgunder,
                      ),
                      Text(
                        'Stok',
                        style: TextStyle(color: AppColors.lgunder),
                      ),
                    ],
                  )),
              const Divider(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/warehouseDashboard');
                    setState(() {});
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.swap_horiz,
                        color: AppColors.lgunder,
                      ),
                      Text(
                        'Stok Giriş',
                        style: TextStyle(color: AppColors.lgunder),
                      ),
                    ],
                  )),
              const Divider(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/warehouseDashboard');
                    setState(() {});
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.payment,
                        color: AppColors.lgunder,
                      ),
                      Text(
                        'Stok Maliyeti',
                        style: TextStyle(color: AppColors.lgunder),
                      ),
                    ],
                  )),
              const Divider(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/warehouseDashboard');
                    setState(() {});
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.format_list_numbered,
                        color: AppColors.lgunder,
                      ),
                      Text(
                        'Stok  Sayım',
                        style: TextStyle(color: AppColors.lgunder),
                      ),
                    ],
                  )),
              const Divider(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/whsupplier');
                    setState(() {});
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.support,
                        color: AppColors.lgunder,
                      ),
                      Text(
                        'Tedarikçi',
                        style: TextStyle(color: AppColors.lgunder),
                      )
                    ],
                  )),
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
