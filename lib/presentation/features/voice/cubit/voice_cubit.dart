// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robodash/presentation/features/control/cubit/command_cubit.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'voice_state.dart';

class VoiceCubit extends Cubit<VoiceState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final CommandCubit commandCubit;
  bool _isListening = false;

  VoiceCubit({required this.commandCubit}) : super(const VoiceInitial());

  bool get isListening => _isListening;

  Future<void> toggleListening({required String localeId}) async {
    if (_isListening) {
      await stopListening();
    } else {
      await startListening(localeId: localeId);
    }
  }

  Future<void> startListening({required String localeId}) async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        log('Status changed: $status');

        if (status == 'notListening' || status == 'done') {
          _isListening = false;
          emit(state is VoiceLoaded ? state : const VoiceInitial());
        }
      },
      onError: (error) {
        _isListening = false;
        emit(VoiceError(error.errorMsg));
      },
    );

    if (available) {
      _isListening = true;
      emit(const VoiceLoading());

      await _speech.listen(
        onResult: (result) {
          if (result.finalResult) {
            _isListening = false;
          }

          if (result.recognizedWords.isNotEmpty) {
            final parsed = _parseCommand(result.recognizedWords);

            if (result.finalResult && parsed['intent'] != 'unknown') {
              commandCubit.sendCommand(_mapParsedToCommand(parsed));
            }

            emit(
              VoiceLoaded(
                recognizedText: result.recognizedWords,
                intent: parsed['intent'],
                parameters: parsed['parameters'],
              ),
            );
          }
        },
        localeId: localeId,
        listenMode: stt.ListenMode.confirmation,
      );
    } else {
      emit(const VoiceError('Microphone permission denied'));
    }
  }

  Future<void> stopListening() async {
    await _speech.stop();
    _isListening = false;
    emit(state is VoiceLoaded ? state : const VoiceInitial());
  }

  Map<String, dynamic> _parseCommand(String text) {
    text = text.toLowerCase();
    if (text.contains('forward') || text.contains('امام')) {
      return {
        'intent': 'move',
        'parameters': {'direction': 'forward'},
      };
    }
    if (text.contains('back') || text.contains('رجوع')) {
      return {
        'intent': 'move',
        'parameters': {'direction': 'back'},
      };
    }
    if (text.contains('left') || text.contains('شمال')) {
      return {
        'intent': 'move',
        'parameters': {'direction': 'left'},
      };
    }
    if (text.contains('right') || text.contains('يمين')) {
      return {
        'intent': 'move',
        'parameters': {'direction': 'right'},
      };
    }
    if (text.contains('stop') || text.contains('قف')) {
      return {'intent': 'stop', 'parameters': {}};
    }

    final speedMatch = RegExp(r'speed (\d+)').firstMatch(text);
    if (speedMatch != null) {
      return {
        'intent': 'speed',
        'parameters': {'value': int.parse(speedMatch[1]!)},
      };
    }

    return {'intent': 'unknown', 'parameters': {}};
  }

  String _mapParsedToCommand(Map<String, dynamic> parsed) =>
      switch (parsed['intent']) {
        'move' => parsed['parameters']['direction'],
        'stop' => 'stop',
        'speed' => 'speed ${parsed['parameters']['value']}',
        _ => 'unknown',
      };

  @override
  Future<void> close() {
    _speech.cancel();
    return super.close();
  }
}
