import 'package:flutter/material.dart';

class AppDropDownField<T> extends StatelessWidget {
  const AppDropDownField({
    super.key,
    this.label,
    this.initial,
    this.enabled = true,
    required this.values,
    required this.onSelected,
  });

  final String? label;
  final T? initial;
  final bool enabled;
  final List<T> values;
  final void Function(T) onSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isDense: true,
      decoration: InputDecoration(labelText: label),
      style: Theme.of(context).textTheme.bodyLarge,
      dropdownColor: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      icon: const Icon(Icons.keyboard_arrow_down),
      value: initial,
      validator: (x) => x == null ? 'Select an option from list' : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: enabled
          ? (value) {
              if (value == null) return;
              onSelected(value);
            }
          : null,
      items: List.generate(
        values.length,
        (i) => DropdownMenuItem<T>(
          key: ValueKey(values[i]),
          value: values[i],
          child: Text(values[i].toString()),
        ),
      ),
    );
  }
}
