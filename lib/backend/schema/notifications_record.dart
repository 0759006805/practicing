import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "recipient" field.
  DocumentReference? _recipient;
  DocumentReference? get recipient => _recipient;
  bool hasRecipient() => _recipient != null;

  // "notificationType" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  bool hasNotificationType() => _notificationType != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _recipient = snapshotData['recipient'] as DocumentReference?;
    _notificationType = snapshotData['notificationType'] as String?;
    _message = snapshotData['message'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? id,
  DocumentReference? recipient,
  String? notificationType,
  String? message,
  DateTime? timestamp,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'recipient': recipient,
      'notificationType': notificationType,
      'message': message,
      'timestamp': timestamp,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.recipient == e2?.recipient &&
        e1?.notificationType == e2?.notificationType &&
        e1?.message == e2?.message &&
        e1?.timestamp == e2?.timestamp &&
        e1?.status == e2?.status;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.recipient,
        e?.notificationType,
        e?.message,
        e?.timestamp,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
