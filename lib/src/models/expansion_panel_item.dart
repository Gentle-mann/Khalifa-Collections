class FAQItem {
  String header, body;
  bool isExpanded;

  FAQItem({required this.header, required this.body, required this.isExpanded});
  static final items = [
    FAQItem(
      header: 'Can I track my orders\' delivery status?',
      body:
          'Yes. You can track your orders\' delivery status and view expected shipping and delivery dates.',
      isExpanded: true,
    ),
    FAQItem(
      header: 'Is there a return policy?',
      body:
          'Certainly. Whenever a product is delivered to you, you have a whooping 15 days to return the product and get your money back. This is guaranteed.',
      isExpanded: false,
    ),
    FAQItem(
      header: 'Can I save my favorite items for later?',
      body:
          'Absolutely. Just click on the heart icon to add to favorites, and go to the Favorites tab to view your favorites.',
      isExpanded: false,
    ),
    FAQItem(
      header: 'Can I share products with my friends?',
      body: 'Yes you can.',
      isExpanded: false,
    ),
    FAQItem(
      header: 'How do I contact customer support',
      body: 'WhatsApp and call: +2349033696162',
      isExpanded: false,
    ),
    FAQItem(
      header: 'What payment methods are accepted?',
      body:
          'For now, bank transfer. See our bank account number in the Payment Methods page.',
      isExpanded: false,
    ),
  ];
}

class ContactUsItem {
  String header, body, icon;
  bool isExpanded;

  ContactUsItem(
      {required this.header,
      required this.body,
      required this.icon,
      required this.isExpanded});
  static final contactItems = [
    ContactUsItem(
      header: 'Customer Service',
      body: 'https://wa.me/2349033696162',
      icon: 'assets/icons/customer_service.svg',
      isExpanded: false,
    ),
    ContactUsItem(
      header: 'WhatsApp',
      body: 'https://wa.me/2349033696162',
      icon: 'assets/icons/whatsapp.svg',
      isExpanded: true,
    ),
    // ContactUsItem(
    //   header: 'Website',
    //   body: 'Coming soon',
    //   icon: 'assets/icons/website.svg',
    //   isExpanded: false,
    // ),
    ContactUsItem(
      header: 'Instagram',
      body: 'https://www.instagram.com/khalifa_collections_official/',
      icon: 'assets/icons/instagram.svg',
      isExpanded: false,
    ),
    ContactUsItem(
      header: 'X',
      body: 'https://twitter.com/ishaq_ibrahim07',
      icon: 'assets/icons/x.svg',
      isExpanded: false,
    ),
  ];
}
