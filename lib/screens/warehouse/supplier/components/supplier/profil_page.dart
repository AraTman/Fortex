import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';

import 'profil.dart';

class SupplierProfilPage extends StatefulWidget {
  const SupplierProfilPage({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  SupplierProfilPageState createState() => SupplierProfilPageState();
}

class SupplierProfilPageState extends State<SupplierProfilPage>
    with SingleTickerProviderStateMixin {
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
          title: const Text('Tedarikçi Profili'),
          backgroundColor: AppColors.primaryBg,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 10,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SupplierProfile(
                            id: widget.id,
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 3,
                          ),
                        ],
                      ),
                    ),
                  ),),
            ],
          ),
        ),);
  }
}
