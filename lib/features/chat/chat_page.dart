import 'package:chatgpt/features/chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatBloc chatBloc = ChatBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatGPT", style: TextStyle(
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,

      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc:chatBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(

            child: Column(
              children: [
                Expanded(child: ListView()),
                Container(
                  height: 120,
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      promptContainer("Tell me something about Loard Hanuman"),
                      promptContainer("Tell me something about Loard Hanuman"),
                      promptContainer("Tell me something about Loard Hanuman"),
                      promptContainer("Tell me something about Loard Hanuman"),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: const Row(
                    children: [
                      Expanded(child: TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: "Ask Anything...",
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none),
                          // fillColor: Colors.transparent,
                          filled: false,
                        ),
                      )),
                      const SizedBox(width: 12),
                      InkWell(
                        child: Icon(Icons.send_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text("ChatGPT March 2024", style: TextStyle(
                          decoration: TextDecoration.underline
                      ),),
                      const SizedBox(width: 10,),
                      Text("Free Reserach Preview")
                    ],
                  ),
                ),
                const SizedBox(height: 32),

              ],
            ),
          );
        },
      ),
    );
  }

  Widget promptContainer(String text) {
    return
      Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(16),
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.5),
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),

        ),
        child: Text(text),
      );
  }
}
