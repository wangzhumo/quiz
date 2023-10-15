import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz/generated/l10n.dart';

class DiscoverTab extends HookConsumerWidget {
  const DiscoverTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: HookConsumer(
          builder: (context, ref, _) {
            return Text(L.of(context).tab_discover);
          },
        ),
      ),
    );
  }
}
