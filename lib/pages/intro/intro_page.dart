import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz/modules/theme/theme.dart';
import 'package:quiz/pages/intro/intro_state.dart';
import 'package:quiz/utils/size_extension.dart';

class IntroPage extends HookConsumerWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(introProvider.notifier);
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'quiz-intro-image',
                  child: CachedNetworkImage(
                    height: 300.w,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    imageUrl: 'https://err.com/code',
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
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => notifier.onTapBack(context),
                    child: Container(
                      height: 30.w,
                      width: 30.w,
                      margin: EdgeInsets.only(left: 20.w, top: 50.w),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).custom.btColor.withAlpha(150),
                          borderRadius: BorderRadius.circular(15.w)),
                      child: Icon(
                        Icons.close_rounded,
                        size: 22,
                        color: Theme.of(context).custom.textColor,
                      ),
                    ),
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
      ),
    );
  }
}
