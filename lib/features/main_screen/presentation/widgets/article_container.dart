import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';

class ArticlesContainer extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? onTap;
  final String categoty;
  final Color color;

  const ArticlesContainer({
    super.key,
    required this.onTap,
    required this.title,
    required this.image,
    required this.categoty, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 8),
              child: SizedBox(
                height: 234,
                width: 265,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppFonts.s18w800.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      '#$categoty',
                      style: AppFonts.s12w800.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
