
import 'package:fortextm/screens/supervisor_module/company_management/models/company_table_model.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/official_list.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/subsidiary_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/departmans.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/department_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/employee_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/media_type_list.dart';

abstract class IFutureService {
  Future<List<modelCompanyTable>> getHttpTableModel(String path);
  Future<List<Departmans>> getHttpDepartmans(String url);
  Future<List<SubsidiaryList>> getHttpSubsidiaryList(String url, int id);
  Future<List<EmployeeListModel>> getHttpEmployeeList(String url);
   Future<List<EmployeeListModel>> getHttpEmployeeGets(String url,int id);
  Future<List<OfficialList>> getHttpOfficialList(String url, int id);
  Future<List<DepartmentLists>> getHttpDepartmentLists(String url);
    Future<List<MediaTypeList>> getHttpMediaTypeLists(String url);
}
