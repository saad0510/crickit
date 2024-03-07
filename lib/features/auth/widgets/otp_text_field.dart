import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/sizer.dart';

class OtpTextField extends StatefulWidget {
  const OtpTextField({
    super.key,
    required this.length,
    required this.onChanged,
  });

  final int length;
  final void Function(String code) onChanged;

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  late final codes = List.filled(widget.length, '');

  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (i) => SizedBox(
          width: 50.w,
          child: TextField(
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onTapOutside: (_) => focus.unfocus(),
            onChanged: (x) {
              codes[i] = x;
              if (x.isEmpty) {
                focus.previousFocus();
                return;
              }
              final otp = codes.join();
              widget.onChanged(otp);

              if (otp.length == widget.length) {
                focus.unfocus();
                return;
              }
              focus.nextFocus();
            },
          ),
        ),
      ),
    );
  }
}
