import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserSettingRecord extends FirestoreRecord {
  UserSettingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _value = snapshotData['value'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userSetting')
          : FirebaseFirestore.instance.collectionGroup('userSetting');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userSetting').doc(id);

  static Stream<UserSettingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserSettingRecord.fromSnapshot(s));

  static Future<UserSettingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserSettingRecord.fromSnapshot(s));

  static UserSettingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserSettingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserSettingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserSettingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserSettingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserSettingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserSettingRecordData({
  String? name,
  String? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserSettingRecordDocumentEquality implements Equality<UserSettingRecord> {
  const UserSettingRecordDocumentEquality();

  @override
  bool equals(UserSettingRecord? e1, UserSettingRecord? e2) {
    return e1?.name == e2?.name && e1?.value == e2?.value;
  }

  @override
  int hash(UserSettingRecord? e) =>
      const ListEquality().hash([e?.name, e?.value]);

  @override
  bool isValidKey(Object? o) => o is UserSettingRecord;
}
