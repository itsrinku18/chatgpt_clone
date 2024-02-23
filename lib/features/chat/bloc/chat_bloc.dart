import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chatgpt/features/chat/model/chat_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../repo/chat_repo.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<ChatNewPromptEvent>(chatNewPromptEvent);
    on<ChatNewContentGeneratedEvent>(chatNewContentGeneratedEvent);
  }

  StreamSubscription<http.Response>? _subscription;
  List<ChatMessageModel> cachedMessage = [];

  FutureOr<void> chatNewPromptEvent(
      ChatNewPromptEvent event, Emitter<ChatState> emit) {
    emit(ChatNewMessageGeneratingLoadingState());

    try{
      ChatMessageModel newMessage = ChatMessageModel(role:'user',content: event.prompt);
      cachedMessage.add(newMessage);
      emit(ChatNewMessageGeneratedState());
      cachedMessage.add(ChatMessageModel(role:'assistant',content: ""));
      _subscription?.cancel();
      _subscription = getChatGptResponseRepo(cachedMessage).listen((response){
        log(response.toString());
        for(String line in response.body.split('\n')){
          // log(line);
          String jsonDataString = line.replaceFirst("data:", "");
          // log(jsonDataString);
          Map<String,dynamic> data = jsonDecode(jsonDataString.trim());
          // log(jsonDataString.toString());
          add(ChatNewContentGeneratedEvent(content: data['data']));

        }
      });

    }catch(e){
      log(e.toString());
      emit(ChatNewMessageGeneratingErrorState());

    }





  }

  FutureOr<void> chatNewContentGeneratedEvent(
      ChatNewContentGeneratedEvent event, Emitter<ChatState> emit) {

    ChatMessageModel modelMessage = cachedMessage.last;
    String content = event.content;
    cachedMessage.last = ChatMessageModel(role:'assistant',content: modelMessage.content+content);
    log(cachedMessage.last.content);
  emit(ChatNewMessageGeneratedState());
  }
}
