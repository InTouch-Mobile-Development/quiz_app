class QuestionModel{
  String questionText;
  String questionImage;
  bool questionAnswer;

  QuestionModel({String question, String img, bool answer}){
    questionText = question;
    questionImage = img;
    questionAnswer = answer;
  }


}