import 'package:chatgpt/design/app_colors.dart';
import 'package:chatgpt/features/chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatBloc chatBloc = ChatBloc();
  TextEditingController controller = TextEditingController();
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
                Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top:12),
                  itemCount: chatBloc.cachedMessage.length,
                    itemBuilder:(context,index){
                    return Container(
                      decoration: BoxDecoration(
                        color: chatBloc.cachedMessage[index].role == 'assistant'
                            ? AppColors.messageBgColor :
                        Colors.transparent),
                      margin: const EdgeInsets.only(bottom: 8.0),
                      padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 8.0,top: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          chatBloc.cachedMessage[index].role =='assistant' ?
                              Container(
                                height: 32,
                                width: 32,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(image:
                                  AssetImage("assets/img_1.png",),fit: BoxFit.cover)
                                ),

                              ) : Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image:
                                AssetImage("assets/user.jpg",),fit: BoxFit.cover)
                            ),
                          ),
                          const SizedBox(width: 18,),
                          Expanded(
                            child: Text(
                              chatBloc.cachedMessage[index].content,
                              style: TextStyle(
                              fontSize: 18,
                            ),
                            ),
                          ),
                        ],
                      ),

                    );
                    }
                )
                ),
                Container(
                  height: 100,
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
                  child:  Row(
                    children: [
                      Expanded(child: TextField(
                        controller: controller,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Ask Anything...",
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none),
                          // fillColor: Colors.transparent,
                          filled: false,
                        ),
                      )),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: (){
                          if(controller.text.isNotEmpty){
                            String text =controller.text;
                            controller.clear();
                            chatBloc.add(ChatNewPromptEvent(prompt: text));
                          }

                        },
                        child: const Icon(Icons.send_rounded,
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
