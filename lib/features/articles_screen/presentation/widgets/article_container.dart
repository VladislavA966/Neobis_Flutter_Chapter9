
import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_images/app_images.dart';

class ArticleContainer extends StatelessWidget {
  final Function() onTap;
  final String title;
  final int timeToRead;

  const ArticleContainer({
    super.key,
    required this.onTap,
    required this.title,
    required this.timeToRead,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black,
          ),
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: AppFonts.s18w800.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '#История ',
                          style: AppFonts.s12w600.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        const WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.0),
                            child: Text(
                              '●',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: '$timeToRead minutes',
                          style: AppFonts.s12w600.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(AppImages.napoleonImage),
            ],
          ),
        ),
      ),
    );
  }
}