import 'package:flutter/material.dart';

class NumberSlider extends StatelessWidget {
  const NumberSlider({
    super.key,
    required this.value,
    required this.onChange,
    this.min = 0,
    this.max = 1,
    this.title,
  });

  final double value;
  final void Function(double) onChange;
  final double? min;
  final double? max;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.colorScheme.onSurface),
            textAlign: TextAlign.start,
          ),
        Row(
          children: [
            Expanded(
              child: Transform.translate(
                offset: const Offset(-24, 0),
                child: Slider(
                  value: value,
                  min: min!,
                  max: max!,
                  divisions: (max! - min!).toInt(),
                  label: value.round().toString(),
                  onChanged: (double newValue) {
                    onChange(newValue);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(value.round().toString()),
            )
          ],
        ),
      ],
    );
  }
}
