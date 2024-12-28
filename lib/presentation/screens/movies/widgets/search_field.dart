import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/size_constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    this.labelText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onCanceled,
  });

  final TextEditingController controller;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onCanceled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.dimen_10,
        horizontal: Sizes.dimen_20,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.dimen_10),
            borderSide: const BorderSide(
              color: AppColors.white,
              width: Sizes.dimen_1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.dimen_10),
            borderSide: BorderSide(
              color: AppColors.white,
              width: Sizes.dimen_2,
            ),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.white,
          ),
          isDense: true,
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.cancel,
            ),
            color: AppColors.grey,
            onPressed: () {
              controller.clear();
              if (onCanceled != null) {
                onCanceled!();
              }
            },
          ),
        ),
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
      ),
    );
  }
}
