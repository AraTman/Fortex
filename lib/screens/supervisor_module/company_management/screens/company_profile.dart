import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/components/country_select.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/company_media_model.dart';

// ignore: must_be_immutable
class CompanyProfil extends StatefulWidget {
  CompanyProfil({Key? key, required this.id, required this.code})
      : super(key: key);
  late int id;
  final String code;
  @override
  CompanyProfilState createState() => CompanyProfilState();
}

class CompanyProfilState extends State<CompanyProfil>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  bool isLoading = false;
  late IFutureService futureService;

  late FutureService futureServices;
  late Future<List<modelMediaCompanyTable>> httpEmployee;
  final _formKey = GlobalKey<FormBuilderState>();
  final welPath = "company/media";
  final url = "company/update";
  bool _status = false;
  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpEmployee = futureService.getHttpTableModelGets(welPath, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
  
    return httpEmployee.toBuild<List<modelMediaCompanyTable>>(
        onSucces: (datas) {
           Uint8List encoded=Base64Decoder().convert(datas.first.binaryData);
         
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 4,
          ),
          Center(
              child: Column(
            children: [
     
              Image.memory(
                encoded,
                width: SizeConfig.screenWidth! / 2,
                scale: 2,
              ),
            ],
          )),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 5,
          ),
          Center(
            child: SizedBox(
              width: SizeConfig.screenWidth,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (_status == false) _getEditIcon(),
                    ],
                  ),
                  buildForm(datas, context),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
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

  FormBuilder buildForm(
      List<modelMediaCompanyTable> datas, BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SizedBox(
        width: SizeConfig.screenWidth! / 1.5,
        child: Wrap(
          children: [
            CountrySelect(
              county: datas.first.company.country! != ""
                  ? datas.first.company.country!
                  : "Se??ilmedi",
            ),
           /* FormBuilderTextField(
              name: 'Id',

              enabled: false,
              // valueTransformer: (text) => num.tryParse(text),
              initialValue: datas.first.company.id.toString(),
             
            ),*/
            FormBuilderTextField(
              name: 'Name',
              decoration: const InputDecoration(
                labelText: 'Firma Ad??',
              ),
              enabled: _status,
              // valueTransformer: (text) => num.tryParse(text),
              initialValue: datas.first.company.name,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.max(context, 70),
              ]),
              keyboardType: TextInputType.text,
            ),
            FormBuilderTextField(
              name: 'Code',
              decoration: const InputDecoration(
                labelText: 'Kodu',
              ),
              enabled: _status,
              // valueTransformer: (text) => num.tryParse(text),
              initialValue: datas.first.company.code,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.max(context, 70),
              ]),
              keyboardType: TextInputType.text,
            ),
            FormBuilderTextField(
              name: 'Address',
              decoration: const InputDecoration(
                labelText: 'Adresi',
              ),
              enabled: _status,
              // valueTransformer: (text) => num.tryParse(text),
              initialValue: datas.first.company.address,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.max(context, 70),
              ]),
              keyboardType: TextInputType.text,
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
                        url, context, '/sp1', widget.code, widget.id);
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
                  "????k",
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
