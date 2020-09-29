import 'package:cloud_firestore/cloud_firestore.dart';

class Answer {
  final int id;
  final String answer;

  Answer({this.id = 0, this.answer = "Nee"});

  factory Answer.fromSnap(QuerySnapshot snap) {
    QueryDocumentSnapshot doc = snap.docs.first;
    return Answer.fromDoc(doc);
  }

  factory Answer.fromDoc(DocumentSnapshot doc) {
    return Answer(id: doc.data()['id'], answer: doc.data()['answer']);
  }
}
