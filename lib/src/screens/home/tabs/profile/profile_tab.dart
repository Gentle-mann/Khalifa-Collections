import 'package:flutter/material.dart';
import 'package:seed/src/app_components/standard_bold_text.dart';
import 'package:seed/src/core/responsive/responsive.dart';

import 'package:seed/src/models/profile.dart';
import 'package:seed/src/services/auth_service.dart';

import '../../../../app_components/default_padding.dart';
import '../../../settings/components/profile_option_card.dart';
import '../../../../colors.dart';
import '../../../../size_setup.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return SingleChildScrollView(
      child: DefaultPadding(
        child: Center(
          child: Column(
            children: [
              Text(
                'Profile',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: rSize * 3),
              ProfileImage(rSize: rSize),
              SizedBox(
                height: rSize * 2,
              ),
              FutureBuilder(
                  future: AuthService().getUserProfile(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '@user',
                          style: TextStyle(
                            fontSize: rSize * 2,
                          ),
                        ),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text('No data'),
                      );
                    } else {
                      return StandardBoldText('@${snapshot.data!.username}');
                    }
                  }),
              SizedBox(height: rSize * 2),
              Column(
                children: [
                  ...ProfileOption.options.map(
                    (option) => ProfileOptionCard(
                      option: option,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.rSize,
  });

  final double rSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage('assets/images/profilepic.jpeg'),
          radius: rSize * 6,
        ),
        Positioned(
          bottom: 0,
          right: rSize * 0.5,
          child: Container(
            height: rSize * 4,
            width: rSize * 4,
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: rSize * 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
