import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/domain/entity/user_quize_entity.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/presentation/bloc/user_quize_bloc.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/presentation/screens/finished_quiz_screen.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/widgets/quize_button.dart';

class QuizeScreen extends StatefulWidget {
  final int id;
  const QuizeScreen({
    super.key,
    required this.id,
  });

  @override
  State<QuizeScreen> createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen> {
  int? selectedAnswerIndex;
  bool? isAnswerCorrect;
  int currentIndex = 0;
  bool answerChosen = false;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserQuizeBloc>(context).add(
      GetAllAnswersEvent(
        id: widget.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildQuizContent(),
      ),
    );
  }

  Widget buildQuizContent() {
    return BlocBuilder<UserQuizeBloc, UserQuizeState>(
      builder: (context, state) {
        if (state is UserQuizeLoaded) {
          var answers = state.model.entityList[currentIndex].answer;
          void checkAnswer(int index, List<AnswerEntity> answers) {
            if (!answerChosen) {
              setState(() {
                selectedAnswerIndex = index;
                isAnswerCorrect = answers[index].isRight;
                answerChosen = true;
              });
              if (isAnswerCorrect!) {
                counter++;
              }
            }
          }

          List<Widget> answerWidgets = [];
          for (var i = 0; i < answers!.length; i++) {
            Color buttonColor = Colors.white;
            if (selectedAnswerIndex == i) {
              buttonColor = isAnswerCorrect == true ? Colors.green : Colors.red;
            } else if (isAnswerCorrect != null &&
                !isAnswerCorrect! &&
                answers[i].isRight) {
              buttonColor = Colors.green;
            }

            answerWidgets.add(
              QuizeQuestionButton(
                color: buttonColor,
                title: answers[i].answerText,
                onTap: () => checkAnswer(i, answers),
              ),
            );
            answerWidgets.add(const SizedBox(height: 12));
          }

          return Column(
            children: [
              Text(
                'Вопрос ${currentIndex + 1}. ${state.model.entityList[currentIndex].title}',
                style: AppFonts.s18w800.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 8),
              ...answerWidgets,
              const Spacer(),
              QuizElevatedButton(
                title: 'Следующий вопрос',
                onPressed: () {
                  if (currentIndex < state.model.entityList.length - 1) {
                    setState(() {
                      currentIndex++;
                      selectedAnswerIndex = null;
                      isAnswerCorrect = null;
                      answerChosen = false;
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FiinishedQuizScreen(
                          totalScore: counter,
                          totalQuestions: state.model.entityList.first.quiz
                                  ?.totalQuestions ??
                              0,
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
            ],
          );
        } else if (state is UserQuizeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserQuizeError) {
          return Center(
            child: Text(state.errorText),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class QuizeQuestionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;

  const QuizeQuestionButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.black),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
