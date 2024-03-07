import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/widgets/chat/chat_screen/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Color(0xff1D2024),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Rectangle (1).png'),
          ),
          title: Text(
            'د. أحمد',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Color(0xffCCCCCC),
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Color(0xffCCCCCC),
                size: 25,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ChatBubble(),
                itemCount: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  suffix: Image.asset('assets/images/send.png',
                      color: Color(0xffA8C8FF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
