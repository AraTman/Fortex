import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ModuleReturn extends StatelessWidget {
  const ModuleReturn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                child:  IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon:SvgPicture.asset('lib/assets/svg/mac-action.svg'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/moduleDashboard');
                  }),
              );
  }
}