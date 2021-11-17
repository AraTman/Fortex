import 'package:fortextm/providers/menu/models/permissonModel.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/company_table_model.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/official_list.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/subsidiary_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/departmans.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/department_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/employee_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/media_type_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_category_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_localization_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_localization_size_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_supplier_list.dart';
import 'package:fortextm/screens/warehouse/supplier/models/supplier_list.dart';

abstract class IFutureService {
  Future<List<modelCompanyTable>> getHttpTableModel(String path);
  Future<List<Departmans>> getHttpDepartmans(String url);
  Future<List<SubsidiaryList>> getHttpSubsidiaryList(String url, int id);
  Future<List<EmployeeListModel>> getHttpEmployeeList(String url);
  Future<List<EmployeeListModel>> getHttpEmployeeGets(String url, int id);
  Future<List<OfficialList>> getHttpOfficialList(String url, int id);
  Future<List<DepartmentLists>> getHttpDepartmentLists(String url);
  Future<List<MediaTypeList>> getHttpMediaTypeLists(String url);
  Future<List<PermissonModel>> getHttpPermisson(String url,int id);

  //Warehouse
  Future<List<WhCategoryLists>> getHttpWhCategoryLists(String url);
  Future<List<WhCategoryLists>> getHttpWhCategoryGets(String url, int id);
  Future<List<WhModelList>> getHttpWhLists(String url);
  Future<List<WhModelList>> getHttpWhGets(String url, int id);

  Future<List<WhLocalizationModelList>> getHttpWhLocalizationLists(String url);
  Future<List<WhLocalizationModelList>> getHttpWhLocalizationGets(
      String url, int id);

  Future<List<WhLocalizationSizeModelList>> getHttpWhLocalizationSizeLists(String url);
  Future<List<WhLocalizationSizeModelList>> getHttpWhLocalizationSizeGets(
      String url, int id);

       Future<List<WhSupplierCategoryModelList>> getHttpSupplierCategoryLists(String url);
         Future<List<SupplierModelList>> getHttpSupplierLists(String url);
         Future<List<SupplierModelList>> getHttpSupplierGets(
      String url, int id);
}
