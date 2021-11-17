// ignore: implementation_imports, unused_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/services/future_extension.dart';
import 'package:fortextm/core/services/future_service.dart';
import 'package:fortextm/core/services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/media_type_list.dart';

import 'image_pick.dart';

// ignore: must_be_immutable
class MediaTypesLists extends StatefulWidget {
  MediaTypesLists({Key? key, required this.employeeId}) : super(key: key);
  late int employeeId;
  @override
  _MediaTypesListsState createState() => _MediaTypesListsState();
}

class _MediaTypesListsState extends State<MediaTypesLists>
    with AutomaticKeepAliveClientMixin {
  final welPath = "employee/mediaType/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<MediaTypeList>> httpMedia;

  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpMedia = futureService.getHttpMediaTypeLists(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return httpMedia.toBuild<List<MediaTypeList>>(onSucces: (datas) {
      return Wrap(
        spacing: 250,
        children: datas
            .map((item) => (() {
                  return Column(
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      ImagePicker(
                        employeId: widget.employeeId,
                        id: item.id,
                      )
                    ],
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
