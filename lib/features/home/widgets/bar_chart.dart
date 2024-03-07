import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class BarChart extends StatefulWidget {
  const BarChart({
    super.key,
    required this.values,
    this.selectedBar = 0,
    this.labels = const [],
  });

  final int selectedBar;
  final List<num> values;
  final List<String> labels;

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  late int selectedIndex = widget.selectedBar;
  late List<num> values = widget.values;

  @override
  Widget build(BuildContext context) {
    var peakValue = maxBarValue();
    peakValue = peakValue == 0 ? 1 : peakValue;

    final colorScheme = Theme.of(context).colorScheme;
    final valueStyle = Theme.of(context).textTheme.titleSmall?.copyWith(color: colorScheme.onPrimary);
    final showValue = values.length <= 15;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        values.length,
        (i) {
          final height = values[i] / peakValue;
          final isSelected = selectedIndex == i;

          return Expanded(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: AnimatedFractionallySizedBox(
                      key: ValueKey(i),
                      widthFactor: 1,
                      heightFactor: height,
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(milliseconds: 500),
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        child: AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(milliseconds: 1000),
                          color: isSelected ? colorScheme.primary : colorScheme.primaryContainer,
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              onTap: () => setState(() => selectedIndex = i),
                              child: showValue && isSelected
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 3.sp),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          values[i].toString(),
                                          style: valueStyle,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppSizes.tinyY,
                  if (widget.labels.isNotEmpty)
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.labels[i].toString(),
                        textAlign: TextAlign.center,
                        style: valueStyle?.copyWith(
                          color: isSelected ? colorScheme.primary : colorScheme.onBackground,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  num maxBarValue() {
    num maxValue = widget.values.first;
    for (final val in widget.values) {
      if (val > maxValue) maxValue = val;
    }
    return maxValue;
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(animateBars);
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedIndex = widget.selectedBar;
    animateBars();
  }

  void animateBars() async {
    final newLengthDiff = widget.values.length - values.length;
    if (newLengthDiff.isNegative) {
      values = values.sublist(0, widget.values.length);
    } else if (newLengthDiff > 0) {
      values = [
        ...values,
        ...List.filled(newLengthDiff, 0),
      ];
    }

    int i = 0;
    for (final x in widget.values) {
      if (values[i] != x) {
        await Future.delayed(const Duration(milliseconds: 5));
        setState(() => values[i] = x);
      }
      i++;
    }
  }
}
