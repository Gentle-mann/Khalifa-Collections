class FAQItem {
  final String header, body;
  final bool isExpanded;

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
          'Yes. You can track your orders\' delivery status and view expected shipping and delivery dates.',
      isExpanded: false,
    ),
    FAQItem(
      header: 'Can I save my favorite items for later?',
      body:
          'Yes. You can track your orders\' delivery status and view expected shipping and delivery dates.',
      isExpanded: false,
    ),
    FAQItem(
      header: 'Can I share products with my friends?',
      body:
          'Yes. You can track your orders\' delivery status and view expected shipping and delivery dates.',
      isExpanded: false,
    ),
    FAQItem(
      header: 'How do I contact customer support',
      body:
          'Yes. You can track your orders\' delivery status and view expected shipping and delivery dates.',
      isExpanded: false,
    ),
    FAQItem(
      header: 'What payment methods are accepted?',
      body:
          'Yes. You can track your orders\' delivery status and view expected shipping and delivery dates.',
      isExpanded: false,
    ),
    FAQItem(
      header: 'How to add review?',
      body:
          'Yes. You can track your orders\' delivery status and view expected shipping and delivery dates.',
      isExpanded: false,
    ),
    FAQItem(
      header: 'How to get promo code for discounts?',
      body:
          'Yes. You can track your orders\' delivery status and view expected shipping and delivery dates.',
      isExpanded: false,
    ),
    FAQItem(
      header: 'How to expedite my delivery?',
      body:
          'Yes. You can track your orders\' delivery status and view expected shipping and delivery dates.',
      isExpanded: false,
    ),
    FAQItem(
      header: '',
      body:
          'Yes. You can track your orders\' delivery status and view expected shipping and delivery dates.',
      isExpanded: false,
    ),
  ];
}

class ContactUsItem {
  final String header, body, icon;
  final bool isExpanded;

  ContactUsItem(
      {required this.header,
      required this.body,
      required this.icon,
      required this.isExpanded});
  static final contactItems = [
    ContactUsItem(
      header: 'Customer Service',
      body: 'body',
      icon: 'assets/icons/customer_service.svg',
      isExpanded: false,
    ),
    ContactUsItem(
      header: 'WhatsApp',
      body: 'body',
      icon: 'assets/icons/whatsapp.svg',
      isExpanded: true,
    ),
    ContactUsItem(
      header: 'Website',
      body: 'body',
      icon: 'assets/icons/website.svg',
      isExpanded: false,
    ),
    ContactUsItem(
      header: 'Facebook',
      body: 'body',
      icon: 'assets/icons/facebook_contact.svg',
      isExpanded: false,
    ),
    ContactUsItem(
      header: 'X',
      body: 'body',
      icon: 'assets/icons/x.svg',
      isExpanded: false,
    ),
  ];
}
