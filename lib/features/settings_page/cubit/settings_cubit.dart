import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void onTakingPicture(XFile file) =>
      emit(SettingsState(file: File(file.path)));

  void onSwitchLanguage() => emit(const SettingsUpdatedState());
}
