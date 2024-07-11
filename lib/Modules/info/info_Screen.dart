// ignore_for_file: prefer_const_constructors, deprecated_member_use, camel_case_types, unnecessary_import, prefer_final_fields
import 'package:autism/generated/l10n.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Info_Screen extends StatefulWidget {
  const Info_Screen({super.key});

  @override
  State<Info_Screen> createState() => _Info_ScreenState();
}

class _Info_ScreenState extends State<Info_Screen> {
  YoutubePlayerController? _youtubePlayerController;
  @override
  void initState() {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId:
          convertedUrl('https://www.youtube.com/watch?v=-4HS8L0WfbQ'),
      flags: YoutubePlayerFlags(autoPlay: false, mute: false),
    );
    super.initState();
  }

  // @override
  // void dispose() {
  //   _youtubePlayerController!.pause();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context)
  {
    var la = S.of(context);

    AppColors colors = AppColors(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/gettyimages-1379263404-612x612 1.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            la.screenTitle,
            style: TextStyle(
                color: colors.fontColor(),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Questions-bro 1.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.whatIsAutism,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.paragraph1,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor()),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.paragraph2,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor()),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.paragraph3,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor()),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/info1.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.image2Description,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.paragraph4,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor(), fontSize: 21),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.paragraph5,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor(), fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.paragraph6,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor(), fontSize: 21),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.pa7,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor()),
          ),
          Text(
            la.pa8,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor()),
          ),
          Text(
            la.pa9,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor()),
          ),
          Text(
            la.pa10,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor()),
          ),
          Text(
            la.pa11,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor()),
          ),
          Text(
            la.pa12,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor()),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/info2.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.pa13,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa14,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.fontColor(), fontSize: 21),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsetsDirectional.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: colors.home_drawer_item_background()),
            child: Text(
              la.pa15,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: colors.fontColor(), fontSize: 21),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa16,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.pa17,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          Text(
            la.pa18,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          Text(
            la.pa19,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          Text(
            la.pa20,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          Text(
            la.pa21,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          Text(
            la.pa22,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/info3.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.pa23,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.pa24,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsetsDirectional.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: colors.home_drawer_item_background()),
            child: Text(
              la.pa25,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: colors.fontColor(), fontSize: 21),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa26,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa27,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/info4.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.pa28,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa29,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.pa30,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: mainColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.pa31,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa32,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa33,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa34,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa35,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/info5.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.pa36,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            la.pa37,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa38,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa39,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa40,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa41,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa42,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            la.pa43,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            la.pa44,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: colors.fontColor(), fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(controller: _youtubePlayerController!),
              builder: (context, player) {
                return YoutubePlayer(controller: _youtubePlayerController!);
              },
            ),
          )
        ],
      ),
    );
  }

  //converted url
  String convertedUrl(url) {
    return YoutubePlayer.convertUrlToId(url).toString();
  }
}
