import 'package:badges/badges.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortextm/screens/authentication/login/login.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../core/config/constant.dart';
import '../screens/customer_agent/dashboard/components/calender.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    final Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _selectLanguage(context),
        IconButton(
          icon: SvgPicture.asset(
            'lib/assets/svg/calendar.svg',
            width: 20,
          ),
          onPressed: () => showCupertinoModalBottomSheet(
            expand: true,
            isDismissible: true,
            context: context,
            builder: (context) => const TableEvents(),
          ),
        ),
        const SizedBox(width: 10),
        Badge(
          badgeContent: const Text(
            '2',
            style: TextStyle(color: Colors.white),
          ),
          animationType: BadgeAnimationType.scale,
          child: IconButton(
              icon: SvgPicture.asset('lib/assets/svg/ring.svg', width: 20.0),
              onPressed: () {}),
        ),

        const SizedBox(width: 15),
        // ignore: prefer_const_literals_to_create_immutables
        Row(children: [
          const CircleAvatar(
            radius: 17,
            backgroundImage: NetworkImage(
              'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
            ),
          ),
          _select(context),
        ]),
      ],
    );
  }

  Widget _selectLanguage(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (item) => onSelectedLanguage(context, item),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
            value: 0,
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Flag.fromCode(
                  FlagsCode.TR,
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("TR")
              ],
            )),
        const PopupMenuDivider(),
        PopupMenuItem<int>(
            value: 1,
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Flag.fromCode(
                  FlagsCode.US,
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("EN")
              ],
            )),
      ],
      icon: const Icon(Icons.language, color: Colors.black),
    );
  }

  Widget _select(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (item) => onSelected(context, item),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
            value: 0,
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(Icons.manage_accounts_outlined),
                const SizedBox(
                  width: 5,
                ),
                const Text("Profil")
              ],
            )),
        const PopupMenuDivider(),
        PopupMenuItem<int>(
            value: 1,
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(Icons.logout_outlined),
                const SizedBox(
                  width: 5,
                ),
                const Text("Çıkış")
              ],
            )),
      ],
      icon: const Icon(
        Icons.arrow_drop_down_outlined,
        color: Colors.black,
      ),
    );
  }

  void onSelectedLanguage(BuildContext context, int item) {
    switch (item) {
      case 0:
        context.setLocale(AppConstant.TR_LOCALE);
        break;
      case 1:
        context.setLocale(AppConstant.EN_LOCALE);
        break;
      default:
    }
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login()));
        break;
      default:
    }
  }
}
