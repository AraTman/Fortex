import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../init/api_services/future_service.dart';

class AddButton extends StatefulWidget {
  AddButton({Key? key,required this.formKey,required this.isUser, required this.UserName,required this.UserId,
  required this.apiUrl,required this.menuCode,required this.returnLocation}) : super(key: key);
final GlobalKey<FormBuilderState> formKey;

final bool isUser;  
final String UserName;
final int UserId;
final String apiUrl;
final String menuCode;
final String returnLocation;
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
 late FutureService futureService;
  @override
  Widget build(BuildContext context) {
    return Center(
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
              if(widget.isUser == true){
                 widget.formKey.currentState!.setInternalFieldValue(widget.UserName,widget.UserId);
              }
             
              widget.formKey.currentState!.save();
              if (widget.formKey.currentState!.validate()) {
                futureService = FutureService();
                futureService.postAll(widget.formKey.currentState!.value, widget.apiUrl, context,
                    widget.returnLocation, widget.menuCode);
              } else {
                // ignore: avoid_print
                print("validation failed");
              }
            },
          ),
    );
  }
}