import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class VisionFullScreenCamera extends StatelessWidget {
  final CameraController controller;

  const VisionFullScreenCamera({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: controller.value.previewSize!.height,
        height: controller.value.previewSize!.width,
        child: CameraPreview(controller),
      ),
    );
  }
}
