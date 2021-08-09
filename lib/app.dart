import 'package:quiz_app/questions.dart';


class AppBrain {
  int _questionsNumbers = 0;
  List<QuestionModel> _questionsGroup = [
    QuestionModel(
        question: "عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب؟",
        img: "images/image-1.jpg",
        answer: true),
    QuestionModel(
        question: "القطط هي حيوانات لاحمة؟",
        img: "images/image-2.jpg",
        answer: true),
    QuestionModel(
        question: "الصين موجودة في قارة افريقيا؟",
        img: "images/image-3.jpg",
        answer: false),
    QuestionModel(
        question: "الأرض مسطحة وليست كروية؟",
        img: "images/image-4.jpg",
        answer: false),
    QuestionModel(
        question: "يستطيع الأنسان البقاء على قيد الحياة بدون أكل اللحوم؟",
        img: "images/image-5.jpg",
        answer: true),
    QuestionModel(
        question: "السمش تدور حول الأرض والأرض تدور حول القمر؟",
        img: "images/image-6.jpg",
        answer: false),
    QuestionModel(
        question: "الحيوانات لا تشعر بالألم؟",
        img: "images/image-7.jpg",
        answer: false),
  ];

  void nextQuestion() {
    if (_questionsNumbers < _questionsGroup.length - 1) {
      _questionsNumbers++;
    }
  }

  String getQuestionText() {
    return _questionsGroup[_questionsNumbers].questionText;
  }

  String getQuestionImage() {
    return _questionsGroup[_questionsNumbers].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionsGroup[_questionsNumbers].questionAnswer;
  }

  bool isFinished() {
    if (_questionsNumbers >= _questionsGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset(){
    _questionsNumbers = 0;
  }
}
