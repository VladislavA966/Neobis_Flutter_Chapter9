import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_images/app_images.dart';

class FilterButton extends StatelessWidget {
  final Function() onTap;
  const FilterButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Image.asset(
            AppImages.filterIcon,
          ),
        ),
      ),
    );
  }
}
