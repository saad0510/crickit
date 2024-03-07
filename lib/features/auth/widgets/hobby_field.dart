import 'package:flutter/material.dart';

import '../../../core/utils/form_validations.dart';

class HobbyField extends StatelessWidget {
  const HobbyField({
    super.key,
    this.initial,
    required this.onChanged,
  });

  final String? initial;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: FormValidations.longInput,
      initialValue: initial,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onEditingComplete: () => FocusManager.instance.primaryFocus?.nextFocus(),
      decoration: InputDecoration(
        hintText: 'Briefly enter your hobby',
        suffixIcon: ExcludeFocus(
          child: IconButton(
            onPressed: () => onChanged(null),
            iconSize: 30,
            style: IconButton.styleFrom(foregroundColor: Colors.red),
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
