

import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';

 // ignore: must_be_immutable
 class BaseView extends StatefulWidget {
  BaseView({Key? key,required this.id,required this.code,required this.context,required this.mainMobilPageBuilder,required this.mainWebPageBuilder,required this.title}) : super(key: key);
final int id;
  final String code;
  final String title;
  BuildContext context;
  final Widget Function(BuildContext context) mainWebPageBuilder;
  final Widget Function(BuildContext context) mainMobilPageBuilder;
  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
   @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title:  Text(widget.title),
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
                      child:  widget.mainWebPageBuilder(context)
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
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 30),
                        child:  widget.mainMobilPageBuilder(context)
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}