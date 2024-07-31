import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:task/core/utiles/app_text_styles.dart';
import 'package:task/core/utiles/constanst.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, this.leadingIcon = false});
  final String title;
  final bool leadingIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(
              IconlyBold.arrow_left,
              color: Colors.black,
            )),
        Text(
          title,
          style: textStyle16,
        ),
        const Spacer(flex: 1),
        leadingIcon
            ? const CustomPopupMenuButton()
            : const Text(''),
        
      ],
    );
  }
}

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        constraints: const BoxConstraints(
          maxWidth: 100,
        ),
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        position: PopupMenuPosition.under,
        icon:
            const Icon(Icons.more_vert_outlined, size: 24, color: Colors.black),
        itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: Center(child: Text('Edit', style: textStyle16)),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Center(
                    child: Text('Delete',
                        style: textStyle16.copyWith(color: kOrangeColor))),
              ),
            ]);
  }
}
