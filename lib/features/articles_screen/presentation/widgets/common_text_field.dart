import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';

class FindArticlesTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const FindArticlesTextField({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 320,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: 'Поиск статей',
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
      ),
    );
  }
}
