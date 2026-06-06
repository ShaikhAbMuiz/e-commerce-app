import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:io';

import '../../utils/constants/apis.dart';
import '../../utils/constants/keys.dart';

class CloudinaryServices extends GetxController {
  static CloudinaryServices get instance => Get.find();

  /// Variables
  final _dio = dio.Dio();

  /// [Upload Image] - Function to upload Image to Cloudinary
  Future<dio.Response> upLoadImage(File image, String folderName) async {
    try {
      // API Call to upload image
      String api = UApiUrls.uploadApi(UKeys.cloudName);

      // Create FormData object
      final dio.FormData formData = dio.FormData.fromMap({
        'upload_preset': UKeys.uploadPreset,
        'folder': folderName,
        'file': await dio.MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });

      // Heat Request to API
      dio.Response response = await _dio.post(api, data: formData);

      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  /// [Delete Image] - Function to delete Image from Cloudinary
  Future<dio.Response> deleteImage(String publicId) async {
    try {
      String api = UApiUrls.deleteApi(UKeys.cloudName);

      int timeStamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();

      String signatureBase =
          'public_id=$publicId&timestamp=$timeStamp${UKeys.apiSecret}';
      String signature = sha1.convert(utf8.encode(signatureBase)).toString();

      final dio.FormData formData = dio.FormData.fromMap({
        'public_id': publicId,
        'api_key': UKeys.apiKey,
        'timestamp': timeStamp,
        'signature': signature,
      });

      dio.Response response = await _dio.post(api, data: formData);

      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
