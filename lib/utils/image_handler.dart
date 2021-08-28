import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageHandler {
  static Future<File>? takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    return imageFile == null ? File('') : File(imageFile.path);
  }
}
