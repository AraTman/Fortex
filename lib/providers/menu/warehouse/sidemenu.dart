import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/models/menu.dart';
import 'package:fortextm/providers/menu/components/module_return.dart';

// ignore: must_be_immutable
class WarehouseSideMenu extends StatefulWidget {
  WarehouseSideMenu({final Key? key, required this.id}) : super(key: key);
  late int id;

  @override
  State<WarehouseSideMenu> createState() => _WarehouseSideMenuState();
}

class _WarehouseSideMenuState extends State<WarehouseSideMenu> {
  late IdManager idManager;
  @override
  void initState() {
    super.initState();
    idManager = IdManager(id: widget.id);
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: idManager.id == 0
                          ? AppColors.mtred
                          : AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/warehouseDashboard');
                    setState(() {
                      idManager.id = 0;
                    });
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
                      primary: idManager.id == 1
                          ? AppColors.mtred
                          : AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/inv01');
                    setState(() {
                      idManager.id = 1;
                    });
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
                      primary: idManager.id == 2
                          ? AppColors.mtred
                          : AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/inv03');
                    setState(() {
                      idManager.id = 2;
                    });
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
                      primary:idManager.id==9 ? AppColors.mtred: AppColors.secondaryBg,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, '/inv09');
                    setState(() {});
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.location_disabled,
                        color: AppColors.lgunder,
                      ),
                      Text(
                        'Lokasyon',
                        style: TextStyle(color: AppColors.lgunder),
                      )
                    ],
                  )),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! *22,
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
