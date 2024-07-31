import 'package:flutter/material.dart';
import 'package:task/core/utiles/app_text_styles.dart';
import 'package:task/core/utiles/constanst.dart';
import 'package:task/features/home/presentaion/views/widgets/custom_app_bar.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: UserProfileViewBody(),
      ),
    );
  }
}

class UserProfileViewBody extends StatelessWidget {
  const UserProfileViewBody({super.key});
  final List title = const [
    'Name',
    'Phone',
    'level',
    'Years of Experience',
    'Location'
  ];
  final List subTitle = const [
    'Majid salah',
    '+20 123 456-7890',
    'fresh',
    '1 years',
    'Damietta'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const CustomAppBar(title: 'Profile'),
        const SizedBox(height: 32),
        Expanded(
            child: ListView.builder(
          itemCount: title.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: ListTile(
                titleAlignment: ListTileTitleAlignment.titleHeight,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                visualDensity: const VisualDensity(vertical: -1),
                tileColor: kSecondryColor,
                title: Text(
                  title[index],
                  style: textStyle12,
                ),
                subtitle: Text(subTitle[index],
                    style: textStyle16.copyWith(
                         fontSize: 18,
                        color: Colors.black.withOpacity(0.6))),
                trailing: title[index] == 'Phone'
                    ? Icon(
                        Icons.content_copy,
                        color: kPrimaryColor,
                      )
                    : null),
          ),
        ))
      ],
    );
  }
}
