import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
//Не законченный экран
//Не отредактирован
class ArticlesFilterScreen extends StatefulWidget {
  const ArticlesFilterScreen({super.key});

  @override
  State<ArticlesFilterScreen> createState() => _ArticlesFilterScreenState();
}

class _ArticlesFilterScreenState extends State<ArticlesFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Фильтр',
              style: AppFonts.s24w800.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Text(
              'Категория',
              style: AppFonts.s16w700.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.black,
                  value: true,
                  onChanged: (bool? value) {
                    setState(() {
                      
                    });
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'История',
                  style: AppFonts.s16w500.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
