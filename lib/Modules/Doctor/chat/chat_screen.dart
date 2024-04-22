// ignore_for_file: deprecated_member_use, camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autism/Modules/Doctor/chat_details/chat_details_doc_screen.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class Chat_Doctors_Screen extends StatelessWidget {
  const Chat_Doctors_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
        child: ListView.separated(
          itemBuilder: ((context, index) => buildChatItems(context)),
          separatorBuilder: ((context, index) => SizedBox(
                height: 10,
              )),
          itemCount: 10,
        ),
      ),
    );
  }

  Widget buildChatItems(BuildContext context) => InkWell(
        onTap: () {
          navTo(context, Chat_Doctor_Details_Screen());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff292A2D),
              borderRadius: BorderRadiusDirectional.circular(30),
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
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/Rectangle (2).png',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'د. أميرة',
                        style: onBoardingDesc,
                      ),
                      Spacer(),
                      const Text(
                        '٥:٠٠ م',
                        style:
                            TextStyle(color: Color(0xffE1E2E9), fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ أَبْجَدْ هَوَّزْ ',
                        style:
                            TextStyle(color: Color(0xffE1E2E9), fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffA8C8FF)),
                          child: const Center(
                            child: Text(
                              '٢',
                              style: TextStyle(
                                  color: Color(0xff05305F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
