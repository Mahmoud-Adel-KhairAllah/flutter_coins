 import 'package:flutter_coins/Model/TCurrencyRatesBaseRespose.dart';
import 'package:hive/hive.dart';

//GENERATED CODE - DO NOT MODIFY BY HAND



// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TCurrencyAdapter extends TypeAdapter<TCurrency> {
  @override
  final int typeId = 0;

  @override
  TCurrency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
   
    return TCurrency(
      pkIId: fields[0]as int,
      sCode: fields[1]as String?,
      sName: fields[2]as String,
      dValue: fields[3]as String,
      dTrading: fields[4]as String,
      sIcon: fields[5]as String,
      bEnabled: fields[6]as bool,
      dtCreatedDate: fields[7]as String,
      dtModifiedDate: fields[8]as String,
      dtDeletedDate: fields[9]as String?,
      i_type: fields[99]as String?
      
    );
  }

  @override
  void write(BinaryWriter writer, TCurrency obj) {
    writer
    ..writeByte(10)
      ..writeByte(0)
      ..write(obj.pkIId)
      ..writeByte(1)
      ..write(obj.sCode)
      ..writeByte(2)
      ..write(obj.sName)
      ..writeByte(3)
      ..write(obj.dValue)
      ..writeByte(4)
      ..write(obj.dTrading)
      ..writeByte(5)
      ..write(obj.sIcon)
      ..writeByte(6)
      ..write(obj.bEnabled)
      ..writeByte(7)
      ..write(obj.dtCreatedDate)
      ..writeByte(8)
      ..write(obj.dtModifiedDate)
      ..writeByte(9)
      ..write(obj.dtDeletedDate)
      ..writeByte(99)
      ..write(obj.i_type);
      

  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}