// ignore_for_file: avoid_print, duplicate_ignore

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';

import 'add_category_list.dart';

class SupplierAdd extends StatefulWidget {
  const SupplierAdd({Key? key, required this.code}) : super(key: key);
final String code;
  @override
  SupplierAddState createState() => SupplierAddState();
}

class SupplierAddState extends State<SupplierAdd>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  late FutureService futureService;
  TextEditingController countrys = TextEditingController();

  final url = "supplier/add";
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
        title: const Text("Tedarikçi Ekle"),
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
                        vertical: 30, horizontal: 30,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        // ignore: prefer_const_constructors
                        Center(
                            child: const PrimaryText(
                                text: "Tedarikçi Eklemek",
                                size: 30,
                                fontWeight: FontWeight.w800,),),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        const SupplierCategoryAddList(),
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
                                      FormBuilderTextField(
                                        name: 'Name',
                                        decoration: const InputDecoration(
                                          labelText: 'Adı',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context,),
                                          FormBuilderValidators.max(
                                              context, 70,),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                      FormBuilderTextField(
                                        name: 'Address',
                                        decoration: const InputDecoration(
                                          labelText: 'Adress',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context,),
                                          FormBuilderValidators.max(
                                              context, 70,),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 530,
                                            child: FormBuilderTextField(
                                              name: 'Country',
                                              controller: countrys,
                                              readOnly: true,
                                              decoration: const InputDecoration(
                                                labelText: 'Ülke',
                                              ),
                                              maxLength: 150,
                                              // valueTransformer: (text) => num.tryParse(text),
                                              validator: FormBuilderValidators
                                                  .compose([
                                                FormBuilderValidators.required(
                                                    context,),
                                                FormBuilderValidators.max(
                                                    context, 70,),
                                              ]),
                                              keyboardType: TextInputType.text,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              showCountryPicker(
                                                  context: context,
                                                  countryListTheme:
                                                      CountryListThemeData(
                                                    flagSize: 25,
                                                    backgroundColor:
                                                        Colors.white,
                                                    textStyle: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.blueGrey,),
                                                    //Optional. Sets the border radius for the bottomsheet.
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20.0),
                                                      topRight:
                                                          Radius.circular(20.0),
                                                    ),
                                                    //Optional. Styles the search field.
                                                    inputDecoration:
                                                        InputDecoration(
                                                      labelText: 'Search',
                                                      hintText:
                                                          'Start typing to search',
                                                      prefixIcon: const Icon(
                                                          Icons.search,),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: const Color(
                                                                  0xFF8C98A8,)
                                                              .withOpacity(0.2),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  onSelect: (Country country) =>
                                                      {
                                                        print(
                                                            'Select country: ${country.countryCode}',),
                                                        setState(() {
                                                          countrys.text =
                                                              country
                                                                  .displayName
                                                                  .toString();
                                                        })
                                                      },);
                                            },
                                            child: const Text('Ülke'),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.deepOrange,),
                                          ),
                                        ],
                                      ),
                                      FormBuilderTextField(
                                        name: 'Code',
                                        decoration: const InputDecoration(
                                          labelText: 'Kod',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context,),
                                          FormBuilderValidators.max(
                                              context, 70,),
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
                ),),
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
                borderRadius: BorderRadius.circular(20.0),),
          ),
          onPressed: () {
            _formKey.currentState!.save();
            futureService = FutureService();

            if (_formKey.currentState!.validate()) {
              futureService.postAll(
                  _formKey.currentState!.value, url, context, '/whsettings',widget.code);
            } else {
              print("validation failed");
            }
          },
        ),
      ],
    );
  }
}
