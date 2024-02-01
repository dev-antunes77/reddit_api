import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

final class AppState extends Equatable {
  const AppState(this.index, this.locale);

  final int index;
  final Locale locale;

  @override
  List<Object?> get props => [index, locale];
}
