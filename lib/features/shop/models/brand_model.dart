import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  // Variables Or Properties
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  // Constructor
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  /// Empty Constructor
  static BrandModel empty() => BrandModel(
    id: '',
    name: '',
    image: '',
    isFeatured: false,
    productsCount: 222,
  );

  /// Convert Model to Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
      'productsCount': productsCount,
    };
  }

  /// Convert Json to Model (Factory Constructor)
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      isFeatured: json['isFeatured'],
      productsCount: json['productsCount'],
    );
  }

  /// Convert Json to Model
  factory BrandModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      Map<String, dynamic> data = document.data()!;
      return BrandModel(
        id: data['id'],
        name: data['name'],
        image: data['image'],
        isFeatured: data['isFeatured'],
        productsCount: data['productsCount'],
      );
    } else {
      return BrandModel.empty();
    }
  }
}
