import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/widgets/quize_button.dart';

class ArticlesFilterScreen extends StatefulWidget {
  const ArticlesFilterScreen({super.key});

  @override
  State<ArticlesFilterScreen> createState() => _ArticlesFilterScreenState();
}

class _ArticlesFilterScreenState extends State<ArticlesFilterScreen> {
  final List<bool> isSelected = List.generate(10, (_) => false);
  final List<String> categories = [
    'Философия',
    'История',
    'География',
    'Информатика',
    'Литература',
    'Психология',
    'Экономика',
    'Кинематограф',
    'Олимпиада',
    'Apple'
  ];

  Widget _buildCheckbox(int index, String label) {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.black,
          value: isSelected[index],
          onChanged: (bool? value) {
            setState(() {
              isSelected[index] = value ?? false;
            });
          },
        ),
        const SizedBox(width: 16),
        Text(
          label,
          style: AppFonts.s16w500.copyWith(color: AppColors.black),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Фильтр',
              style: AppFonts.s24w800.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 48),
            Text(
              'Категория',
              style: AppFonts.s16w700.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 24),
            ...List.generate(categories.length,
                (index) => _buildCheckbox(index, categories[index])),
            TextButton(
              onPressed: () {
                setState(() {
                  isSelected.setAll(
                      0, List.generate(isSelected.length, (_) => false));
                });
              },
              child: Text(
                'Сбросить все фильтры',
                style: AppFonts.s16w700.copyWith(color: AppColors.black),
              ),
            ),
            QuizElevatedButton(
              onPressed: () {
                List<int> selectedCategories = [];
                for (int i = 0; i < isSelected.length; i++) {
                  if (isSelected[i]) {
                    selectedCategories.add(i + 1);
                  }
                }
                Navigator.pop(context, selectedCategories);
               
              },
              title: 'Применить',
            ),
          ],
        ),
      ),
    );
  }
}
