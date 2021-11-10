import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';


class CostumerInsert extends StatefulWidget {
  const CostumerInsert({Key? key}) : super(key: key);

  @override
  CostumerInsertState createState() => CostumerInsertState();
}

class CostumerInsertState extends State<CostumerInsert>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  TextEditingController ad = TextEditingController();
  TextEditingController unvan = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController tarih = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Müşteri Ekle'),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Expanded(
                  flex: 10,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 4,
                          ),
                          // ignore: prefer_const_constructors
                          Center(
                              child: const PrimaryText(
                                  text: 'Müşteri Bilgileri',
                                  size: 30,
                                  fontWeight: FontWeight.w800)),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 5,
                          ),
                          Center(
                            child: SizedBox(
                              width: 600,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: ad,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              labelText: 'Ad'),
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: unvan,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              labelText: 'Soyad'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical! * 2,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: tel,
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            labelText: 'Telefon Numarası',
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: tarih,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              labelText: 'E-Mail'),
                                        ),
                                      ),
                                    ],
                                  ),
                                   SizedBox(
                                    height: SizeConfig.blockSizeVertical! * 2,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: tel,
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            labelText: 'Adres',
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: tarih,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              labelText: 'Tc / Vergi No'),
                                        ),
                                      ),
                                    ],
                                  ),
                                   SizedBox(
                                    height: SizeConfig.blockSizeVertical! * 2,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: tel,
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            labelText: 'Ülke',
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                        SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: tel,
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            labelText: 'Firma Bilgi',
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                  _getActionButtons()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _getActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              // ignore: avoid_unnecessary_containers
              child: Container(
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
                  setState(() {
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
