import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatGPT",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,

      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child:ListView()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.only(left: 16,right: 16,top: 8),
              child: const Row(
                children: [
                  Expanded(child: TextField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: "Ask Anything...",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
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
                  Text("ChatGPT March 2024",style: TextStyle(
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
      ),
    );
  }
}
