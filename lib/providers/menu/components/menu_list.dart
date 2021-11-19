// ignore: implementation_imports, unused_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/components/icon_helper.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/providers/menu/models/permissonmodel.dart';

// ignore: must_be_immutable
class MenuListWidget extends StatefulWidget {
  MenuListWidget({Key? key, required this.id}) : super(key: key);
  late String id;
  @override
  _MenuListWidgetState createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget>
    with AutomaticKeepAliveClientMixin {
  final welPath = "user/permission";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<permissionModel>> httpCompany;

  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpCompany = futureService.getHttpPermission(welPath, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return httpCompany.toBuild<List<permissionModel>>(onSucces: (datas) {
      
      return Wrap(
        runSpacing: 15,
        spacing: 15,
        children: datas
            .map((item) => (() {
         var iconName=getIconUsingPrefix(name: item.permissions.icon);
                  return ListTile(
                    title: Column(
                      children: [
                        // ignore: unnecessary_new
                        Icon(iconName),
                        Text(
                          item.permissions.name,
                          style: const TextStyle(color: AppColors.lgunder),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/${item.permissions.url}', arguments: <String, String>{
                            'code': widget.id
                          },);
                            },selectedColor: Colors.red,
                  );
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
