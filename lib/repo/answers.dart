import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naar_de_kfc_of_niet/models/answer.dart';
import 'package:naar_de_kfc_of_niet/models/current_setting.dart';

class Answers {
  static Stream<CurrentSetting> getCurrentSetting() {
    return FirebaseFirestore.instance
        .doc('current/setting')
        .snapshots()
        .map((DocumentSnapshot doc) => CurrentSetting.fromDoc(doc));
  }

  static Stream<Answer> getCurrentAnswer(CurrentSetting setting) {
    return FirebaseFirestore.instance
        .collection('answers')
        .where('id', isEqualTo: setting.id)
        .snapshots()
        .map((QuerySnapshot snap) => Answer.fromSnap(snap));
  }

  static Future<void> changeAnswer(CurrentSetting setting) async {
    var rng = Random();
    int newAnswerID = rng.nextInt(setting.total);
    return await FirebaseFirestore.instance.doc('current/setting').set({
      'id': newAnswerID,
    }, SetOptions(merge: true));
  }
}
