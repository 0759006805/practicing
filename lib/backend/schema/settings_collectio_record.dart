import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SettingsCollectioRecord extends FirestoreRecord {
  SettingsCollectioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SettingsCollectio');

  static Stream<SettingsCollectioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SettingsCollectioRecord.fromSnapshot(s));

  static Future<SettingsCollectioRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SettingsCollectioRecord.fromSnapshot(s));

  static SettingsCollectioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SettingsCollectioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SettingsCollectioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SettingsCollectioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SettingsCollectioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SettingsCollectioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSettingsCollectioRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class SettingsCollectioRecordDocumentEquality
    implements Equality<SettingsCollectioRecord> {
  const SettingsCollectioRecordDocumentEquality();

  @override
  bool equals(SettingsCollectioRecord? e1, SettingsCollectioRecord? e2) {
    return e1?.user == e2?.user;
  }

  @override
  int hash(SettingsCollectioRecord? e) => const ListEquality().hash([e?.user]);

  @override
  bool isValidKey(Object? o) => o is SettingsCollectioRecord;
}
