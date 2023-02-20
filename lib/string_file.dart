//import 'main.dart';

import 'dart:convert';

var jsonProductStr = "";
var jsonMoreStr = "";
var jsonChemicalStr = "";
var jsonChemicalSubStr = "";

var jsonMoreContactStr = "";
var jsonMorePac3500Str = "";
var jsonMorePac3500VStr = "";

var jsonMorePac5500Str = "";
var jsonMorePac5500VStr = "";

var jsonMorePac6000Str = "";
var jsonMorePac6000VStr = "";

var jsonMorePac6500Str = "";
var jsonMorePac6500VStr = "";

var jsonMorePac8000Str = "";
var jsonMorePac8000VStr = "";

var jsonMorePac8500Str = "";
var jsonMorePac8500VStr = "";

var jsonMorePac7000Str = "";
var jsonMorePac7000VStr = "";

var jsonMoreXam2000Str = "";
var jsonMoreXam2000VStr = "";

var jsonMoreXam2500Str = "";
var jsonMoreXam2500VStr = "";

var jsonMoreXam3500Str = "";
var jsonMoreXam3500VStr = "";

var jsonMoreXam8000Str = "";
var jsonMoreXam8000VStr = "";

var jsonMoreXam5000Str = "";
var jsonMoreXam5000VStr = "";

var jsonMoreXam5600Str = "";
var jsonMoreXam5600VStr = "";

var jsonMoreXam7000Str = "";
var jsonMoreXam3000Str = "";

var jsonMoreXZoneStr = "";
var jsonMoreXZoneVStr = "";

var jsonMoreXAct5000Str = "";
var jsonMoreXAct5000VStr = "";

var jsonMoreXAct7000Str = "";

var jsonMoreXPid9500Str = "";

var jsonMoreXZone5500Str = "";
var jsonMoreXZone5500VStr = "";

var jsonMoreXZone5800Str = "";

var jsonProductSigleGasStr = "";
var jsonProductMultiGasStr = "";
var jsonProductcalibratinStr = "";
var jsonProductPumpsStr = "";

var jsonProductShort_TermStr = "";
var jsonProductdiffusionStr = "";
var jsonProductMicroStr = "";
var jsonProductSamplingStr = "";
var jsonProductSimultestStr = "";
var jsonProductMilitaryStr = "";
var jsonProductAerotestStr = "";
var jsonProductCMSStr = "";
var jsonSensorCatExStr = "";
var jsonSensorElectroStr = "";
var jsonSensorInfraStr = "";
var jsonSensorPIDtr = "";

class Flutkart {
  static const String BASE_URL =
      "http://eprocessdevelopment.com/Draeger/GasDirectory/latest_app/";
//http://eprocessdevelopment.com/Draeger/GasDirectory/latest_app/JSON/gasguide_drager.txt
  static const String name = "Flutkart";
  static const String gasguideText = "Gas Guide";
  static const String productsText = "Products";
  static const String chemicalText = "Chemical";
  static const String searchText = "Search";
  static const String supportText = "Support";
  static String gasguideFileText = "";
}

DataCategory dataCategoryFromJson(String str) =>
    DataCategory.fromJson(json.decode(str));

String dataCategoryToJson(DataCategory data) => json.encode(data.toJson());

class DataCategory {
  List<Datum> data;

  DataCategory({
    required this.data,
  });

