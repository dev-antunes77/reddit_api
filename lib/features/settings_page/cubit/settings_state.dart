// ignore_for_file: overridden_fields

part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({this.file});

  final File? file;

  @override
  List<Object?> get props => [file];
}

class SettingsUpdatedState extends SettingsState {
  const SettingsUpdatedState({this.file});

  @override
  final File? file;

  @override
  List<Object?> get props => [file];
}
