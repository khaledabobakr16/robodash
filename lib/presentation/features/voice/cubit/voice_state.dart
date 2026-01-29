import 'package:flutter/foundation.dart';

@immutable
sealed class VoiceState {
  const VoiceState();
}

final class VoiceInitial extends VoiceState {
  const VoiceInitial();
}

final class VoiceLoading extends VoiceState {
  const VoiceLoading();
}

final class VoiceLoaded extends VoiceState {
  final String recognizedText;
  final String intent;
  final Map<String, dynamic> parameters;

  const VoiceLoaded({
    required this.recognizedText,
    required this.intent,
    required this.parameters,
  });
}

final class VoiceError extends VoiceState {
  final String message;
  const VoiceError(this.message);
}
