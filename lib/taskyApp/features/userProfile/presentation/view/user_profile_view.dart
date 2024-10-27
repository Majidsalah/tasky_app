import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';
import 'package:task/taskyApp/core/widgets/custom_app_bar.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/success_widget.dart';
import 'package:task/taskyApp/features/userProfile/presentation/manager/cubit/user_cubit.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({
    super.key,
  });

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUserData(),
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomAppBar(title: 'Profile'),
          const SizedBox(height: 32),
          Stack(children: [
            CircleAvatar(
              minRadius: 40,
              backgroundColor: kSecondryColor,
              foregroundColor: kSecondryColor,
              child: Image.asset('assets/user.png', height: 50),
            ),
            Positioned(
      bottom: 4,
      right: 150,
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: Colors.green, 
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
    ),
          ]),
          const SizedBox(height: 32),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const CircularProgressIndicator();
              } else if (state is UserSuccess) {
                final List subTitle = [
                  state.profileData.displayName,
                  state.profileData.username,
                  state.profileData.level,
                  state.profileData.experienceYears.toString(),
                  state.profileData.address
                ];
                return Expanded(
                    child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
                ));
              } else if (state is UserFailed) {
                return MessageWidget(message: state.errorMessage);
              }

              return const MessageWidget(
                  message: 'there was an error please try agin');
            },
          ),
        ],
      ),
    );
  }
}
