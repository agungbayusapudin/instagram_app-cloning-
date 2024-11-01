import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:instagram_cloning/modelView/cameraModelView.dart';
import 'package:instagram_cloning/modelView/uploadsModelView.dart';
import 'package:provider/provider.dart';

class PostPages extends StatefulWidget {
  const PostPages({super.key});

  @override
  State<PostPages> createState() => _PostPagesState();
}

class _PostPagesState extends State<PostPages> {
  Future<void> pickAndUploadImage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      final uploadViewModel =
          Provider.of<Cameramodelview>(context, listen: false);
      await uploadViewModel.getDownloadUrl(file);
    } else {
      debugPrint("No file selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final uploadViewModel = Provider.of<Cameramodelview>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Upload Image")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => pickAndUploadImage(context),
              child: const Text("Select and Upload Image"),
            ),
            if (uploadViewModel.isLoading) const CircularProgressIndicator(),
            if (uploadViewModel.downladUrl != null)
              Text("Download URL: ${uploadViewModel.downladUrl}"),
          ],
        ),
      ),
    );
  }
}
