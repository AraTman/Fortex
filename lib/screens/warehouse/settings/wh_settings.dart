import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/components/app_bar_actions_items.dart';
import 'package:fortextm/providers/menu/menu.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'components/header.dart';
import 'components/wh_category/add.dart';
import 'components/wh_category/list.dart';
import 'components/wh_supplier_category/add.dart';
import 'components/wh_supplier_category/list.dart';

class WhSettings extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  WhSettings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final Map list = ModalRoute.of(context)?.settings.arguments as Map;
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer:  SizedBox(width: 100, child: SideMenu(code:list['code'],)),
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
                child: SideMenu(code: list['code'],),
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
                        const HeaderWhSettings(),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          children: [
                            OutlinedButton(
                              child: Column(
                                children: const [
                                  Text(
                                    'Depo Kategori Ekle',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.branding_watermark,
                                    size: 32,
                                  ),
                                ],
                              ),
                              style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.black,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              onPressed: () => showCupertinoModalBottomSheet(
                                isDismissible: false,
                                context: context,
                                builder: (context) =>  WhCategoryInsert(code: list['code'],),
                              ),
                            ),
                            OutlinedButton(
                              child: Column(
                                children: const [
                                  Text(
                                    'Tedarikçi Kategori Ekle',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.support_outlined,
                                    size: 32,
                                  ),
                                ],
                              ),
                              style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.red,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              onPressed: () => showCupertinoModalBottomSheet(
                                isDismissible: false,
                                context: context,
                                builder: (context) =>
                                     SupplierCategoryAdd(code: list['code'],),
                              ),
                            ),
                          ],
                        ),

                            WhCategoryList(code: list['code'],),
                           WhSupplierCategoryList(code:list['code'],),
                     
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
