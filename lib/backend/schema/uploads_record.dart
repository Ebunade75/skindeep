import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'uploads_record.g.dart';

abstract class UploadsRecord
    implements Built<UploadsRecord, UploadsRecordBuilder> {
  static Serializer<UploadsRecord> get serializer => _$uploadsRecordSerializer;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get prediction;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UploadsRecordBuilder builder) => builder
    ..photoUrl = ''
    ..prediction = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('uploads')
          : FirebaseFirestore.instance.collectionGroup('uploads');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('uploads').doc();

  static Stream<UploadsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UploadsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UploadsRecord._();
  factory UploadsRecord([void Function(UploadsRecordBuilder) updates]) =
      _$UploadsRecord;

  static UploadsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUploadsRecordData({
  String? photoUrl,
  String? prediction,
}) {
  final firestoreData = serializers.toFirestore(
    UploadsRecord.serializer,
    UploadsRecord(
      (u) => u
        ..photoUrl = photoUrl
        ..prediction = prediction,
    ),
  );

  return firestoreData;
}
