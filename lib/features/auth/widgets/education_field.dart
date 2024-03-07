import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../entities/education.dart';
import '../entities/enums/education_level.dart';
import 'app_date_picker_field.dart';
import 'app_drop_down_field.dart';
import 'app_text_field.dart';

class EducationField extends StatelessWidget {
  const EducationField({
    super.key,
    required this.education,
    required this.onChanged,
  });

  final Education education;
  final void Function(Education) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextField.name(
          label: 'Institution',
          hint: 'Enter the name of institution',
          listenChanges: true,
          initialValue: education.institute,
          onSubmit: (x) => onChanged(
            education.copyWith(institute: x),
          ),
        ),
        AppSizes.normalY,
        AppTextField.name(
          label: 'Degree',
          hint: 'Enter your qualifications name',
          listenChanges: true,
          initialValue: education.position,
          onSubmit: (x) => onChanged(
            education.copyWith(position: x),
          ),
        ),
        AppSizes.normalY,
        AppDropDownField(
          label: 'Level',
          initial: education.level.value,
          values: EducationLevel.values,
          onSelected: (x) => onChanged(
            education.copyWith(level: x),
          ),
        ),
        AppSizes.normalY,
        AppDatePickerField(
          label: 'Start Year',
          initial: education.startDate.year == 0 ? null : education.startDate,
          onChanged: (x) => onChanged(
            education.copyWith(startDate: x),
          ),
        ),
        AppSizes.normalY,
        AppDatePickerField(
          label: 'End Year',
          enabled: education.endDate != null,
          initial: education.endDate?.year == 0 ? null : education.endDate,
          onChanged: (x) => onChanged(
            education.copyWith(endDate: x),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () => onChanged(
              education.copyWith(endDate: education.endDate == null ? DateTime(0) : null),
            ),
            child: education.endDate == null ? const Text('Has Ended') : const Text('Ongoing'),
          ),
        ),
      ],
    );
  }
}
