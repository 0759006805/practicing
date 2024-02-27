import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ApplicationsRecord extends FirestoreRecord {
  ApplicationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "applicationID" field.
  String? _applicationID;
  String get applicationID => _applicationID ?? '';
  bool hasApplicationID() => _applicationID != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "service" field.
  DocumentReference? _service;
  DocumentReference? get service => _service;
  bool hasService() => _service != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "appliedOn" field.
  DateTime? _appliedOn;
  DateTime? get appliedOn => _appliedOn;
  bool hasAppliedOn() => _appliedOn != null;

  void _initializeFields() {
    _applicationID = snapshotData['applicationID'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _service = snapshotData['service'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _appliedOn = snapshotData['appliedOn'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Applications');

  static Stream<ApplicationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApplicationsRecord.fromSnapshot(s));

  static Future<ApplicationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ApplicationsRecord.fromSnapshot(s));

  static ApplicationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ApplicationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApplicationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApplicationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApplicationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApplicationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApplicationsRecordData({
  String? applicationID,
  DocumentReference? user,
  DocumentReference? service,
  String? status,
  DateTime? appliedOn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'applicationID': applicationID,
      'user': user,
      'service': service,
      'status': status,
      'appliedOn': appliedOn,
    }.withoutNulls,
  );

  return firestoreData;
}

class ApplicationsRecordDocumentEquality
    implements Equality<ApplicationsRecord> {
  const ApplicationsRecordDocumentEquality();

  @override
  bool equals(ApplicationsRecord? e1, ApplicationsRecord? e2) {
    return e1?.applicationID == e2?.applicationID &&
        e1?.user == e2?.user &&
        e1?.service == e2?.service &&
        e1?.status == e2?.status &&
        e1?.appliedOn == e2?.appliedOn;
  }

  @override
  int hash(ApplicationsRecord? e) => const ListEquality()
      .hash([e?.applicationID, e?.user, e?.service, e?.status, e?.appliedOn]);

  @override
  bool isValidKey(Object? o) => o is ApplicationsRecord;
}
