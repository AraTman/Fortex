import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/style.dart';
// ignore: must_be_immutable
class HeaderProvider extends StatefulWidget {
   HeaderProvider({
    final Key? key,required this.baslik
  }) : super(key: key);
late String baslik;
  @override
  State<HeaderProvider> createState() => _HeaderProviderState();
}

class _HeaderProviderState extends State<HeaderProvider> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              PrimaryText(
                  text: widget.baslik, size: SizeConfig.screenWidth!/17, fontWeight: FontWeight.w800),
            ]),
      ),
     
    ]);
  }
}
