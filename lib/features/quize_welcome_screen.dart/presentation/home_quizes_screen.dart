import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_images/app_images.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/presentation/screens/quize_screen.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/presentation/bloc/concrete_quize_bloc.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/widgets/quize_button.dart';

class HomeQuizeScreen extends StatefulWidget {
  final int? id;
  const HomeQuizeScreen({super.key, required this.id});

  @override
  State<HomeQuizeScreen> createState() => _HomeQuizeScreenState();
}

class _HomeQuizeScreenState extends State<HomeQuizeScreen> {
  @override
  void initState() {
    BlocProvider.of<ConcreteQuizeBloc>(context).add(
      GetConcreteQuizeEvent(id: widget.id ?? 0),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: BlocBuilder<ConcreteQuizeBloc, ConcreteQuizeState>(
            builder: (context, state) {
              if (state is ConcreteQuizeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ConcreteQuizeLoaded) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const SizedBox(height: 11),
                      _buildQuizTitle(state),
                      _buildQuizImage(state),
                      const SizedBox(height: 32),
                      _buildQuizDescription(state),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildStartQuizButton(state),
                    ],
                  ),
                );
              } else if (state is ConcreteQuizeError) {
                return Center(child: Text(state.errorText));
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuizTitle(ConcreteQuizeLoaded state) {
    return Stack(
      children: [
        Image.asset(AppImages.bgTitleImage),
        Text(
          state.model.title,
          style: AppFonts.s32w700.copyWith(color: AppColors.black),
        ),
      ],
    );
  }

  Widget _buildQuizImage(ConcreteQuizeLoaded state) {
    return Image.network(
      state.model.quizCover,
      height: 300,
      width: 300,
    );
  }

  Widget _buildQuizDescription(ConcreteQuizeLoaded state) {
    return Text(
      state.model.welcomePage,
      textAlign: TextAlign.center,
      style: AppFonts.s16w500.copyWith(color: AppColors.black),
    );
  }

  Widget _buildStartQuizButton(ConcreteQuizeLoaded state) {
    return QuizElevatedButton(
      title: 'Начать квиз',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizeScreen(id: state.model.id),
          ),
        );
      },
    );
  }
}
