// ignore_for_file: prefer_const_constructors, deprecated_member_use, camel_case_types, unnecessary_import, prefer_final_fields
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
            'ما يجب معرفته عن مرض التوحد عند الأطفال ؟',
            style: TextStyle(
                color: Color(0xffE3E2E6),
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
          Center(
            child: Text(
              'ما هو التوحد ؟',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'التوحد هو اضطراب عصبي يؤثر على قدرة الشخص على التواصل والتفاعل مع الآخرين. قد يحتاج الشخص المصاب بالتوحد إلى الرعاية مدى الحياة. إذا اكتشفت موخراَ أن طفلك أو أحد أفراد أسرتك يعاني من هذه الحالة، فمن المحتمل أنك تتساءل عن الخطوات التالية التي يجب اتخاذها.',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor()),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'يمكن أن يكون التوحد حالة صعبة، خاصة عندما لا تكون غير مجهز بالمعلومات الصحيحة لرعاية شخص مصاب بهذا الاضطراب. إذا كنت أحد الوالدين أو الوصي على طفل مصاب بالتوحد، فمن الضروري تثقيف نفسك حول الطريقة المناسبة لرعاية طفلك المصاب بالتوحد.',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor()),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'نقدم في هذه المقالة نصائح تقديم الرعاية التي يمكن أن تساعدك في تقديم الرعاية المناسبة لطفلك أو أي شخص مصاب بالتوحد. ويتناول أيضًا أهمية العناية بنفسك أثناء رعاية شخص مصاب بالتوحد. ',
            style: Theme.of(context)
                .textTheme
                .headline6
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
          Center(
            child: Text(
              'أعرض التوحد عن اﻷطفال',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'يعاني الأطفال المصابون بالتوحد من مجموعة واسعة من الأعراض. تبدو أعراض التوحد مختلفة من طفل إلى آخر. قد تبدو علامات الحالة في بعض الأحيان مختلفة عند الفتيات عنها عند الأولاد.',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor(), fontSize: 21),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'تبدو الفتيات المصابات بالتوحد أكثر هدوءًا وأفضل في "إخفاء" أعراضهن، مما يجعل تشخيص مرض التوحد لدى الفتيات أكثر تعقيدًا قليلاً منه عند الأولاد.',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor(), fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'ستبدو علامات التوحد أيضًا مختلفة قليلاً عند الأطفال الأصغر سنًا عنها عند الأطفال الأكبر سنًا. من بين الأعراض الأكثر شيوعًا لهذا الاضطراب ما يلي: ',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor(), fontSize: 21),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'صعوبة في التواصل البصري مع الآخرين أو الحفاظ عليه  ',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor()),
          ),
          Text(
            'صعوبة في التواصل مع الآخرين',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor()),
          ),
          Text(
            'صعوبة تعلم أشياء جديدة',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor()),
          ),
          Text(
            'مشاكل في التعامل مع التغييرات الجديدة',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor()),
          ),
          Text(
            'التفاعل بقوة مع الأصوات العالية والأضواء الساطعة',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor()),
          ),
          Text(
            'إظهار سلوكيات متكررة مثل التصفيق بأيديهم بشكل متكرر أو هز أجسادهم ذهابًا وإيابًا',
            style: Theme.of(context)
                .textTheme
                .headline6
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
          Center(
            child: Text(
              'كيف يتم تشخيص مرض التوحد عند الأطفال ؟',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'لا يوجد اختبار طبي محدد يستخدم لتشخيص اضطراب طيف التوحد عند الأطفال. ومع ذلك، يمكن استخدام أدوات تشخيصية محددة للكشف عن مرض التوحد لدى الأطفال بدءًا من سن الثانية.',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colors.fontColor(), fontSize: 21),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 120,
            padding: EdgeInsetsDirectional.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff43474E)),
            child: Text(
              'إن التشخيص المبكر لاضطراب طيف التوحد يمكن أن يسهل العلاج المبكر، مما يساعد الأطفال الذين يعانون من هذه الحالة على التكيف بشكل أفضل.',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: colors.fontColor(), fontSize: 21),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'تتضمن بعض العلامات التي سيبحث عنها الطبيب عند الأطفال عند محاولة تحديد ما إذا كانوا مصابين باضطراب طيف التوحد ما يلي:',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '- عدم القدرة على التواصل بالعين .',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          Text(
            '- عدم التحدث لمدة ١٦ شهرًا . ',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          Text(
            '- التحدث قليلاً جدًا أو التحدث بصوت غير عادي .',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          Text(
            '- عدم القدرة على التواصل بأيديهم عندما يبلغون سنة واحدة . ',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          Text(
            '- إذا بدا أنهم يفقدون المهارات الاجتماعية أو اللغوية .',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          Text(
            '- إظهار سلوك متكرر مثل تكرار كل كلمة يسمعونها أو تكرار إيماءة معينة بشكل متكرر .',
            style: Theme.of(context).textTheme.headline6?.copyWith(
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
          Center(
            child: Text(
              'ما الذي يسبب مرض التوحد عند الأطفال ؟',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'من الصعب تحديد أسباب مرض التوحد لدى الأطفال أو البالغين. ومع ذلك، هناك العديد من عوامل الخطر التي يعتقد أنها تساهم في تطور الحالة.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            padding: EdgeInsetsDirectional.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff43474E)),
            child: Text(
              'و تُعد العوامل البيئية و الوراثية باعتبارها السبب الأكثر احتمالاً. كانت هناك أدلة قوية تربط مرض التوحد بالعوامل الوراثية، ولكن لم يتم تحديد جين محدد يسبب هذا الاضطراب. والاحتمالات هي أن العديد من الجينات المختلفة يمكن أن تسبب هذه الحالة.',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: colors.fontColor(), fontSize: 21),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'تظهر الأبحاث أن أدمغة الأطفال المصابين بالتوحد تبدو مختلفة قليلاً عن أدمغة الأطفال الذين لا يعانون من هذه الحالة. في السنوات الأولى، يبدو أن أدمغة الأطفال المصابين بالتوحد تنمو بشكل أسرع من أدمغة الأطفال الآخرين. ليس من الواضح ما الذي يسبب هذا النمو المتسارع، لكنه يؤثر على الطريقة التي يتصرف بها الدماغ.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'تاريخيًا، تم ربط اللقاحات بشكل خاطئ بتطور مرض التوحد لدى الأطفال. ومع ذلك، فقد تم إجراء عقود من الأبحاث لفضح هذه الفكرة. لا توجد لقاحات يمكن ربطها بالتوحد لدى الأطفال أو تعرضهم لخطر الإصابة بالحالة.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
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
          Center(
            child: Text(
              'كيف يتم علاج مرض التوحد عند الأطفال ؟',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'لا يوجد حاليا علاج لمرض التوحد. ومع ذلك، مع العلاج المناسب، يمكن إدارة أعراضه بشكل مناسب. يعتمد علاج اضطراب طيف التوحد عند الأطفال على شدة الأعراض التي يعانون منها. تتم مناقشة علاج اضطراب طيف التوحد عند الأطفال أدناه.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'الدواء',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'لا يوجد دواء معتمد خصيصًا من قبل إدارة الغذاء والدواء الأمريكية لعلاج مرض التوحد. ومع ذلك، يمكن وصف بعض الأدوية لعلاج أعراض أو حالات معينة قد تكون تطورت نتيجة لمرض التوحد.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'بعض العلاجات',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: colors.fontColor(), fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'يتم استخدام أشكال مختلفة من العلاجات لعلاج مرض التوحد عند الأطفال. يعتمد شكل العلاج المستخدم على الاحتياجات الفريدة للطفل. العلاجات التالية هي الأكثر شيوعا لعلاج مرض التوحد:',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'العلاج الوظيفي : يهدف العلاج الوظيفي إلى تزويد الأطفال المصابين بالتوحد بالمهارات اللازمة للعمل في حياتهم اليومية.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'تحليل السلوك التطبيقي : تظهر الأبحاث أن تحليل السلوك التطبيقي هو أحد أكثر أشكال العلاج فعالية للأطفال المصابين بالتوحد، سواء ظهرت عليهم أعراض خفيفة أو شديدة. إنه يزود الأطفال بمهارات التواصل والمهارات الاجتماعية لمساعدتهم على التفاعل مع الآخرين.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
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
          Center(
            child: Text(
              'نصائح للآباء والأمهات الذين لديهم أطفال مصابين بالتوحد',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: mainColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'فيما يلي بعض النصائح التي يمكنك استخدامها لمساعدة طفلك على إدارة حالته:',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'ابق على اطلاع بخطة علاج طفلك المصاب بالتوحد. يتضمن هذا عادةً مزيجًا من الأدوية والعلاج. مع خطة العلاج الصحيحة، يمكن لطفلك المصاب بالتوحد أن يعيش حياة صحية.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'انضم إلى مجموعات الدعم المحلية, و أيضا يمكن أن يكون التحدث مع الآباء الآخرين للأطفال المصابين بالتوحد والاستماع إليهم مفيدًا.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'ولا تنس أن تعتني بنفسك أيضًا. من السهل جدًا أن تصاب بالإرهاق أثناء محاولتك تلبية جميع احتياجات طفلك المصاب بالتوحد. ومع ذلك، إذا لم تكن في أفضل حالاتك، فلن تتمكن من منح طفلك الرعاية المناسبة.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'بحث عن العلامات المبكرة للحالة لدى أطفالك. إن إنجاب طفل واحد مصاب بالتوحد يعني أن الأطفال اللاحقين يكونون أكثر عرضة لخطر الولادة بهذه الحالة, و لهذا السبب عليك بالمبادرة لزيارة الطبيب المختص.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'قد تكون تربية طفل مصاب بالتوحد أمرًا صعبًا في بعض الأحيان. في حين أنه يمكن إدارة اضطراب طيف التوحد بالعلاج المناسب، إلا أنه لا يوجد علاج له. وهذا يعني أنها حالة تستمر مدى الحياة ويحتاج الأشخاص الذين يعانون منها باستمرار إلى إدارتها.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'بعض الفيديوهات',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: colors.fontColor(), fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'فيديوهات مفيده في جانب الحديث عن طيف التوحد بالعربية',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: colors.fontColor(), fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // Center(
          //   child: YoutubePlayer(controller: _youtubePlayerController!),
          // ),
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