  factory DataCategory.fromJson(Map<String, dynamic> json) => new DataCategory(
        data: new List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Data": new List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Category? category;
  String chem;
  String eName;
  String eNumber;
  String page;
  String urlSts;

  Datum({
    required this.category,
    required this.chem,
    required this.eName,
    required this.eNumber,
    required this.page,
    required this.urlSts,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
        category: categoryValues.map![json["category"]],
        chem: json["chem"],
        eName: json["eName"],
        eNumber: json["eNumber"],
        page: json["page"],
        urlSts: json["urlSts"],
      );

  Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse![category],
        "chem": chem,
        "eName": eName,
        "eNumber": eNumber,
        "page": page,
        "urlSts": urlSts,
      };
}

enum Category { SHORT_TERM }

final categoryValues = new EnumValues({"short-term": Category.SHORT_TERM});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

List<MessageItem> messageItemFromJson(String str) => new List<MessageItem>.from(
    json.decode(str).map((x) => MessageItem.fromJson(x)));

String messageItemToJson(List<MessageItem> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class MessageItem {
  String eName;
  String page;

  MessageItem({
    required this.eName,
    required this.page,
  });

  factory MessageItem.fromJson(Map<String, dynamic> json) => new MessageItem(
        eName: json["Title"],
        page: json["Page"],
      );

  Map<String, dynamic> toJson() => {
        "Title": eName,
        "Page": page,
      };
}

List<DataList> dataListFromJson(String str) =>
    new List<DataList>.from(json.decode(str).map((x) => DataList.fromJson(x)));

String dataListToJson(List<DataList> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class DataList {
  String title;
  String havsubcategoty;
  String data;
  List<Subcategory> subcategory;

  DataList({
    required this.title,
    required this.havsubcategoty,
    required this.data,
    required this.subcategory,
  });

  factory DataList.fromJson(Map<String, dynamic> json) => new DataList(
        title: json["title"],
        havsubcategoty: json["havsubcategoty"],
        data: json["data"],
        subcategory: new List<Subcategory>.from(
            json["subcategory"].map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "havsubcategoty": havsubcategoty,
        "data": data,
        "subcategory":
            new List<dynamic>.from(subcategory.map((x) => x.toJson())),
      };
}

class Subcategory {
  String title;
  String cat;

  Subcategory({
    required this.title,
    required this.cat,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => new Subcategory(
        title: json["title"],
        cat: json["cat"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "cat": cat,
      };
}

// To parse this JSON data, do
//
//     final chemical = chemicalFromJson(jsonString);

Chemical chemicalFromJson(String str) => Chemical.fromJson(json.decode(str));

String chemicalToJson(Chemical data) => json.encode(data.toJson());

class Chemical {
  List<ChemicalItem> data;

  Chemical({
    required this.data,
  });

  factory Chemical.fromJson(Map<String, dynamic> json) => new Chemical(
        data: new List<ChemicalItem>.from(
            json["Data"].map((x) => ChemicalItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Data": new List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ChemicalItem {
  String chemicalName;
  String chemicalSlug;
  String status;

  ChemicalItem({
    required this.chemicalName,
    required this.chemicalSlug,
    required this.status,
  });

  factory ChemicalItem.fromJson(Map<String, dynamic> json) => new ChemicalItem(
        chemicalName: json["chemical_name"],
        chemicalSlug: json["chemical_slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "chemical_name": chemicalName,
        "chemical_slug": chemicalSlug,
        "status": status,
      };
}

ChemicalCategories chemicalCategoriesFromJson(String str) =>
    ChemicalCategories.fromJson(json.decode(str));

String chemicalCategoriesToJson(ChemicalCategories data) =>
    json.encode(data.toJson());

class ChemicalCategories {
  List<ChemicalCategoriesItem> data;

  ChemicalCategories({
    required this.data,
  });

  factory ChemicalCategories.fromJson(Map<String, dynamic> json) =>
      new ChemicalCategories(
        data: new List<ChemicalCategoriesItem>.from(
            json["Data"].map((x) => ChemicalCategoriesItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Data": new List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ChemicalCategoriesItem {
  String eName;
  String eNumber;
  String page;
  Category1? category;
  List<String> chemicalCategories;
  String chem;

  ChemicalCategoriesItem({
    required this.eName,
    required this.eNumber,
    required this.page,
    required this.category,
    required this.chemicalCategories,
    required this.chem,
  });

  factory ChemicalCategoriesItem.fromJson(Map<String, dynamic> json) =>
      new ChemicalCategoriesItem(
        eName: json["eName"],
        eNumber: json["eNumber"],
        page: json["page"],
        category: json["category"] != null
            ? categoryValues1.map![json["category"]]
            : null,
        chemicalCategories:
            new List<String>.from(json["chemical_categories"].map((x) => x)),
        chem: json["chem"] == null ? null : json["chem"],
      );

  Map<String, dynamic> toJson() => {
        "eName": eName,
        "eNumber": eNumber,
        "page": page,
        "category": categoryValues1.reverse![category],
        "chemical_categories":
            new List<dynamic>.from(chemicalCategories.map((x) => x)),
        "chem": chem == null ? null : chem,
      };
}

enum Category1 {
  SHORT_TERM,
  SIMULTEST,
  MILITARY,
  AEROTEST,
  MICRO,
  SAMPLING,
  DIFFUSION,
  CMS_CHIPS,
  CATEX,
  PID,
  ELECTROCHEMICAL,
  INFARED,
  PUMPS
}

final categoryValues1 = new EnumValues1({
  "aerotest": Category1.AEROTEST,
  "catex": Category1.CATEX,
  "cms-chips": Category1.CMS_CHIPS,
  "diffusion": Category1.DIFFUSION,
  "electrochemical": Category1.ELECTROCHEMICAL,
  "infared": Category1.INFARED,
  "military": Category1.MILITARY,
  "pid": Category1.PID,
  "pumps": Category1.PUMPS,
  "short-term": Category1.SHORT_TERM,
  "simultest": Category1.SIMULTEST,
  "micro": Category1.MICRO,
  "sampling": Category1.SAMPLING
});

class EnumValues1<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues1(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
