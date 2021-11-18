import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../screens/actions/company_insert.dart';

class CompanyAddButton extends StatelessWidget {
  CompanyAddButton(this.code);
  final String code;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: const Text('Firma Ekle'),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      onPressed: () => showCupertinoModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (context) => CompanyInsert(
          code: code,
        ),
      ),
    );
  }
}
