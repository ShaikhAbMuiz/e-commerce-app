import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  // Properties
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

// Constructor
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    this.isFeatured = false,
  });

  // Static Function to create an empty banner model
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  // Function to convert banner model to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'parentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  // 
  factory CategoryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data();
      return CategoryModel(
        id: document.id,
        name: data!['name'] ?? '',
        image: data['image'] ?? '',
        parentId: data['parentId'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
