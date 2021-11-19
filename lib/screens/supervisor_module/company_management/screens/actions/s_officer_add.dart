
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';


class SubsidiaryEmployeeAdd extends StatefulWidget {
  const SubsidiaryEmployeeAdd({Key? key, required this.id,required this.code}) : super(key: key);
  final int id;
  final String code;
  @override
  SubsidiaryEmployeeAddState createState() => SubsidiaryEmployeeAddState();
}

class SubsidiaryEmployeeAddState extends State<SubsidiaryEmployeeAdd>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  late FutureService futureService;

  final url = "company/official/add";
  // ignore: unused_field
  // ignore: unused_field
  bool _isLoading = false;
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
        title: const Text("Yetkili Ekle"),
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
                                text: "Yetkili Bilgileri",
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
                                builderForm(context),
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

  FormBuilder builderForm(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          FormBuilderTextField(
            name: 'CompanySubsidiaryId',
            initialValue: widget.id.toString(),
            enabled: false,
          
            // valueTransformer: (text) => num.tryParse(text),
          
            keyboardType: TextInputType.text,
          ),
          FormBuilderTextField(
            name: 'Name',
            decoration: const InputDecoration(
              labelText: 'Adı',
            ),
            // valueTransformer: (text) => num.tryParse(text),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.max(context, 70),
            ]),
            keyboardType: TextInputType.text,
          ),
          FormBuilderTextField(
            name: 'Surname',
            decoration: const InputDecoration(
              labelText: 'Soyadı',
            ),
            // valueTransformer: (text) => num.tryParse(text),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.max(context, 70),
            ]),
            keyboardType: TextInputType.text,
          ),
          FormBuilderTextField(
            name: 'Email',
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            // valueTransformer: (text) => num.tryParse(text),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
            
            ]),
            keyboardType: TextInputType.emailAddress,
          ),
          
          FormBuilderTextField(
            name: 'TelephoneNumber',
            decoration: const InputDecoration(
              labelText: 'Telefon',
            ),
            // valueTransformer: (text) => num.tryParse(text),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              
            ]),
            keyboardType: TextInputType.phone,
          ),
        ],
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
                _formKey.currentState!.value, url, context,'/sp1',widget.code);
            
            } else {
              print("validation failed");
            }
          },
        ),
      ],
    );
  }

}
