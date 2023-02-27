// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploads_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UploadsRecord> _$uploadsRecordSerializer =
    new _$UploadsRecordSerializer();

class _$UploadsRecordSerializer implements StructuredSerializer<UploadsRecord> {
  @override
  final Iterable<Type> types = const [UploadsRecord, _$UploadsRecord];
  @override
  final String wireName = 'UploadsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UploadsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prediction;
    if (value != null) {
      result
        ..add('prediction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UploadsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UploadsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prediction':
          result.prediction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UploadsRecord extends UploadsRecord {
  @override
  final String? photoUrl;
  @override
  final String? prediction;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UploadsRecord([void Function(UploadsRecordBuilder)? updates]) =>
      (new UploadsRecordBuilder()..update(updates))._build();

  _$UploadsRecord._({this.photoUrl, this.prediction, this.ffRef}) : super._();

  @override
  UploadsRecord rebuild(void Function(UploadsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadsRecordBuilder toBuilder() => new UploadsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadsRecord &&
        photoUrl == other.photoUrl &&
        prediction == other.prediction &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, photoUrl.hashCode), prediction.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UploadsRecord')
          ..add('photoUrl', photoUrl)
          ..add('prediction', prediction)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UploadsRecordBuilder
    implements Builder<UploadsRecord, UploadsRecordBuilder> {
  _$UploadsRecord? _$v;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _prediction;
  String? get prediction => _$this._prediction;
  set prediction(String? prediction) => _$this._prediction = prediction;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UploadsRecordBuilder() {
    UploadsRecord._initializeBuilder(this);
  }

  UploadsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _photoUrl = $v.photoUrl;
      _prediction = $v.prediction;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploadsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UploadsRecord;
  }

  @override
  void update(void Function(UploadsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadsRecord build() => _build();

  _$UploadsRecord _build() {
    final _$result = _$v ??
        new _$UploadsRecord._(
            photoUrl: photoUrl, prediction: prediction, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
