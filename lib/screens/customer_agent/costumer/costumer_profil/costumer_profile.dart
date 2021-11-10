import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';

import 'components/activity.dart';
import 'components/costumerinfo.dart';

class CostumerProfile extends StatefulWidget {
  const CostumerProfile({Key? key}) : super(key: key);

  @override
  CostumerProfileState createState() => CostumerProfileState();
}

class CostumerProfileState extends State<CostumerProfile>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  TextEditingController ad = TextEditingController();
  TextEditingController unvan = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController tarih = TextEditingController();
  bool _status = false;
  @override
  void initState() {
    ad.text = "Furkan Aratman";
    unvan.text = "Satış Sorumlusu";
    tel.text = "0531 319 36 21";
    tarih.text = "12.01.2020";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Müşteri Profil'),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                  flex: 10,
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 4,
                          ),
                          Center(
                              child: Column(
                            children: [
                              const PrimaryText(
                                  text: 'Firma Bilgisi',
                                  size: 30,
                                  fontWeight: FontWeight.w800),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 4,
                              ),
                              Image.network(
                                'https://medyafirma.com/wp-content/uploads/2017/06/defacto-logo.jpg',
                                height: 150,
                              ),
                            ],
                          )),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 5,
                          ),
                          Center(
                            child: SizedBox(
                              width: 600,
                              child: Column(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      if (_status == false) _getEditIcon()
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: ad,
                                          enabled: _status,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              labelText: 'Ad/Soyad'),
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: unvan,
                                          enabled: _status,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              labelText: 'Ünvan/Yetki'),
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
                                          enabled: _status,
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
                                          enabled: _status,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              labelText: 'Kayit Tarihi'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (_status != false) _getActionButtons()
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 3,
                          ),
                          const CostumerInfo(),
                          if (!Responsive.isDesktop(context))
                            const CostumerAktiviteler()
                        ],
                      ),
                    ),
                  )),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration:
                        const BoxDecoration(color: AppColors.secondaryBg),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const CostumerAktiviteler(),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
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
                    _status = false;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              // ignore: avoid_unnecessary_containers
              child: Container(
                  child: ElevatedButton(
                child: const Text(
                  "Çık",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  setState(() {
                    _status = false;
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

  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = true;
        });
      },
    );
  }
}
