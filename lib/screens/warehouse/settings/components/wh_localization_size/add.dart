// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';

class WhLocalizationSizeAdd extends StatefulWidget {
  const WhLocalizationSizeAdd({Key? key, required this.id,required this.code}) : super(key: key);
  final int id;
  final String code;
  @override
  WhLocalizationSizeAddState createState() => WhLocalizationSizeAddState();
}

class WhLocalizationSizeAddState extends State<WhLocalizationSizeAdd> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  late FutureService futureService;

  final url = "warehouse/localization/size/add";
  // ignore: unused_field
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lokasyon Özellikleri Ekle"),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        // ignore: prefer_const_constructors
                        Center(
                            child: const PrimaryText(
                                text: "Lokasyon Eklemek",
                                size: 30,
                                fontWeight: FontWeight.w800)),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        Center(
                          child: SizedBox(
                            width: 600,
                            child: Column(
                              children: [
                                FormBuilder(
                                  key: _formKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    children: <Widget>[
                                      Visibility(visible: true,
                                        child: FormBuilderTextField( readOnly: true,
                                        name: 'WarehouseLocalizationId',
                                        initialValue: widget.id.toString(),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.max(
                                              context, 70),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),),
                                      
                                      FormBuilderTextField(
                                        name: 'x',
                                        decoration: const InputDecoration(
                                          labelText: 'X Ekseni',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.max(
                                              context, 70),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                   
                                      FormBuilderTextField(
                                        name: 'y',
                                        decoration: const InputDecoration(
                                          labelText: 'Y Ekseni',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.max(
                                              context, 70),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                        FormBuilderTextField(
                                        name: 'z',
                                        decoration: const InputDecoration(
                                          labelText: 'Z Ekseni',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.max(
                                              context, 70),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                         FormBuilderTextField(
                                        name: 'Status',
                                        decoration: const InputDecoration(
                                          labelText: 'Alan Rengi',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.max(
                                              context, 70),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                        FormBuilderTextField(
                                        name: 'ProductFieldDistance',
                                        decoration: const InputDecoration(
                                          labelText: 'Ürün Alan Mesafesi',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.max(
                                              context, 70),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                         FormBuilderTextField(
                                        name: 'ExitFieldDistance',
                                        decoration: const InputDecoration(
                                          labelText: 'Çıkış Alanı Mesafesi',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.max(
                                              context, 70),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                         FormBuilderTextField(
                                        name: 'Capacity',
                                        decoration: const InputDecoration(
                                          labelText: 'Kapasite',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.max(
                                              context, 70),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ),
                                _getActionButtons(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _getActionButtons() {
    return Column(
      children: [
        ElevatedButton(
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
            _formKey.currentState!.save();
            futureService = FutureService();

          
            if (_formKey.currentState!.validate()) {
               futureService.postAll(
              _formKey.currentState!.value,
              url,context,'/whsettings',widget.code
            );
            } else {
              print("validation failed");
            }
          },
        ),
      ],
    );
  }

 
}
