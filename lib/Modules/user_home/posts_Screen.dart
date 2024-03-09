import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:flutter/material.dart';

class Posts_Screen extends StatefulWidget {
  Posts_Screen({super.key});

  @override
  State<Posts_Screen> createState() => _Posts_ScreenState();
}

class _Posts_ScreenState extends State<Posts_Screen>
{
  TextEditingController writeCon = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 10, horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                // padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                width: 350,
                height: 60,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    hintText: 'إكتب شئ',
                    hintStyle: TextStyle(
                      color: Color(0xffE1E2E9),
                    ),
                    suffix: Image.asset(
                      'assets/images/send.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => bulidPostItem(text: 'testooooooooooo oooooooooooooooo ooooooooooooo oooooooooooooo iiiiiiiiiiii pppppppppppppp [[[[[[[[[[[[[[[ jjjjjjjjjjjjjjj mmmmmmmmmmmmm bbbbbbbbbbbbb hhhhhhhhhhhhhhh jjjjjjjjjjjjjjj kkkkkkkkkkkk lllllllllllll mmmmmmmmm jjjjjjjjjjjjjjj hhhhhhhhhhhhhhh uuuuuuuuuuuuu knknkn kn kjn jn jn jn jn jn jn j nj n jn jn jn j n'),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff254777),
          onPressed: () {},
          child: Icon(
            Icons.arrow_upward,
            color: Color(0xffD5E3FF),
          ),
        ),
      ),
    );
  }
}


// Expanded(
//           child: ListView.separated(
//             itemBuilder: (context, index) => bulidPostItem(),
//             separatorBuilder: (context, index) => SizedBox(
//               height: 10,
//             ),
//             itemCount: 20,
//           ),
//         ),








// ListView(
//       padding: EdgeInsetsDirectional.all(15),
//       children: [

//       ],





// Container(
//           height: 52,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               border: Border.all(
//                 width: 1,
//                 color: Color(0xff8E9199),
//               ),
//               borderRadius: BorderRadius.circular(10)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               // defaultTextFormField(
//               //     controller: writeCon,
//               //     type: TextInputType.text,
//               //     isPrefix: false,
//               //     hint: 'إكتب شئ'),
//               defaultButton(text: 'نشر', function: () {}, radius: 20),
//               SizedBox(
//                 width: 100,
//               ),
//               TextField(
//                 decoration: InputDecoration(hintText: 'اكتب شئ'),
//               ),
//               // defaultTextFormField(
//               //     controller: writeCon,
//               //     type: TextInputType.text,
//               //     isPrefix: false,
//               //     hint: 'إكتب شئ'),
//               // Text(
//               //   '|',
//               //   style: TextStyle(
//               //       color: Color(0xffE1E2E9), fontWeight: FontWeight.bold),
//               // ),

//               SizedBox(
//                 width: 20,
//               ),
//             ],
//           ),
//         ),
































// ListView.builder(
//       itemCount: 10, // Replace 'posts' with your list of posts
//       itemBuilder: (BuildContext context, int index) {
//         return Card(
//           child: Column(
//             // أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ أَبْجَدْ هَوَّزْ
//             children: [
//               ListTile(
//                 leading:  Image.asset('assets/images/Rectangle.png'), // Replace 'posts[index].profileImage' with the URL of the profile image for the post
//                              title: Text('بْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ أَبْجَدْ هَوَّزْ'), // Replace 'posts[index].content' with the post content
//                 ),
//             ]
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.favorite),
//                     onPressed: () {
//                       // Handle like post
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.comment),
//                     onPressed: () {
//                       // Handle comment on post
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.save),
//                     onPressed: () {
//                       // Handle save post
//                     },
//                   ),
//                 ],
//               ),
            
          
//         );
//       },
//     );