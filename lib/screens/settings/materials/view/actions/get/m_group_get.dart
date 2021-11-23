import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/settings/materials/models/m_category_list.dart';
import 'package:fortextm/screens/settings/materials/models/m_group_list.dart';

// ignore: must_be_immutable
class SetMaterialGroupGet extends StatefulWidget {
  SetMaterialGroupGet({Key? key, required this.id, required this.code})
      : super(key: key);
  late int id;
  final String code;
  @override
  SetMaterialGroupGetState createState() => SetMaterialGroupGetState();
}

class SetMaterialGroupGetState extends State<SetMaterialGroupGet>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  final _formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  late IFutureService futureService;
  late FutureService futureServices;
  late Future<List<ModelSMaterialsGroup>> httpEmployee;
  final welPath = "materials/group/get";
  final url = "materials/group/update";
  bool _status = false;
  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpEmployee = futureService.getMaterialsGroup(welPath, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return httpEmployee.toBuild<List<ModelSMaterialsGroup>>(
        onSucces: (datas) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 5,
          ),
          Center(
              child: Column(
            children: [
              if (_status == false) _getEditIcon(),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 5,
              ),
              buildForm(datas, context),
            ],
          )),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          if (_status != false) _getActionButtons()
        ],
      );
    });
  }

  FormBuilder buildForm(
      List<ModelSMaterialsGroup> datas, BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SizedBox(
        width: SizeConfig.screenWidth! / 1.5,
        child: Wrap(
          children: [
            FormBuilderTextField(
              name: 'Name',
              decoration: const InputDecoration(
                labelText: 'Adı',
              ),
              initialValue: datas.first.name,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.max(context, 70),
              ]),
              keyboardType: TextInputType.text,
            ),
            FormBuilderTextField(
              name: 'Code',
              decoration: const InputDecoration(
                labelText: 'Firma Adı',
              ),
              enabled: _status,
              // valueTransformer: (text) => num.tryParse(text),
              initialValue: datas.first.code,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.max(context, 70),
              ]),
              keyboardType: TextInputType.text,
            ),
            FormBuilderTextField(
              name: 'Description',
              decoration: const InputDecoration(
                labelText: 'Açıklama',
              ),
              initialValue: datas.first.description,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
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
                  _formKey.currentState!.setInternalFieldValue('Id', widget.id);
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    futureServices = FutureService();
                    futureServices.postAllUpdate(_formKey.currentState!.value,
                        url, context, '/settings', widget.code, widget.id);
                    setState(() {
                      _status = false;
                      FocusScope.of(context).requestFocus(FocusNode());
                    });
                  } else {
                    print("validation failed");
                  }
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
