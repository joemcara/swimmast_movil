import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<String> uploadImage(
      String refPath, String childPath, XFile image) async {
    try {
      String cleanChildPath =
          childPath.trim().replaceAll(" ", "").toLowerCase();
      final ref = FirebaseStorage.instance.ref(refPath).child(cleanChildPath);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw "Something went wrong.";
    }
  }
}
