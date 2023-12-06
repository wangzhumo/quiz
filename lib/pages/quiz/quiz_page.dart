import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz/modules/theme/theme.dart';
import 'package:quiz/pages/quiz/quiz_state.dart';
import 'package:quiz/utils/size_extension.dart';

class QuizzesTab extends HookConsumerWidget {
  const QuizzesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    QuizNotifier notifier = ref.read(quizProvider.notifier);
    return Scaffold(
      backgroundColor: Theme.of(context).custom.backgroundColor,
      body: ListView.builder(itemBuilder: ((context, index) {
        return _buildQuizItem(context, index, ref, notifier);
      })),
    );
  }

  // https://err.com/code
  Widget _buildQuizItem(
      context, int index, WidgetRef ref, QuizNotifier notifier) {
    return Card(
        margin: EdgeInsets.only(top: 14.w, left: 18.w, right: 18.w),
        clipBehavior: Clip.hardEdge,
        child: GestureDetector(
          onTap: () => notifier.onTapItem(context,index),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: 'quiz-intro-image-$index',
                    child: CachedNetworkImage(
                      height: 200.w,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      imageUrl: 'https://z1.ax1x.com/2023/12/06/picA7kT.png',
                      errorWidget:
                          (BuildContext context, String url, Object error) {
                        return Image.asset(
                          'assets/images/img_quiz_cover.png',
                          fit: BoxFit.cover,
                        );
                      },
                      placeholder: (context, url) {
                        return Image.asset(
                          'assets/images/placeholder.png',
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.9, 0),
                    child: Container(
                      height: 26.w,
                      margin: EdgeInsets.only(top: 15.w),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).custom.btColor.withAlpha(150),
                          borderRadius: BorderRadius.circular(13.w)),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                            size: 14,
                            color: Theme.of(context).custom.textColor,
                          ),
                          label: Text(
                            '99',
                            style: TextStyle(
                                fontSize: 11,
                                color: Theme.of(context).custom.textColor),
                          )),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(14.w, 10.w, 14.w, 10.w),
                child: Text(
                  "Stake magpie for a chance to share 5,000 MGP",
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 16.w),
                child: Text(
                  "Stake magpie for a chance to share 5,000 MGP",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
              )
            ],
          ),
        ));
  }
}
