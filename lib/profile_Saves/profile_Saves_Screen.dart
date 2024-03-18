import 'package:autism/Shared/components/components.dart';
import 'package:flutter/material.dart';

class Profile_Saves_Screen extends StatelessWidget {
  const Profile_Saves_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 20.0),

      itemBuilder: (context, index)
      {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: bulidPostItem(text: 'my post', context: context));

      },

      separatorBuilder: (context, index) => SizedBox(height: 10.0,),

      itemCount: 7,
    );
  }
}
