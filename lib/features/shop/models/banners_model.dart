import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  // Properties
  String imageUrl;
  final String targetScreen;
  bool active;

  // Constructor
  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  // Static Function to create an empty banner model
  static BannerModel empty() =>
      BannerModel(imageUrl: '', targetScreen: '', active: false);

  // Function to convert banner model to json
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  // Function to convert json to banner model
  factory BannerModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      Map<String, dynamic> data = document.data()!;

      return BannerModel(
        imageUrl: data['imageUrl'] ?? '',
        targetScreen: data['targetScreen'] ?? '',
        active: data['active'] ?? '',
      );
    } else {
      return BannerModel.empty();
    }
  }
}
