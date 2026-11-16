/// Response models for the Sanctions Screening API.

/// API Response wrapper.
class SanctionscreeningResponse {
  final String status;
  final dynamic error;
  final SanctionscreeningData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  SanctionscreeningResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory SanctionscreeningResponse.fromJson(Map<String, dynamic> json) => SanctionscreeningResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? SanctionscreeningData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Sanctions Screening API.

class SanctionscreeningData {
  String? query;
  bool? matched;
  num? matchCount;
  String? verdict;
  num? topScore;
  List<SanctionscreeningDataResultsItem>? results;
  List<String>? matchedLists;
  SanctionscreeningDataList? list;
  List<SanctionscreeningDataListsItem>? lists;

  SanctionscreeningData({
    this.query,
    this.matched,
    this.matchCount,
    this.verdict,
    this.topScore,
    this.results,
    this.matchedLists,
    this.list,
    this.lists,
  });

  factory SanctionscreeningData.fromJson(Map<String, dynamic> json) => SanctionscreeningData(
      query: json['query'],
      matched: json['matched'],
      matchCount: json['matchCount'],
      verdict: json['verdict'],
      topScore: json['topScore'],
      results: (json['results'] as List?)?.map((e) => SanctionscreeningDataResultsItem.fromJson(e)).toList(),
      matchedLists: (json['matchedLists'] as List?)?.cast<String>(),
      list: json['list'] != null ? SanctionscreeningDataList.fromJson(json['list']) : null,
      lists: (json['lists'] as List?)?.map((e) => SanctionscreeningDataListsItem.fromJson(e)).toList(),
    );
}

class SanctionscreeningDataResultsItem {
  num? uid;
  String? name;
  String? type;
  num? score;
  String? confidence;
  String? matchedOn;
  String? matchedVia;
  bool? isWeakAlias;
  List<String>? programs;
  dynamic title;
  List<SanctionscreeningDataResultsItemAkaItem>? aka;
  List<dynamic>? dateOfBirth;
  List<dynamic>? placeOfBirth;
  List<dynamic>? nationalities;
  List<dynamic>? citizenships;
  List<SanctionscreeningDataResultsItemAddressesItem>? addresses;
  List<dynamic>? ids;
  dynamic remarks;
  String? source;
  String? sourceId;
  dynamic listedOn;

  SanctionscreeningDataResultsItem({
    this.uid,
    this.name,
    this.type,
    this.score,
    this.confidence,
    this.matchedOn,
    this.matchedVia,
    this.isWeakAlias,
    this.programs,
    this.title,
    this.aka,
    this.dateOfBirth,
    this.placeOfBirth,
    this.nationalities,
    this.citizenships,
    this.addresses,
    this.ids,
    this.remarks,
    this.source,
    this.sourceId,
    this.listedOn,
  });

  factory SanctionscreeningDataResultsItem.fromJson(Map<String, dynamic> json) => SanctionscreeningDataResultsItem(
      uid: json['uid'],
      name: json['name'],
      type: json['type'],
      score: json['score'],
      confidence: json['confidence'],
      matchedOn: json['matchedOn'],
      matchedVia: json['matchedVia'],
      isWeakAlias: json['isWeakAlias'],
      programs: (json['programs'] as List?)?.cast<String>(),
      title: json['title'],
      aka: (json['aka'] as List?)?.map((e) => SanctionscreeningDataResultsItemAkaItem.fromJson(e)).toList(),
      dateOfBirth: (json['dateOfBirth'] as List?)?.cast<dynamic>(),
      placeOfBirth: (json['placeOfBirth'] as List?)?.cast<dynamic>(),
      nationalities: (json['nationalities'] as List?)?.cast<dynamic>(),
      citizenships: (json['citizenships'] as List?)?.cast<dynamic>(),
      addresses: (json['addresses'] as List?)?.map((e) => SanctionscreeningDataResultsItemAddressesItem.fromJson(e)).toList(),
      ids: (json['ids'] as List?)?.cast<dynamic>(),
      remarks: json['remarks'],
      source: json['source'],
      sourceId: json['sourceId'],
      listedOn: json['listedOn'],
    );
}

class SanctionscreeningDataResultsItemAkaItem {
  String? name;
  String? type;
  String? strength;

  SanctionscreeningDataResultsItemAkaItem({
    this.name,
    this.type,
    this.strength,
  });

  factory SanctionscreeningDataResultsItemAkaItem.fromJson(Map<String, dynamic> json) => SanctionscreeningDataResultsItemAkaItem(
      name: json['name'],
      type: json['type'],
      strength: json['strength'],
    );
}

class SanctionscreeningDataResultsItemAddressesItem {
  String? address1;
  String? city;
  String? postalCode;
  String? country;

  SanctionscreeningDataResultsItemAddressesItem({
    this.address1,
    this.city,
    this.postalCode,
    this.country,
  });

  factory SanctionscreeningDataResultsItemAddressesItem.fromJson(Map<String, dynamic> json) => SanctionscreeningDataResultsItemAddressesItem(
      address1: json['address1'],
      city: json['city'],
      postalCode: json['postalCode'],
      country: json['country'],
    );
}

class SanctionscreeningDataList {
  String? source;
  String? authority;
  String? publishDate;
  num? recordCount;
  String? lastUpdated;

  SanctionscreeningDataList({
    this.source,
    this.authority,
    this.publishDate,
    this.recordCount,
    this.lastUpdated,
  });

  factory SanctionscreeningDataList.fromJson(Map<String, dynamic> json) => SanctionscreeningDataList(
      source: json['source'],
      authority: json['authority'],
      publishDate: json['publishDate'],
      recordCount: json['recordCount'],
      lastUpdated: json['lastUpdated'],
    );
}

class SanctionscreeningDataListsItem {
  String? code;
  String? source;
  String? authority;
  String? publishDate;
  num? recordCount;
  String? lastUpdated;

  SanctionscreeningDataListsItem({
    this.code,
    this.source,
    this.authority,
    this.publishDate,
    this.recordCount,
    this.lastUpdated,
  });

  factory SanctionscreeningDataListsItem.fromJson(Map<String, dynamic> json) => SanctionscreeningDataListsItem(
      code: json['code'],
      source: json['source'],
      authority: json['authority'],
      publishDate: json['publishDate'],
      recordCount: json['recordCount'],
      lastUpdated: json['lastUpdated'],
    );
}

class SanctionscreeningRequest {
  String name;
  double? threshold;
  double? limit;
  String? type;
  String? lists;

  SanctionscreeningRequest({
    required this.name,
    this.threshold,
    this.limit,
    this.type,
    this.lists,
  });

  Map<String, dynamic> toJson() => {
      'name': name,
      if (threshold != null) 'threshold': threshold,
      if (limit != null) 'limit': limit,
      if (type != null) 'type': type,
      if (lists != null) 'lists': lists,
    };
}
