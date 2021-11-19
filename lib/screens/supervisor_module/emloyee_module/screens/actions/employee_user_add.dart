import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/components/department_list_check.dart';

// ignore: must_be_immutable
class EmployeeUserAdd extends StatefulWidget {
  EmployeeUserAdd({Key? key, required this.id, required this.code})
      : super(key: key);
  late int id;
  final String code;
  @override
  EmployeeUserAddState createState() => EmployeeUserAddState();
}

class EmployeeUserAddState extends State<EmployeeUserAdd>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  final _formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  late FutureService futureService;
  final url = "user/add";
  bool _status = false;
  @override
  void initState() {
    super.initState();
    futureService = FutureService();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        id: widget.id,
        title: 'Personel Profil',
        code: widget.code,
        context: context,
        mainWebPageBuilder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 10,
              ),
              Center(
                child: buildForm(context),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 2,
              ),
              Center(child: _getActionButtons())
            ],
          );
        }, mainMobilPageBuilder: (BuildContext context) =>Text(''),);
  }

  FormBuilder buildForm(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SizedBox(
        width: SizeConfig.screenWidth! / 1.5,
        child: Wrap(
          children: [
            FormBuilderTextField(
              name: 'EmployeeId',

              enabled: false,
              // valueTransformer: (text) => num.tryParse(text),
              initialValue: widget.id.toString(),
            ),
            DepartmentListCheck(),
            FormBuilderTextField(
              name: 'Password',
              decoration: const InputDecoration(
                labelText: 'Şifre',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
              keyboardType: TextInputType.visiblePassword,
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
            if (_formKey.currentState!.validate()) {
              futureService = FutureService();
              futureService.postAll(_formKey.currentState!.value, url, context,
                  '/hr1', widget.code);
            } else {
              // ignore: avoid_print
              print("validation failed");
            }
          },
        ),
      ],
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
