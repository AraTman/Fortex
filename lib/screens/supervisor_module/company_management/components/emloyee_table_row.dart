import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';

Function(dynamic, int, List<Map<String, dynamic>>, BsDatatableSource)
    // ignore: prefer_function_declarations_over_variables
    datatablesListener1 = (value, index, sources, source) {};

class EmployeeListTabSource extends BsDatatableSource {
  EmployeeListTabSource({
    List<Map<String, dynamic>> data = const [],
    Function(dynamic, int, List<Map<String, dynamic>>, BsDatatableSource)?
        editListener,
    Function(dynamic, int, List<Map<String, dynamic>>, BsDatatableSource)?
        deleteListener,
  })  : onEditListener = editListener ?? datatablesListener1,
        onDeleteListener = deleteListener ?? datatablesListener1,
        super(data: data);

  Function(dynamic, int, List<Map<String, dynamic>>, BsDatatableSource)
      // ignore: prefer_function_declarations_over_variables
      onEditListener = (value, index, sources, source) {};
  Function(dynamic, int, List<Map<String, dynamic>>, BsDatatableSource)
      // ignore: prefer_function_declarations_over_variables
      onDeleteListener = (value, index, sources, source) {};

  static List<BsDataColumn> get columns => <BsDataColumn>[
        BsDataColumn(
          label: const Text('No'),
          orderable: false,
          searchable: false,
          width: 100.0,
        ),
        BsDataColumn(
            label: const Text('Name'), columnName: 'name'),
        BsDataColumn(
            label: const Text('Phone'), columnName: 'phone'),
        BsDataColumn(
          label: const Text('Action'),
          orderable: false,
          searchable: false,
          width: 200.0,
        ),
      ];

  @override
  BsDataRow getRow(int index) {
    return BsDataRow(
      index: index,
      cells: <BsDataCell>[
        BsDataCell(Text('${controller.start + index + 1}')),
        BsDataCell(
          Text('${response.data[index]['name']}'),
        ),
         BsDataCell(
          Text('${response.data[index]['phone']}'),
        ),
        BsDataCell(response.data[index]['actions'] as Widget)
      ],
    );
  }
}
