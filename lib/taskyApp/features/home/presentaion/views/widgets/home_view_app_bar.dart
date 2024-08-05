import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';
import 'package:task/taskyApp/core/utiles/go_router.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal:16.0,vertical: 24),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              height: 32,
              width: 60,
              decoration: BoxDecoration(
                  color: kPrimaryColor, borderRadius: BorderRadius.circular(6)),
              child: Image.asset(appLogo, fit: BoxFit.fitWidth)),
          const Spacer(
            flex: 1,
          ),
          IconButton(
            onPressed: () =>GoRouter.of(context).push(AppRouter.kProfile),
            icon: Icon(IconlyBold.profile, color: kPrimaryColor, size: 24),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout_outlined, color: kPrimaryColor, size: 24),
          ),
        ],
      ),
    );
  }
}
