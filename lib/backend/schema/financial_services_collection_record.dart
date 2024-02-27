import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FinancialServicesCollectionRecord extends FirestoreRecord {
  FinancialServicesCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "eligibilityCriteria" field.
  String? _eligibilityCriteria;
  String get eligibilityCriteria => _eligibilityCriteria ?? '';
  bool hasEligibilityCriteria() => _eligibilityCriteria != null;

  // "interestRates" field.
  double? _interestRates;
  double get interestRates => _interestRates ?? 0.0;
  bool hasInterestRates() => _interestRates != null;

  // "termsAndConditions" field.
  String? _termsAndConditions;
  String get termsAndConditions => _termsAndConditions ?? '';
  bool hasTermsAndConditions() => _termsAndConditions != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _eligibilityCriteria = snapshotData['eligibilityCriteria'] as String?;
    _interestRates = castToType<double>(snapshotData['interestRates']);
    _termsAndConditions = snapshotData['termsAndConditions'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FinancialServicesCollection');

  static Stream<FinancialServicesCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => FinancialServicesCollectionRecord.fromSnapshot(s));

  static Future<FinancialServicesCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FinancialServicesCollectionRecord.fromSnapshot(s));

  static FinancialServicesCollectionRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      FinancialServicesCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FinancialServicesCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FinancialServicesCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FinancialServicesCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FinancialServicesCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFinancialServicesCollectionRecordData({
  String? id,
  String? name,
  String? description,
  String? eligibilityCriteria,
  double? interestRates,
  String? termsAndConditions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'eligibilityCriteria': eligibilityCriteria,
      'interestRates': interestRates,
      'termsAndConditions': termsAndConditions,
    }.withoutNulls,
  );

  return firestoreData;
}

class FinancialServicesCollectionRecordDocumentEquality
    implements Equality<FinancialServicesCollectionRecord> {
  const FinancialServicesCollectionRecordDocumentEquality();

  @override
  bool equals(FinancialServicesCollectionRecord? e1,
      FinancialServicesCollectionRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.eligibilityCriteria == e2?.eligibilityCriteria &&
        e1?.interestRates == e2?.interestRates &&
        e1?.termsAndConditions == e2?.termsAndConditions;
  }

  @override
  int hash(FinancialServicesCollectionRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.description,
        e?.eligibilityCriteria,
        e?.interestRates,
        e?.termsAndConditions
      ]);

  @override
  bool isValidKey(Object? o) => o is FinancialServicesCollectionRecord;
}
