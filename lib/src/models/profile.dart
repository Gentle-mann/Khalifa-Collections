class ProfileOption {
  final String icon, title;

  ProfileOption({required this.icon, required this.title});
  static final options = [
    // ProfileOption(icon: 'assets/icons/your_profile.svg', title: 'Your Profile'),
    ProfileOption(icon: 'assets/icons/card.svg', title: 'Payment Methods'),
    ProfileOption(icon: 'assets/icons/order.svg', title: 'My Orders'),
    ProfileOption(icon: 'assets/icons/settings.svg', title: 'Settings'),
    ProfileOption(icon: 'assets/icons/help.svg', title: 'Help Center'),
    //ProfileOption(icon: 'assets/icons/privacy.svg', title: 'Privacy Policy'),
    ProfileOption(icon: 'assets/icons/invite.svg', title: 'Invite Friends'),
    ProfileOption(icon: 'assets/icons/logout.svg', title: 'Sign Out'),
  ];
  static final settings = [
    ProfileOption(
      icon: 'assets/icons/dark_mode.svg',
      title: 'Dark Mode',
    ),
    ProfileOption(
      icon: 'assets/icons/notification.svg',
      title: 'Notification Settings',
    ),
    // ProfileOption(
    //   icon: 'assets/icons/password.svg',
    //   title: 'Password Manager',
    // ),
    ProfileOption(
      icon: 'assets/icons/delete_account.svg',
      title: 'Delete Account',
    ),
  ];
}
