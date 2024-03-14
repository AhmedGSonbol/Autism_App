import 'package:autism/Shared/Constants/Constants.dart';
import 'package:flutter/material.dart';

class Chat_Details_Screen extends StatelessWidget {
  const Chat_Details_Screen({super.key});

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
                itemBuilder: (context, index) => senderItemBuilder(),
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

  Widget senderItemBuilder()
  {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        //Don`nt use fixed height and width
        // height: 85,
        // width: 150,
        padding:
        EdgeInsetsDirectional.only(start: 16, bottom: 16, end: 16, top: 16),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xffA8C8FF),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
            bottomStart: Radius.circular(40),
          ),
        ),
        child: Text(
          'السلام عليكم ورحمة الله',
          style: TextStyle(
            color: Color(0xff05305F),
          ),
        ),
      ),
    );
  }
}
