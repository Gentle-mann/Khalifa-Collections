import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/provider/app_state_provider.dart';

import '../size_setup.dart';
import 'app_components.dart';

class SignOutConfirmation extends StatelessWidget {
  const SignOutConfirmation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Container(
      height: SizeSetup.width! > 500
          ? SizeSetup.height! * 0.5
          : SizeSetup.height! * 0.3,
      padding: EdgeInsets.only(
        top: rSize * 4,
        right: rSize * 2,
        left: rSize * 2,
        bottom: rSize,
      ),
      child: Column(
        children: [
          const StandardBoldText('Sign Out'),
          const Divider(),
          Text(
            'Are you sure you want to sign out?',
            style: TextStyle(fontSize: rSize * 2, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: SizeSetup.width! * 0.4,
                height: rSize * 5,
                child: CustomButton(
                    title: 'No',
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: SizeSetup.width! * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<AppStateProvider>(context, listen: false)
                        .logoutUser();
                    context.pushReplacementNamed('sign-in');
                  },
                  child: const Text('Yes'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
