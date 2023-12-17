import 'package:flutter/material.dart';

import '../../app_components/app_components.dart';
import '../../size_setup.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});
  static const routeName = '/privacy';

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: rSize * 2,
            right: rSize * 2,
            left: rSize * 2,
          ),
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ScreenTitleRow(title: 'Privacy Policy'),
                SizedBox(height: rSize * 2),
                const StandardBoldText(
                  'Cancellation and Return Policy',
                  isColored: true,
                ),
                SizedBox(height: rSize),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices sapien a faucibus euismod. Nullam condimentum elit maximus auctor malesuada. Aenean vel urna velit. Donec condimentum lacus non enim hendrerit bibendum. Donec vel enim pharetra eros ornare volutpat. Nulla scelerisque, magna efficitur auctor accumsan, leo tellus pretium magna, nec congue.',
                ),
                SizedBox(height: rSize),
                const StandardBoldText(
                  'Terms and Conditions',
                  isColored: true,
                ),
                SizedBox(height: rSize),
                const Text(
                  '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nunc dolor, facilisis lacinia fringilla vel, posuere eu ipsum. Nam tempor felis sed consequat gravida. Vivamus id velit nisi. Suspendisse potenti. Mauris bibendum nec diam quis consectetur. In molestie eleifend massa non laoreet. Morbi ipsum quam, scelerisque at mollis ac, cursus ac est.

Donec nec turpis tortor. Pellentesque commodo convallis lacus in posuere. Maecenas eu mollis magna, sit amet pretium risus. Nullam lacus justo, lacinia id elementum condimentum, egestas lacinia nisi. Vivamus bibendum felis id purus volutpat, in aliquam sapien blandit. Duis vel est quis nulla volutpat feugiat. Ut at felis consectetur, malesuada ipsum ac, eleifend lorem. Vivamus vehicula id arcu consequat pretium. Nullam ante dui, malesuada vitae dui sed, porttitor condimentum lorem. Suspendisse potenti. Integer auctor arcu ligula, non bibendum elit accumsan a. Vestibulum facilisis nibh ut odio viverra varius. Donec pellentesque nibh at nisl accumsan vulputate.

Integer sit amet ante venenatis, lobortis lorem scelerisque, tempus nunc. Fusce mi arcu, rutrum suscipit tempor sit amet, varius sit amet justo. Aenean in odio ut lorem accumsan feugiat nec vehicula nisi. Nullam mollis mi lorem, nec tempor augue vestibulum sit amet. Fusce mattis iaculis quam, vel rutrum sapien pharetra sit amet. Cras finibus posuere nulla, rhoncus aliquet arcu porttitor id. Morbi et justo id nisi dictum facilisis ac in tellus. Vestibulum aliquet sem id rhoncus venenatis. Donec lobortis sapien a ipsum mattis, vitae consequat est tincidunt. Etiam lobortis, quam sed ultricies egestas, elit nunc ornare ligula, in tempus ipsum ligula id risus. Ut nec consectetur odio, sed consectetur odio. Phasellus in suscipit ex, a placerat risus. Suspendisse potenti. Nam blandit efficitur quam a blandit. Cras viverra, odio at bibendum tincidunt, quam turpis dapibus nibh, pretium eleifend ante risus at lacus.

Donec rhoncus velit quis massa vehicula pulvinar. Duis venenatis, arcu at ullamcorper dapibus, enim erat tincidunt sapien, non gravida justo ex non quam. Cras rhoncus lacus ac turpis dapibus, non condimentum magna iaculis. Sed pellentesque eros nec scelerisque hendrerit. Suspendisse a enim ipsum. Nunc a dignissim libero, condimentum suscipit quam. Etiam non magna fermentum, sollicitudin mauris vitae, eleifend est. Curabitur congue ipsum at leo vulputate egestas. Pellentesque accumsan aliquam dui, vel viverra ligula pharetra vestibulum. Vestibulum sed posuere turpis, ut porttitor nunc. Integer et leo elementum urna pellentesque eleifend. Proin interdum lacinia velit sed imperdiet.

Mauris id est ut lectus elementum luctus in at sapien. Sed a felis sollicitudin, congue ipsum condimentum, lacinia massa. Morbi mollis ipsum quis sem efficitur, ultricies faucibus ex euismod. Sed tincidunt ex non diam fermentum ultrices at ac metus. Morbi ultrices molestie vehicula. Morbi quis urna eleifend, iaculis mauris et, dapibus velit. Nam quis tempus lacus. Aenean auctor et lorem rutrum dignissim. Morbi risus lacus, bibendum at nisi vitae, finibus aliquet ex. Maecenas posuere est ex, nec lacinia velit volutpat quis. Donec tellus mi, eleifend vitae augue ut, posuere tempor felis. Nam congue elementum nisl.

Fusce porttitor consectetur elit id interdum. Phasellus eleifend ullamcorper est, vitae consequat tellus maximus sed. Nullam blandit est in velit ultricies fringilla. Maecenas magna nulla, convallis id egestas et, mollis sed felis. Quisque non mollis risus, et consequat ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi sit amet ipsum rhoncus, ultrices neque egestas, dictum nunc. Proin ultrices eu elit quis ultricies. Nullam bibendum risus tortor, eget bibendum erat aliquet id. Cras egestas venenatis magna et scelerisque. Sed id elit vitae nunc feugiat suscipit non quis velit. Etiam ultrices nunc et massa hendrerit, rutrum laoreet dui aliquet. Integer aliquet ante justo, sit amet sagittis lectus hendrerit at.

Quisque in tortor in magna iaculis cursus vel sit amet odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam mollis tempor mollis. Fusce eget risus tristique, consequat lacus et, cursus justo. Sed quis ultricies lorem. Nunc eu orci a justo dapibus suscipit. Cras sit amet est sagittis, scelerisque dui nec, ornare nisl. Mauris euismod leo nec urna mollis, at fermentum est accumsan. Phasellus hendrerit urna et tortor consectetur vulputate. Donec fringilla pellentesque libero. Aenean eget eleifend mi. Nunc viverra massa turpis, ut euismod dui posuere et. Nulla tincidunt nisl magna, nec euismod nisl imperdiet eget. Cras tincidunt aliquam nisi, sit amet convallis nibh varius non.

Morbi fringilla eros enim, ut finibus enim condimentum vel. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt sem non neque euismod, et venenatis eros aliquet. Fusce egestas porta volutpat. Aliquam dignissim tincidunt mauris. Phasellus eros tortor, luctus id nibh sed, lacinia pharetra augue. Pellentesque molestie, quam a tincidunt blandit, mauris velit dictum ipsum, a ullamcorper ex eros non nisi. Duis rutrum id orci a iaculis. In nec accumsan turpis. Nulla ultrices dui non mi aliquam viverra. In sed mattis sem, quis gravida mi. Aenean metus est, hendrerit quis venenatis eget, efficitur vitae odio. Ut a risus ornare, laoreet velit at, viverra diam.''',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
