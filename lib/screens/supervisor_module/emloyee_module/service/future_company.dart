import 'package:fortextm/screens/supervisor_module/company_management/models/company_media_model.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/company_table_model.dart';

abstract class IFutureCompanyService{
  
  Future<List<modelCompanyTable>> getHttpTableModel(String path);
  Future<List<modelMediaCompanyTable>> getHttpTableModelGets(String path,int id);
}