class Product {
  final int id;
  final String thumbnailImg;
  final String name;
  final String description;
  final double price;
  final double discountedPrice;
  final double discountPercentage;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.discountPercentage,
    required this.price,
    required this.discountedPrice,
    required this.thumbnailImg,
  });

  factory Product.fromJson(Map productData) {
    final discountedPrice = ((double.tryParse('${productData['price']}') ??
            0.0) *
        (1 -
            ((double.tryParse('${productData['discountPercentage']}') ?? 0.0) *
                0.01)));
    return Product(
      id: productData['id'] ?? '',
      name: productData['title'] ?? '',
      description: productData['description'] ?? '',
      discountPercentage:
          double.tryParse('${productData['discountPercentage']}') ?? 0.0,
      price: double.tryParse('${productData['price']}') ?? 0.0,
      discountedPrice: discountedPrice,
      thumbnailImg: productData['thumbnail'] ?? 0,
    );
  }
}
