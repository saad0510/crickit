import 'package:flutter/material.dart';

import '../../../../core/utils/form_validations.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.initialValue,
    this.prefix,
    this.suffix,
    this.info,
    this.sideInfo,
    this.enabled = true,
    this.maxLines,
    this.obscure = false,
    this.listenChanges = false,
    this.validator,
    this.keyboardType = TextInputType.name,
    this.textCapitalization = TextCapitalization.none,
  });

  const AppTextField.name({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.enabled = true,
    this.initialValue,
    this.suffix,
    this.info,
    this.sideInfo,
    this.listenChanges = false,
  })  : maxLines = null,
        prefix = null,
        obscure = false,
        validator = FormValidations.longInput,
        keyboardType = TextInputType.name,
        textCapitalization = TextCapitalization.words;

  const AppTextField.email({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.enabled = true,
    this.initialValue,
    this.suffix,
    this.info,
    this.sideInfo,
    this.listenChanges = false,
  })  : maxLines = null,
        prefix = null,
        obscure = false,
        validator = FormValidations.email,
        keyboardType = TextInputType.emailAddress,
        textCapitalization = TextCapitalization.none;

  const AppTextField.password({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.enabled = true,
    this.initialValue,
    this.suffix,
    this.info,
    this.sideInfo,
    this.listenChanges = false,
    this.validator = FormValidations.password,
  })  : maxLines = 1,
        prefix = null,
        obscure = true,
        keyboardType = TextInputType.visiblePassword,
        textCapitalization = TextCapitalization.words;

  const AppTextField.number({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.enabled = true,
    this.initialValue,
    this.suffix,
    this.info,
    this.sideInfo,
    this.listenChanges = false,
  })  : maxLines = null,
        prefix = null,
        obscure = false,
        validator = FormValidations.number,
        keyboardType = TextInputType.number,
        textCapitalization = TextCapitalization.none;

  const AppTextField.integer({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.enabled = true,
    this.initialValue,
    this.suffix,
    this.info,
    this.sideInfo,
    this.listenChanges = false,
  })  : maxLines = null,
        prefix = null,
        obscure = false,
        validator = FormValidations.integer,
        keyboardType = TextInputType.number,
        textCapitalization = TextCapitalization.none;

  final String label;
  final String hint;
  final bool enabled;
  final String? initialValue;
  final String? prefix;
  final String? suffix;
  final String? info;
  final String? sideInfo;
  final void Function(String) onSubmit;
  final int? maxLines;
  final bool obscure;
  final bool listenChanges;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool hideText = widget.obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      obscureText: hideText,
      maxLines: widget.maxLines,
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      onChanged: widget.listenChanges ? widget.onSubmit : null,
      validator: widget.validator,
      onSaved: (x) => widget.onSubmit(x?.trim() ?? ''),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onEditingComplete: () => FocusManager.instance.primaryFocus?.nextFocus(),
      decoration: InputDecoration(
        labelText: widget.label.isEmpty ? null : widget.label,
        hintText: widget.hint,
        suffixIcon: togglePasswordWidget,
        prefixText: widget.prefix != null ? '${widget.prefix}  ' : null,
        suffixText: widget.suffix,
        helperText: widget.info,
        counterText: widget.sideInfo,
      ),
    );
  }

  Widget? get togglePasswordWidget {
    if (widget.obscure == false) return null;
    return ExcludeFocus(
      child: TextButton(
        onPressed: () => setState(() => hideText = !hideText),
        child: hideText ? const Text('Show') : const Text('Hide'),
      ),
    );
  }
}
