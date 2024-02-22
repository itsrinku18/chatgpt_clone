import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<ChatNewPromptEvent>(chatNewPromptEvent);
  }


  FutureOr<void> chatNewPromptEvent(ChatNewPromptEvent event, Emitter<ChatState> emit) {

  }
}
