// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_mock/features/settings_page/cubit/settings_cubit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:api_mock/core/theme/app_colors.dart';
import 'package:api_mock/widgets/loading_animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraSection extends StatefulWidget {
  const CameraSection({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  CameraSectionState createState() => CameraSectionState();
}

class CameraSectionState extends State<CameraSection> {
  late CameraController _controller;
  late Future<void> _futureCameraCtrl;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.ultraHigh,
    );
    _futureCameraCtrl = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _capture() async {
    final image = await _controller.takePicture();
    if (!context.mounted) return;
    context.read<SettingsCubit>().onTakingPicture(image);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _futureCameraCtrl,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              CameraPreview(_controller),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: FloatingActionButton(
                    elevation: 12,
                    onPressed: _capture,
                    backgroundColor: AppColors.inactiveColor,
                    child: const Icon(
                      Icons.camera_alt,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return const Center(child: CustomLoadingSpinner());
      },
    );
  }
}
