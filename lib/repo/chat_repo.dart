import 'dart:convert';

import 'package:http/http.dart' as http;


import '../features/chat/model/chat_model.dart';



Stream<http.Response> getChatGptResponseRepo(List<ChatMessageModel> messages) async*{
  List<Map> mappedMessage = [];
  for(int i=0; i<messages.length;i++){
    mappedMessage.add(messages[i].toMap());
  }
  
  http.Client client = http.Client();
  http.Request request =http.Request(
      "POST",Uri.parse("http://192.168.0.110:5000/api/v1/generate_response"));
  request.headers['Accept'] ="text/event-stream";
  request.headers['Cache-Control'] ="no-cache";
  request.headers['Content-Type'] ="application/json";
  request.body = jsonEncode({
    "messages" : mappedMessage
  });

  final response = await client.send(request);

  Stream<http.Response> mappedStream = response.stream.transform(utf8.decoder).map((jsonData) {
    return http.Response(jsonData,response.statusCode,
      headers: response.headers);
  });

  yield* mappedStream;



}