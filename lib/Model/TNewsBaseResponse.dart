// To parse this JSON data, do
//
//     final tNewsBaseResponse = tNewsBaseResponseFromJson(jsonString);

import 'dart:convert';

TNewsBaseResponse tNewsBaseResponseFromJson(String str) => TNewsBaseResponse.fromJson(json.decode(str));

String tNewsBaseResponseToJson(TNewsBaseResponse data) => json.encode(data.toJson());

class TNewsBaseResponse {
    TNewsBaseResponse({
        this.status,
        this.pagination,
        this.news,
    });

    Status? status;
    Pagination? pagination;
    List<TNews>? news;

    factory TNewsBaseResponse.fromJson(Map<String, dynamic> json) => TNewsBaseResponse(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        news: json["news"] == null ? null : List<TNews>.from(json["news"].map((x) => TNews.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status!.toJson(),
        "pagination": pagination == null ? null : pagination!.toJson(),
        "news": news == null ? null : List<dynamic>.from(news!.map((x) => x.toJson())),
    };
}

class TNews {
    TNews({
        this.pkIId,
        this.sTitle,
        this.sImage,
        this.sDescription,
        this.bEnabled,
        this.dtCreatedDate,
        this.dtModifiedDate,
        this.dtDeletedDate,
    });

    int? pkIId;
    String? sTitle;
    String? sImage;
    String? sDescription;
    bool? bEnabled;
    String? dtCreatedDate;
    String? dtModifiedDate;
    dynamic? dtDeletedDate;

    factory TNews.fromJson(Map<String, dynamic> json) => TNews(
        pkIId: json["pk_i_id"] == null ? null : json["pk_i_id"],
        sTitle: json["s_title"] == null ? null : json["s_title"],
        sImage: json["s_image"] == null ? null : json["s_image"],
        sDescription: json["s_description"] == null ? null : json["s_description"],
        bEnabled: json["b_enabled"] == null ? null : json["b_enabled"],
        dtCreatedDate: json["dt_created_date"] == null ? null! : json["dt_created_date"],
        dtModifiedDate: json["dt_modified_date"] == null ? null! : json["dt_modified_date"],
        dtDeletedDate: json["dt_deleted_date"],
    );

    Map<String, dynamic> toJson() => {
        "pk_i_id": pkIId == null ? null : pkIId,
        "s_title": sTitle == null ? null : sTitle,
        "s_image": sImage == null ? null : sImage,
        "s_description": sDescription == null ? null : sDescription,
        "b_enabled": bEnabled == null ? null : bEnabled,
        "dt_created_date": dtCreatedDate == null ? null : dtCreatedDate!,
        "dt_modified_date": dtModifiedDate == null ? null : dtModifiedDate!,
        "dt_deleted_date": dtDeletedDate,
    };
}

class Pagination {
    Pagination({
        this.iTotalObjects,
        this.iItemsOnPage,
        this.iPerPages,
        this.iCurrentPage,
        this.iTotalPages,
    });

    int? iTotalObjects;
    int? iItemsOnPage;
    int? iPerPages;
    int? iCurrentPage;
    int? iTotalPages;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        iTotalObjects: json["i_total_objects"] == null ? null : json["i_total_objects"],
        iItemsOnPage: json["i_items_on_page"] == null ? null : json["i_items_on_page"],
        iPerPages: json["i_per_pages"] == null ? null : json["i_per_pages"],
        iCurrentPage: json["i_current_page"] == null ? null : json["i_current_page"],
        iTotalPages: json["i_total_pages"] == null ? null : json["i_total_pages"],
    );

    Map<String, dynamic> toJson() => {
        "i_total_objects": iTotalObjects == null ? null : iTotalObjects,
        "i_items_on_page": iItemsOnPage == null ? null : iItemsOnPage,
        "i_per_pages": iPerPages == null ? null : iPerPages,
        "i_current_page": iCurrentPage == null ? null : iCurrentPage,
        "i_total_pages": iTotalPages == null ? null : iTotalPages,
    };
}

class Status {
    Status({
        this.success,
        this.code,
        this.message,
    });

    bool? success;
    int? code;
    String? message;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        success: json["success"] == null ? null : json["success"],
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "code": code == null ? null : code,
        "message": message == null ? null : message,
    };
}
