import 'package:autism/Modules/test/test_Screen.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile_Child_Screen extends StatelessWidget {
  Profile_Child_Screen({Key? key}) : super(key: key);


  var nameController = TextEditingController();
  var ageController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:
          [
            Column(
              mainAxisSize: MainAxisSize.min,
              children:
              [
                // defaultTextFormField(controller: nameController, type: TextInputType.name, isPrefix: false),
                // defaultTextFormField(controller: ageController, type: TextInputType.name, isPrefix: false),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children:
              [
                Text('اسم الطفل',style: TextStyle(color: fontColor,fontSize: 20.0),),
                SizedBox(height: 10.0,),
                Text('عمر الطفل',style: TextStyle(color: fontColor,fontSize: 20.0),),
              ],
            ),
            SizedBox(width: 10.0,),
            Column(
              mainAxisSize: MainAxisSize.min,
              children:
              [
                Icon(Icons.badge_outlined,color: mainColor,),
                SizedBox(height: 20.0,),
                Icon(Icons.calendar_month_outlined,color: mainColor,),
              ],
            ),


          ],
        ),

        SizedBox(height: 30.0,),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children:
        [
          Text('قم بتشخيص طفلك الآن',style: TextStyle(color: fontColor,fontSize: 20.0),),
          SizedBox(width: 10.0,),
          Icon(Icons.badge_outlined,color: mainColor,),
        ],),
        SizedBox(height: 10.0,),
        defaultElevatedButton(text: 'اختبر',
          onPressed: ()
          {
            navTo(context, Test_Screen());
          },
        ),
        SizedBox(height: 30.0,),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [

                Text('صور',style: TextStyle(color: fontColor,fontSize: 25.0),),
                SizedBox(width: 10.0,),
                Icon(Icons.image_outlined,color: fontColor,),
              ],
            ),
            Text('قم بإضافة بعض الصور لمساعدة الطبيب المختص',style: TextStyle(color: fontColor,fontSize: 15.0),),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:
              [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),

                  child: Image(image: AssetImage('assets/images/gettyimages-1379263404-612x612 1.png'),width: 100,height: 100,fit: BoxFit.cover,),
                ),
                SizedBox(width: 10.0,),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),

                  child: Image(image: AssetImage('assets/images/gettyimages-1379263404-612x612 1.png'),width: 100,height: 100,fit: BoxFit.cover,),
                ),
                SizedBox(width: 10.0,),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),

                  child: Image(image: AssetImage('assets/images/gettyimages-1379263404-612x612 1.png'),width: 100,height: 100,fit: BoxFit.cover,),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            defaultElevatedButton(text: 'إضافة',onPressed: (){}),
          ],
        )

      ],
    );
  }
}
