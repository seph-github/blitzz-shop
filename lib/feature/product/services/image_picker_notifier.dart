import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_picker_notifier.g.dart';

@riverpod
class ImagePickerNotifier extends _$ImagePickerNotifier {
  @override
  File? build() => null;

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    state = File(image.path);
  }
}
