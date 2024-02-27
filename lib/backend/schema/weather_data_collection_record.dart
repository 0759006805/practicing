import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeatherDataCollectionRecord extends FirestoreRecord {
  WeatherDataCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.0;
  bool hasTemperature() => _temperature != null;

  // "humidity" field.
  double? _humidity;
  double get humidity => _humidity ?? 0.0;
  bool hasHumidity() => _humidity != null;

  // "precipitation" field.
  double? _precipitation;
  double get precipitation => _precipitation ?? 0.0;
  bool hasPrecipitation() => _precipitation != null;

  // "windSpeed" field.
  double? _windSpeed;
  double get windSpeed => _windSpeed ?? 0.0;
  bool hasWindSpeed() => _windSpeed != null;

  // "weatherConditions" field.
  String? _weatherConditions;
  String get weatherConditions => _weatherConditions ?? '';
  bool hasWeatherConditions() => _weatherConditions != null;

  void _initializeFields() {
    _location = snapshotData['location'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _temperature = castToType<double>(snapshotData['temperature']);
    _humidity = castToType<double>(snapshotData['humidity']);
    _precipitation = castToType<double>(snapshotData['precipitation']);
    _windSpeed = castToType<double>(snapshotData['windSpeed']);
    _weatherConditions = snapshotData['weatherConditions'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('WeatherDataCollection');

  static Stream<WeatherDataCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => WeatherDataCollectionRecord.fromSnapshot(s));

  static Future<WeatherDataCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WeatherDataCollectionRecord.fromSnapshot(s));

  static WeatherDataCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeatherDataCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeatherDataCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeatherDataCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeatherDataCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeatherDataCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeatherDataCollectionRecordData({
  String? location,
  DateTime? time,
  double? temperature,
  double? humidity,
  double? precipitation,
  double? windSpeed,
  String? weatherConditions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'time': time,
      'temperature': temperature,
      'humidity': humidity,
      'precipitation': precipitation,
      'windSpeed': windSpeed,
      'weatherConditions': weatherConditions,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeatherDataCollectionRecordDocumentEquality
    implements Equality<WeatherDataCollectionRecord> {
  const WeatherDataCollectionRecordDocumentEquality();

  @override
  bool equals(
      WeatherDataCollectionRecord? e1, WeatherDataCollectionRecord? e2) {
    return e1?.location == e2?.location &&
        e1?.time == e2?.time &&
        e1?.temperature == e2?.temperature &&
        e1?.humidity == e2?.humidity &&
        e1?.precipitation == e2?.precipitation &&
        e1?.windSpeed == e2?.windSpeed &&
        e1?.weatherConditions == e2?.weatherConditions;
  }

  @override
  int hash(WeatherDataCollectionRecord? e) => const ListEquality().hash([
        e?.location,
        e?.time,
        e?.temperature,
        e?.humidity,
        e?.precipitation,
        e?.windSpeed,
        e?.weatherConditions
      ]);

  @override
  bool isValidKey(Object? o) => o is WeatherDataCollectionRecord;
}
