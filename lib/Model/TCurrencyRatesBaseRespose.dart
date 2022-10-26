// To parse this JSON data, do
//
//     final tBaseResponse = tBaseResponseFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

TBaseResponse tBaseResponseFromJson(String str) =>
    TBaseResponse.fromJson(json.decode(str));

String tBaseResponseToJson(TBaseResponse data) => json.encode(data.toJson());

class TBaseResponse {
  TBaseResponse({
    required this.pagination,
    required this.currencies,
  });

  Pagination pagination;
  List<TCurrency> currencies;

  factory TBaseResponse.fromJson(Map<String, dynamic> json) => TBaseResponse(
        pagination: json["pagination"] == null
            ? null!
            : Pagination.fromJson(json["pagination"]),
        currencies: json["currencies"] == null
            ? null!
            : List<TCurrency>.from(
                json["currencies"].map((x) => TCurrency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination == null ? null : pagination.toJson(),
        "currencies": currencies == null
            ? null
            : List<dynamic>.from(currencies.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 0)
class TCurrency extends HiveObject {
  TCurrency({
    this.pkIId,
    this.sCode,
    this.sName,
    this.dValue,
    this.dTrading,
    this.sIcon,
    this.bEnabled,
    this.dtCreatedDate,
    this.dtModifiedDate,
    this.dtDeletedDate,
    this.i_type
  });

  @HiveField(0)
  int? pkIId;
  @HiveField(1)
  String? sCode;
  @HiveField(2)
  String? sName;
  @HiveField(3)
  String? dValue;
  @HiveField(4)
  String? dTrading;
  @HiveField(5)
  String? sIcon;
  @HiveField(6)
  bool? bEnabled;
  @HiveField(7)
  String? dtCreatedDate;
  @HiveField(8)
  String? dtModifiedDate;
  @HiveField(9)
  dynamic dtDeletedDate;
  @HiveField(99)
  String? i_type;

  factory TCurrency.fromJson(Map<String, dynamic> json) => TCurrency(
        pkIId: json["pk_i_id"],
        sCode: json["s_code"],
        sName: json["s_name"],
        dValue: json["d_value"],
        dTrading: json["d_trading"],
        sIcon: json["s_icon"],
        bEnabled: json["b_enabled"],
        dtCreatedDate: json["dt_created_date"],
        dtModifiedDate: json["dt_modified_date"],
        dtDeletedDate: json["dt_deleted_date"],
        i_type: json["i_type"]
      );

  Map<String, dynamic> toJson() => {
        "pk_i_id": pkIId == null ? null  : pkIId,
        "s_code": sCode == null ? null : sCode,
        "s_name": sName == null ? null : sName,
        "d_value": dValue == null ? null : dValue,
        "d_trading": dTrading == null ? null : dTrading,
        "s_icon": sIcon == null ? null : sIcon,
        "b_enabled": bEnabled == null ? null : bEnabled,
        "dt_created_date": dtCreatedDate == null ? null : dtCreatedDate,
        "dt_modified_date": dtModifiedDate == null ? null : dtModifiedDate,
        "dt_deleted_date": dtDeletedDate,
        "i_type":i_type == null ? null : i_type
      };
}

class Pagination {
  Pagination({
    required this.iTotalObjects,
    required this.iItemsOnPage,
    required this.iPerPages,
    required this.iCurrentPage,
    required this.iTotalPages,
  });

  int iTotalObjects;
  int iItemsOnPage;
  int iPerPages;
  int iCurrentPage;
  int iTotalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        iTotalObjects:
            json["i_total_objects"] == null ? null : json["i_total_objects"],
        iItemsOnPage:
            json["i_items_on_page"] == null ? null : json["i_items_on_page"],
        iPerPages: json["i_per_pages"] == null ? null : json["i_per_pages"],
        iCurrentPage:
            json["i_current_page"] == null ? null : json["i_current_page"],
        iTotalPages:
            json["i_total_pages"] == null ? null : json["i_total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "i_total_objects": iTotalObjects == null ? null : iTotalObjects,
        "i_items_on_page": iItemsOnPage == null ? null : iItemsOnPage,
        "i_per_pages": iPerPages == null ? null : iPerPages,
        "i_current_page": iCurrentPage == null ? null : iCurrentPage,
        "i_total_pages": iTotalPages == null ? null : iTotalPages,
      };
}
