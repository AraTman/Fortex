import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/services/future_extension.dart';
import 'package:fortextm/core/services/future_service.dart';
import 'package:fortextm/core/services/futures_service.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_list.dart';

// ignore: must_be_immutable
class WhLocalizationProfile extends StatefulWidget {
  WhLocalizationProfile({Key? key, required this.id}) : super(key: key);
  late int id;
  @override
  WhLocalizationProfileState createState() => WhLocalizationProfileState();
}

class WhLocalizationProfileState extends State<WhLocalizationProfile>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  bool isLoading = false;
  late IFutureService futureService;
  late Future<List<WhModelList>> httpWh;
  final welPath = "warehouse/localization/get";
  bool _status = false;
  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpWh = futureService.getHttpWhGets(welPath, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return httpWh.toBuild<List<WhModelList>>(onSucces: (datas) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 4,
          ),
          Center(
            child: SizedBox(
              width: 600,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[if (_status == false) _getEditIcon()],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.name,
                          enabled: _status,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(), labelText: 'Ad'),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.code,
                          enabled: _status,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(), labelText: 'Kod'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.description,
                          enabled: _status,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Açıklama',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                  if (_status != false) _getActionButtons()
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  // ignore: unused_element
  Widget _getActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              // ignore: avoid_unnecessary_containers
              child: Container(
                  child: ElevatedButton(
                child: const Text(
                  "Kaydet",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                onPressed: () {
                  setState(() {
                    _status = false;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              // ignore: avoid_unnecessary_containers
              child: Container(
                  child: ElevatedButton(
                child: const Text(
                  "Çık",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  setState(() {
                    _status = false;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = true;
        });
      },
    );
  }

  Widget get buildTitleLaoding {
    return isLoading
        ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        : const Text("Http");
  }

  bool get wantKeepAlive => true;
}
