class ClothType {
  final String icon, title;

  ClothType({required this.icon, required this.title});

  static final List<ClothType> categories = [
    ClothType(
      icon: 'assets/icons/shirt.svg',
      title: 'T-shirt',
    ),
    ClothType(
      icon: 'assets/icons/jeans.svg',
      title: 'Pants',
    ),
    ClothType(
      icon: 'assets/icons/dress2.svg',
      title: 'Dress',
    ),
    ClothType(
      icon: 'assets/icons/jacket.svg',
      title: 'Jacket',
    ),
  ];
}
