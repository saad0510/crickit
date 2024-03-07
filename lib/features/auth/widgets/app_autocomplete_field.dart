import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../../core/utils/form_validations.dart';

class AppAutocompleteField<T extends Object> extends StatefulWidget {
  const AppAutocompleteField({
    super.key,
    this.label,
    this.hint,
    this.initial,
    required this.values,
    required this.onSelected,
  });

  final String? label, hint;
  final T? initial;
  final List<T> values;
  final void Function(T) onSelected;

  @override
  State<AppAutocompleteField<T>> createState() => _AppAutocompleteFieldState<T>();
}

class _AppAutocompleteFieldState<T extends Object> extends State<AppAutocompleteField<T>> {
  late bool selected = widget.initial?.toString().isNotEmpty ?? false;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      optionsMaxHeight: 200.h,
      onSelected: (x) {
        selected = true;
        widget.onSelected(x);
      },
      initialValue: TextEditingValue(text: widget.initial?.toString() ?? ''),
      optionsBuilder: (text) {
        if (text.text.isEmpty) return <T>[];
        return widget.values.where(
          (e) => e.toString().toLowerCase().contains(text.text.toLowerCase()),
        );
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return TextFormField(
          focusNode: focusNode,
          controller: controller,
          validator: (x) {
            if (!selected) return 'Select an option from List';
            return FormValidations.required(x);
          },
          onSaved: (x) => onFieldSubmitted(),
          onEditingComplete: () => onFieldSubmitted(),
          onFieldSubmitted: (c) => onFieldSubmitted(),
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(labelText: widget.label, hintText: widget.hint),
        );
      },
    );
  }
}
