import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/dependency_injection/service_locator.dart';
import 'package:robodash/presentation/features/vision/cubit/vision_cubit.dart';
import 'package:robodash/presentation/features/vision/cubit/vision_state.dart';

import '../widgets/vision_detections_overlay.dart';
import '../widgets/vision_event_feed.dart';
import '../widgets/vision_fullscreen_camera.dart';

class VisionScreen extends StatelessWidget {
  const VisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VisionCubit>(),
      child: const VisionView(),
    );
  }
}

class VisionView extends StatefulWidget {
  const VisionView({super.key});

  @override
  State<VisionView> createState() => _VisionViewState();
}

class _VisionViewState extends State<VisionView> {
  @override
  void initState() {
    super.initState();

    context.read<VisionCubit>().start();
  }

  @override
  void dispose() {
    context.read<VisionCubit>().stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final visionBackground = isDark
        ? DarkColors.visionBackground
        : LightColors.visionBackground;
    final visionAccent = isDark
        ? DarkColors.visionAccent
        : LightColors.visionAccent;

    return Scaffold(
      backgroundColor: visionBackground,
      body: BlocBuilder<VisionCubit, VisionState>(
        builder: (context, state) {
          final cubit = context.read<VisionCubit>();

          if (cubit.cameraController == null ||
              !cubit.cameraController!.value.isInitialized) {
            return Center(
              child: CircularProgressIndicator(color: visionAccent),
            );
          }

          return Stack(
            fit: StackFit.expand,
            children: [
              VisionFullScreenCamera(controller: cubit.cameraController!),

              if (state is VisionLoaded)
                VisionDetectionsOverlay(
                  detections: state.detections,
                  previewSize: cubit.cameraController!.value.previewSize!,
                ),

              VisionEventFeed(
                detections: state is VisionLoaded ? state.detections : const [],
              ),
            ],
          );
        },
      ),
    );
  }
}
