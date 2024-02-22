part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class ChatNewPromptEvent extends ChatEvent {
  final String prompt;

  ChatNewPromptEvent({required this.prompt});
}
