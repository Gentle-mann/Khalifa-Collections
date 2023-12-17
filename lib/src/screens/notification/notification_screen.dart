import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_components/screen_title.dart';
import '../../app_components/standard_bold_text.dart';
import '../../colors.dart';
import '../../models/notification.dart';
import '../../size_setup.dart';
import '../details/components/action_avatar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const routeName = '/notification';

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: rSize * 4,
                    right: rSize * 2,
                    left: rSize * 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ActionAvatar(icon: 'assets/icons/back.svg'),
                      const ScreenTitle('Notification'),
                      Container(
                        padding: EdgeInsets.all(rSize),
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(rSize * 2),
                        ),
                        child: const Text(
                          '2 New',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: rSize * 2),
                const DayHeader(day: 'TODAY'),
                ...Notifications.todayNotifications.map(
                  (notification) => NotificationCard(
                    notification: notification,
                  ),
                ),
                const DayHeader(day: 'YESTERDAY'),
                ...Notifications.yesterdayNotifications.map(
                  (notification) => NotificationCard(
                    notification: notification,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DayHeader extends StatelessWidget {
  const DayHeader({
    super.key,
    required this.day,
  });
  final String day;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: rSize,
        horizontal: rSize * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day),
          const Text(
            'Mark all as read',
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});

  final Notifications notification;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Container(
      color: notification.isRead
          ? Colors.white
          : AppColors.kTertiaryColor.withOpacity(0.1),
      child: Container(
        padding: EdgeInsets.all(rSize * 2),
        child: Row(
          children: [
            Container(
              height: rSize * 6,
              width: rSize * 6,
              padding: EdgeInsets.all(rSize * 1.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: !notification.isRead
                    ? Colors.white
                    : AppColors.kTertiaryColor.withOpacity(0.1),
              ),
              child: SvgPicture.asset(
                notification.icon,
                colorFilter: const ColorFilter.mode(
                  AppColors.kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: rSize * 2),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StandardBoldText(notification.title),
                      SizedBox(height: rSize),
                      Text(notification.timeElapsed),
                    ],
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ultrices sapien a faucibus euismod. Nullam condimentum elit maximus auctor malesuada. Aenean vel urna velit. Donec condimentum lacus non enim hendrerit bibendum. Donec vel enim pharetra eros ornare volutpat. Nulla scelerisque, magna efficitur auctor accumsan, leo tellus pretium magna, nec congue.',
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
