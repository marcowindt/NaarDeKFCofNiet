import 'package:flutter/material.dart';
import 'package:naar_de_kfc_of_niet/models/answer.dart';
import 'package:naar_de_kfc_of_niet/models/current_setting.dart';
import 'package:naar_de_kfc_of_niet/repo/answers.dart';

class CurrentAnswer extends StatelessWidget {
  final CurrentSetting setting;
  CurrentAnswer(this.setting);

  @override
  Widget build(BuildContext context) {
    if (setting == null) {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
      );
    }
    return StreamBuilder(
      stream: Answers.getCurrentAnswer(setting),
      builder: (BuildContext context, AsyncSnapshot<Answer> answerSnap) {
        if (!answerSnap.hasData || answerSnap.hasError) {
          return CircularProgressIndicator(
            backgroundColor: Colors.white,
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: Text(
              '${answerSnap.data.answer}',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}
