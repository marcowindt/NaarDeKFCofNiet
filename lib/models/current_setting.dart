import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentSetting {
  final int id;
  final int total;

  CurrentSetting({
    this.id = 0,
    this.total = 1,
  });

  factory CurrentSetting.fromDoc(DocumentSnapshot doc) {
    return CurrentSetting(id: doc.data()['id'], total: doc.data()['total']);
  }
}
