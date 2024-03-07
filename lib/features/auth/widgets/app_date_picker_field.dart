import 'package:flutter/material.dart';

import '../../../core/extensions/datetime_ext.dart';
import '../../../core/utils/form_validations.dart';

class AppDatePickerField extends StatefulWidget {
  const AppDatePickerField({
    super.key,
    this.initial,
    this.maxDate,
    this.enabled = true,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final bool enabled;
  final DateTime? initial;
  final DateTime? maxDate;
  final void Function(DateTime date) onChanged;

  @override
  State<AppDatePickerField> createState() => _AppDatePickerFieldState();
}

class _AppDatePickerFieldState extends State<AppDatePickerField> {
  late final textController = TextEditingController(
    text: widget.initial?.dateFormatedLong,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !widget.enabled
          ? null
          : () async {
              final selected = await showDatePicker(
                context: context,
                initialDate: widget.initial ?? DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: widget.maxDate ?? DateTime(2100),
              );
              if (selected == null) return;
              textController.text = selected.dateFormatedLong;
              widget.onChanged(selected);
            },
      child: Opacity(
        opacity: widget.enabled ? 1 : 0.5,
        child: AbsorbPointer(
          absorbing: true,
          child: ExcludeFocus(
            child: widget.enabled
                ? TextFormField(
                    readOnly: true,
                    controller: textController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormValidations.required,
                    decoration: InputDecoration(labelText: widget.label),
                  )
                : TextField(
                    readOnly: true,
                    decoration: InputDecoration(labelText: widget.label),
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
