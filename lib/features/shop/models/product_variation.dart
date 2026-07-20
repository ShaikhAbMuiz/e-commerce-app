class ProductVariationModel {
  // Variables Or Properties
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  // Constructor
  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description,
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Empty Constructor
  static ProductVariationModel empty() => ProductVariationModel(
    id: '',
    sku: '',
    image: '',
    description: '',
    price: 0.0,
    salePrice: 0.0,
    stock: 0,
    attributeValues: {},
  );

  /// Convert Model to Json
Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }

  /// Convert Json to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();

    return ProductVariationModel(
      id: data['id'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      price: double.parse((data['price'] ?? 0.0).toString()),
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      sku: data['sku'] ?? '',
      stock: data['stock'] ?? 0,
      attributeValues: Map<String, String>.from(data['attributeValues']),
    );
  }
}
