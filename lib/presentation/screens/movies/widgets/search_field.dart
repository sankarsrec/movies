import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/size_constants.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const SearchField({
    super.key,
    required this.controller,
    this.labelText = '',
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.dimen_10,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.dimen_10),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: Sizes.dimen_1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.dimen_10),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: Sizes.dimen_2,
            ),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
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
            },
          ),
        ),
      ),
    );
  }
}
