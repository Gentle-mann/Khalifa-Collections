class Notifications {
  final String icon, title, timeElapsed;
  final bool isRead;

  Notifications(
      {required this.icon,
      required this.title,
      required this.timeElapsed,
      required this.isRead});
  static final todayNotifications = [
    Notifications(
      icon: 'assets/icons/shipped.svg',
      title: 'Order Shipped',
      timeElapsed: '1h',
      isRead: true,
    ),
    Notifications(
      icon: 'assets/icons/flash.svg',
      title: 'Flash Sale Alert',
      timeElapsed: '2h',
      isRead: false,
    ),
    Notifications(
      icon: 'assets/icons/star.svg',
      title: 'Product Review Request',
      timeElapsed: '4h',
      isRead: true,
    ),
  ];
  static final yesterdayNotifications = [
    Notifications(
      icon: 'assets/icons/shipped.svg',
      title: 'Order Shipped',
      timeElapsed: '1d',
      isRead: false,
    ),
    Notifications(
      icon: 'assets/icons/card.svg',
      title: 'New Paypal Added',
      timeElapsed: '1d',
      isRead: true,
    ),
    Notifications(
      icon: 'assets/icons/flash.svg',
      title: 'Flash Sale Alert',
      timeElapsed: '1d',
      isRead: false,
    ),
  ];
}
