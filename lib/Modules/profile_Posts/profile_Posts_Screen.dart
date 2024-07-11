import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Posts_Screen extends StatelessWidget {
  const Profile_Posts_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {

          var cubit = AppCubit.get(context);

          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 20.0),

            itemBuilder: (context, index)
            {
              return bulidPostItem(context: context,model: cubit.myPosts[index],enableOpenProfile: false);

            },

            separatorBuilder: (context, index) => SizedBox(height: 10.0,),

            itemCount: cubit.myPosts.length,
          );

        },);
  }
}
