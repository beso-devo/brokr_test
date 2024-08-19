import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

class CustomMultiPartFile {
  static Future<MultipartFile> prepareFileForUpload(File file) async {
    String fileName = path.basename(file.path);
    return MultipartFile.fromFileSync(file.path, filename: fileName);
  }
}
