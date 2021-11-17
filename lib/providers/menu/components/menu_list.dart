// ignore: implementation_imports, unused_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/services/future_extension.dart';
import 'package:fortextm/core/services/future_service.dart';
import 'package:fortextm/core/services/futures_service.dart';
import 'package:fortextm/providers/menu/models/permissonModel.dart';

class MenuListWidget extends StatefulWidget {
   MenuListWidget({Key? key,required this.id}) : super(key: key);
late var id;
  @override
  _MenuListWidgetState createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget>
    with AutomaticKeepAliveClientMixin {
  final welPath = "user/permission/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<PermissonModel>> httpCompany;

  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpCompany = futureService.getHttpPermisson(welPath,widget.id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return httpCompany.toBuild<List<PermissonModel>>(onSucces: (datas) {
      return Wrap(
        runSpacing: 15,
        spacing: 15,
        children: datas
            .map((item) => (() {
                  int color = int.parse(item.permissions.icon);
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.mtred,
                          shadowColor: Colors.transparent),
                      onPressed: () {
                        Navigator.pushNamed(context, '/warehouseDashboard');
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
                      ));
                }()))
            .toList()
            .cast<Widget>(),
      );
    });
  }

  Widget get buildTitleLaoding {
    return isLoading
        ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        : const Text("Http");
  }

  @override
  bool get wantKeepAlive => true;
}
