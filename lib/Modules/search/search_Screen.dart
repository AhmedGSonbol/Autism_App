// ignore_for_file: prefer_const_constructors

import 'package:autism/Models/admin_Users_Model.dart';
import 'package:autism/Models/search_Model.dart';
import 'package:autism/Modules/Admin/manage_Admins/manage_Accounts_Screen.dart';
import 'package:autism/Modules/profile/profile_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/Constants/Countries.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:autism/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl ;

class Search_Screen extends StatelessWidget {
   Search_Screen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    AppColors colors = AppColors(context);

    var cubit = AppCubit.get(context);
    var la = S.of(context);
    // cubit.getAllAdmins();

    return BlocConsumer<AppCubit,AppStates>
      (
      listener: (context, state) {},
      builder: (context, state)
      {
        return Scaffold(
          appBar: AppBar(
            title: Text(la.search,style: TextStyle(color: colors.fontColor()),),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color:  colors.fontColor(),
            ),
            actions:
            [
              IconButton( icon: Icon(Icons.settings_suggest,color: colors.fontColor(),),
                onPressed: ()
                {
                  showDialog(
                    context: context,
                    builder: (context)
                    {
                      return StatefulBuilder(
                        builder: (context, setState)
                        {

                          return AlertDialog(
                            backgroundColor:
                            colors.home_drawer_background_color(),
                            title: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                   Text(
                                    la.search,
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: colors.fontColor()),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),

                                ],
                              ),
                            ),
                            content: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

                                    DropdownButton(

                                      menuMaxHeight: 200.0,
                                      dropdownColor:  colors.home_drawer_item_background(),

                                      alignment: Alignment.centerRight,
                                      value: cubit.countryValue,
                                      onChanged: (val)
                                      {
                                        setState(()
                                        {
                                          cubit.changeCountryValue(val.toString());
                                        });

                                      },
                                      style:TextStyle(color: colors.fontColor() , fontSize: 20.0),
                                      items:
                                      countriesAR.map((e)
                                      {
                                        return DropdownMenuItem(
                                          child: Text(e['label'].toString(),
                                            style: TextStyle(color: colors.fontColor()),
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.rtl,
                                          ),
                                          alignment: Alignment.centerRight,
                                          value: e['value'],);

                                      } ).toList(),

                                    ),
                                    SizedBox(width: 20.0,),
                                    Text(la.country,
                                      style: TextStyle(
                                          color: colors.fontColor() ,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

                                    DropdownButton(

                                      menuMaxHeight: 200.0,
                                      dropdownColor:  colors.home_drawer_item_background(),

                                      alignment: Alignment.centerRight,
                                      value: cubit.governmentValue,
                                      onChanged: (val)
                                      {
                                        setState(()
                                        {
                                          cubit.changeGovernmentValue(val.toString());
                                        });

                                      },
                                      style:TextStyle(color: colors.fontColor() , fontSize: 20.0),
                                      items:

                                      cubit.governments.map((e)
                                      {
                                        return DropdownMenuItem(
                                          child: Text(e['label'].toString(),
                                            style: TextStyle(color: colors.fontColor()),
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.rtl,
                                          ),
                                          alignment: Alignment.centerRight,
                                          value: e['value'],);

                                      } ).toList(),

                                    ),
                                    SizedBox(width: 20.0,),
                                    Text(la.government,
                                      style: TextStyle(
                                          color: colors.fontColor() ,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ],
                                ),


                              ],
                            ),

                            actions: [
                              TextButton(
                                child:  Text(
                                  la.ok,
                                  style: TextStyle(
                                      color: mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0
                                  ),
                                ),
                                onPressed: ()
                                {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],

                            // backgroundColor: backgroundColor,
                            titlePadding: EdgeInsets.zero,
                          );

                        },
                      );
                    },
                  );
                },)
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              children:
              [
                SizedBox(height: 20.0,),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0,top: 5.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: colors.backgroundColor(),
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextField(
                          controller: searchController,
                          style:  TextStyle(color: colors.fontColor()),
                          decoration: InputDecoration(

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: colors.fontColor())
                              ),
                              hintText: la.writeSomethingHere,

                              suffixIcon: IconButton(
                                icon: Transform.rotate(
                                  angle: 0,
                                  child:  Icon(Icons.search,color: colors.fontColor(),),
                                ),
                                onPressed: ()
                                {
                                    cubit.searchForUser(searchController.text);
                                },
                              ),
                          ),
                          onSubmitted: (val)
                          {
                            cubit.searchForUser(val);
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                state is LoadingSearchForUserState
                    ?
                Center(
                  child: CircularProgressIndicator(color: mainColor,),
                )
                    :
                cubit.search_model == null
                    ?
                    Center(
                      child: Text(la.noData,style: TextStyle(color: colors.fontColor(),fontSize: 22.0),),
                    )
                    :

                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 20.0),
                  itemBuilder: (context, index) {
                    return Directionality(
                        textDirection: TextDirection.rtl,
                        child: buildSearchItems(context,cubit.search_model!.data[index],colors));
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.0,
                  ),
                  itemCount: cubit.search_model!.data.length,
                ),
              ],
            ),
          ),
        );


      },);

  }
}
Widget buildSearchItems(BuildContext context,SearchData model,AppColors colors )
{

  return InkWell(
    onTap: ()
    {
      navTo(context, Profile_Screen(isView: true));
      AppCubit.get(context).getUserData(userID: model.id!);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.post_background_color(),
          borderRadius: BorderRadiusDirectional.circular(15),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Hero(
                      tag: '${model.id}_image',
                      child: myImageProvider(model.image)
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text(
                          model.name!,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: colors.fontColor()
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          model.government!,
                          style: TextStyle(fontSize: 15.0, color: colors.fontColor()),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),

            // Expanded(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsetsDirectional.only(end: 20),
            //         child: Container(
            //           height: 30,
            //           width: 30,
            //           decoration: const BoxDecoration(
            //               shape: BoxShape.circle, color: Color(0xffA8C8FF)),
            //           child: const Center(
            //             child: Text(
            //               '٢',
            //               style: TextStyle(
            //                   color: Color(0xff05305F),
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    ),
  );

}