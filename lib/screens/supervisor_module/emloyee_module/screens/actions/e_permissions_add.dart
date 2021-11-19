import 'package:flutter/material.dart';
import 'package:fortextm/core/base/view/base_widget.dart';

class EmployeePermissionsAdd extends StatefulWidget {
  EmployeePermissionsAdd({Key? key, required this.id, required this.code})
      : super(key: key);
  final int id;
  final String code;
  @override
  _EmployeePermissionsAddState createState() => _EmployeePermissionsAddState();
}

class _EmployeePermissionsAddState extends State<EmployeePermissionsAdd> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      context: context,
       title: '',
      code: widget.code,
      id: widget.id,
      mainWebPageBuilder: (context) {
        return Text('data');
      }, mainMobilPageBuilder: (BuildContext context) => Text(''),
    );
  }
}
