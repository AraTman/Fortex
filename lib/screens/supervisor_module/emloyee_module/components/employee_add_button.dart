import 'package:flutter/material.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/screens/actions/employee_insert.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EmployeeAddButton extends StatelessWidget {
  EmployeeAddButton(this.code);
  final String code;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
              child: const Text('Personel Ekle'),
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onPressed: ()=>showCupertinoModalBottomSheet(
                isDismissible: false,
                context: context,
                builder: (context) =>  EmployeeInsert(code: code,),
              ),
            );
  }
}
