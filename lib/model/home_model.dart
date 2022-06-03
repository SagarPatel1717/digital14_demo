import 'package:json_annotation/json_annotation.dart';
part 'home_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class HomeModel {
  HomeModel({
    this.type,
    this.id,
    this.datetimeUtc,
    this.venue,
    this.datetimeTbd,
    this.performers,
    this.isOpen,
    this.links,
    this.datetimeLocal,
    this.timeTbd,
    this.shortTitle,
    this.visibleUntilUtc,
    this.stats,
    this.taxonomies,
    this.url,
    this.score,
    this.announceDate,
    this.createdAt,
    this.dateTbd,
    this.title,
    this.popularity,
    this.description,
    this.status,
    this.accessMethod,
    this.eventPromotion,
    this.announcements,
    this.conditional,
    this.enddatetimeUtc,
    this.themes,
    this.domainInformation,
    this.isFavorited
  });

  final String? type;
  final int? id;
  final DateTime? datetimeUtc;
  final Venue? venue;
  final bool? datetimeTbd;
  final List<Performer>? performers;
  final bool? isOpen;
  final List<dynamic>? links;
  final DateTime? datetimeLocal;
  final bool? timeTbd;
  final String? shortTitle;
  final DateTime? visibleUntilUtc;
  final EventStats? stats;
  final List<Taxonomy>? taxonomies;
  final String? url;
  final double? score;
  final DateTime? announceDate;
  final DateTime? createdAt;
  final bool? dateTbd;
  final String? title;
  final double? popularity;
  final String? description;
  final String? status;
  final AccessMethod? accessMethod;
  final EventPromotion? eventPromotion;
  final Map? announcements;
  final bool? conditional;
  final dynamic enddatetimeUtc;
  final List<dynamic>? themes;
  final List<dynamic>? domainInformation;
  bool? isFavorited = false;


  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Venue {
  Venue({
    this.state,
    this.nameV2,
    this.postalCode,
    this.name,
    this.links,
    this.timezone,
    this.url,
    this.score,
    this.location,
    this.address,
    this.country,
    this.hasUpcomingEvents,
    this.numUpcomingEvents,
    this.city,
    this.slug,
    this.extendedAddress,
    this.id,
    this.popularity,
    this.accessMethod,
    this.metroCode,
    this.capacity,
    this.displayLocation,
  });

  final String? state;
  final String? nameV2;
  final String? postalCode;
  final String? name;
  final List<dynamic>? links;
  final String? timezone;
  final String? url;
  final double? score;
  final Map? location;
  final String? address;
  final String? country;
  final bool? hasUpcomingEvents;
  final int? numUpcomingEvents;
  final String? city;
  final String? slug;
  final String? extendedAddress;
  final int? id;
  final int? popularity;
  final Map? accessMethod;
  final int? metroCode;
  final int? capacity;
  final String? displayLocation;

  factory Venue.fromJson(Map<String, dynamic> json) =>
      _$VenueFromJson(json);
  Map<String, dynamic> toJson() => _$VenueToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Performer {
  Performer({
    this.type,
    this.name,
    this.image,
    this.id,
    this.images,
    this.divisions,
    this.hasUpcomingEvents,
    this.primary,
    this.stats,
    this.taxonomies,
    this.imageAttribution,
    this.url,
    this.score,
    this.slug,
    this.homeVenueId,
    this.shortName,
    this.numUpcomingEvents,
    this.colors,
    this.imageLicense,
    this.popularity,
    this.homeTeam,
    this.location,
    this.imageRightsMessage,
    this.awayTeam,
  });

  final String? type;
  final String? name;
  final String? image;
  final int? id;
  final Map? images;
  final List<dynamic>? divisions;
  final bool? hasUpcomingEvents;
  final bool? primary;
  final Map? stats;
  final List<dynamic>? taxonomies;
  final String? imageAttribution;
  final String? url;
  final double? score;
  final String? slug;
  final int? homeVenueId;
  final String? shortName;
  final int? numUpcomingEvents;
  final Map? colors;
  final String? imageLicense;
  final int? popularity;
  final bool? homeTeam;
  final Location? location;
  final String? imageRightsMessage;
  final bool? awayTeam;

  factory Performer.fromJson(Map<String, dynamic> json) =>
      _$PerformerFromJson(json);
  Map<String, dynamic> toJson() => _$PerformerToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Location {
  Location({
    this.lat,
    this.lon,
  });

  final double? lat;
  final double? lon;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class EventStats {
  EventStats({
    this.listingCount,
    this.averagePrice,
    this.lowestPriceGoodDeals,
    this.lowestPrice,
    this.highestPrice,
    this.visibleListingCount,
    this.dqBucketCounts,
    this.medianPrice,
    this.lowestSgBasePrice,
    this.lowestSgBasePriceGoodDeals,
  });

  final int? listingCount;
  final int? averagePrice;
  final int? lowestPriceGoodDeals;
  final int? lowestPrice;
  final int? highestPrice;
  final int? visibleListingCount;
  final List<int>? dqBucketCounts;
  final int? medianPrice;
  final int? lowestSgBasePrice;
  final int? lowestSgBasePriceGoodDeals;

  factory EventStats.fromJson(Map<String, dynamic> json) =>
      _$EventStatsFromJson(json);
  Map<String, dynamic> toJson() => _$EventStatsToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Taxonomy {
  Taxonomy({
    this.id,
    this.name,
    this.parentId,
    this.documentSource,
    this.rank,
  });

  final int? id;
  final String? name;
  final int? parentId;
  final Map? documentSource;
  final int? rank;

  factory Taxonomy.fromJson(Map<String, dynamic> json) =>
      _$TaxonomyFromJson(json);
  Map<String, dynamic> toJson() => _$TaxonomyToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class AccessMethod {
  AccessMethod({
    this.method,
    this.createdAt,
    this.employeeOnly,
  });

  final String? method;
  final String? createdAt;
  final bool? employeeOnly;

  factory AccessMethod.fromJson(Map<String, dynamic> json) =>
      _$AccessMethodFromJson(json);
  Map<String, dynamic> toJson() => _$AccessMethodToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class EventPromotion {
  EventPromotion({
    this.headline,
    this.additionalInfo,
    this.images,
  });

  final String? headline;
  final String? additionalInfo;
  final Map? images;

  factory EventPromotion.fromJson(Map<String, dynamic> json) =>
      _$EventPromotionFromJson(json);
  Map<String, dynamic> toJson() => _$EventPromotionToJson(this);
}