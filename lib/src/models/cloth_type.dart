class ClothType {
  final String icon, title;

  ClothType({required this.icon, required this.title});

  static final List<ClothType> categories = [
    ClothType(
      icon: 'assets/icons/shirt.svg',
      title: 'Shirts',
    ),
    ClothType(
      icon: 'assets/icons/jeans.svg',
      title: 'Trousers',
    ),
    ClothType(
      icon: 'assets/icons/dress2.svg',
      title: 'Shoes',
    ),
    ClothType(
      icon: 'assets/icons/jacket.svg',
      title: 'Caps',
    ),
  ];
}
