import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/styles/colors.dart';
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


          title: Row(
            children:
            [
              Spacer(),

              Text(
                'د. أحمد',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10.0,),
              CircleAvatar(
                backgroundColor: Color(0xff1D2024),

                child: Image(image: AssetImage('assets/images/Rectangle (1).png'),),

              ),

              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward),
                color: const Color(0xffE1E2E9),
              ),
            ],
          ),
          titleSpacing: 0.0,
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.search,
          //       color: Color(0xffCCCCCC),
          //       size: 25,
          //     ),
          //   ),
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.more_vert,
          //       color: Color(0xffCCCCCC),
          //       size: 25,
          //     ),
          //   ),
          // ],
        ),
        body: Column(
          children:
          [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => receiverItemBuilder(),
                itemCount: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                maxLines: 1,


                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(

                  hintTextDirection: TextDirection.rtl,
                  hintText: 'اكتب شيئا هنا',
                  hintStyle: TextStyle(color: Color(0xffE1E2E9)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  suffixIcon:IconButton(onPressed: (){},icon: Icon(Icons.send_rounded,color: Color(0xffE1E2E9),),),
                  fillColor:  Color(0xff33353A),
                  filled: true,
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Color(0xff1D2024) ,)),
                  hoverColor: Colors.blue
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
        EdgeInsets.all(16.0),
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xffA8C8FF),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            bottomEnd: Radius.circular(16),
            bottomStart: Radius.circular(16),
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

  Widget receiverItemBuilder()
  {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
        EdgeInsets.all(16.0),
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xff43474E),
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(16),
            bottomEnd: Radius.circular(16),
            bottomStart: Radius.circular(16),
          ),
        ),
        child: Text(
          'السلام عليكم ورحمة الله',
          style: TextStyle(
            color: Color(0xffE1E2E9),
          ),
        ),
      ),
    );
  }
}
