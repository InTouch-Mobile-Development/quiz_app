import 'package:flutter/material.dart';
import 'package:quiz_app/app.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("اختبار قصير"),
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> answersIcons = [];
  int rightAnswers = 0;
  Widget answerResults(bool T) {
    Icon iconDraw;
    if (T) {
      iconDraw = Icon(
        Icons.thumb_up,
        color: Colors.green,
      );
    } else {
      iconDraw = Icon(
        Icons.thumb_down,
        color: Colors.red,
      );
    }

    return Padding(padding: const EdgeInsets.all(4.0), child: iconDraw);
  }

  void checkAnswer(bool answerByUser) {
    bool correctAnswer = appBrain.getQuestionAnswer();
    setState(() {
      if (answerByUser == correctAnswer) {
        rightAnswers++;
        print(true);
        answersIcons.add(answerResults(true));
      } else {
        print(false);
        answersIcons.add(answerResults(false));
      }
      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "إنتهاء الأسئلة",
          desc: "لقد أجبت على $rightAnswers أسئلة صحيحة من أصل 7",
          buttons: [
            DialogButton(
              child: Text(
                "إبدء من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        answersIcons = [];
        rightAnswers = 0;
      } else {
        appBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: answersIcons,
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Image.asset(appBrain.getQuestionImage()),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  appBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blueAccent,
                  onSurface: Colors.lightBlue,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
                child: Text("صح"),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.redAccent,
                  onSurface: Colors.red,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
                child: Text("خطأ"),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
