import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ScriptItemSkeleton extends StatelessWidget {
  const ScriptItemSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Shimmer.fromColors(
          baseColor: theme.colorScheme.surfaceBright,
          highlightColor: theme.colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      height: 18,
                      color: theme.colorScheme.onSurface,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 320,
                      height: 18,
                      color: theme.colorScheme.surfaceBright,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
