// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      type: json['type'] as String?,
      id: json['id'] as int?,
      datetimeUtc: json['datetime_utc'] == null
          ? null
          : DateTime.parse(json['datetime_utc'] as String),
      venue: json['venue'] == null
          ? null
          : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      datetimeTbd: json['datetime_tbd'] as bool?,
      performers: (json['performers'] as List<dynamic>?)
          ?.map((e) => Performer.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOpen: json['is_open'] as bool?,
      links: json['links'] as List<dynamic>?,
      datetimeLocal: json['datetime_local'] == null
          ? null
          : DateTime.parse(json['datetime_local'] as String),
      timeTbd: json['time_tbd'] as bool?,
      shortTitle: json['short_title'] as String?,
      visibleUntilUtc: json['visible_until_utc'] == null
          ? null
          : DateTime.parse(json['visible_until_utc'] as String),
      stats: json['stats'] == null
          ? null
          : EventStats.fromJson(json['stats'] as Map<String, dynamic>),
      taxonomies: (json['taxonomies'] as List<dynamic>?)
          ?.map((e) => Taxonomy.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: json['url'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      announceDate: json['announce_date'] == null
          ? null
          : DateTime.parse(json['announce_date'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      dateTbd: json['date_tbd'] as bool?,
      title: json['title'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      description: json['description'] as String?,
      status: json['status'] as String?,
      accessMethod: json['access_method'] == null
          ? null
          : AccessMethod.fromJson(
              json['access_method'] as Map<String, dynamic>),
      eventPromotion: json['event_promotion'] == null
          ? null
          : EventPromotion.fromJson(
              json['event_promotion'] as Map<String, dynamic>),
      announcements: json['announcements'] as Map<String, dynamic>?,
      conditional: json['conditional'] as bool?,
      enddatetimeUtc: json['enddatetime_utc'],
      themes: json['themes'] as List<dynamic>?,
      domainInformation: json['domain_information'] as List<dynamic>?,
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'datetime_utc': instance.datetimeUtc?.toIso8601String(),
      'venue': instance.venue,
      'datetime_tbd': instance.datetimeTbd,
      'performers': instance.performers,
      'is_open': instance.isOpen,
      'links': instance.links,
      'datetime_local': instance.datetimeLocal?.toIso8601String(),
      'time_tbd': instance.timeTbd,
      'short_title': instance.shortTitle,
      'visible_until_utc': instance.visibleUntilUtc?.toIso8601String(),
      'stats': instance.stats,
      'taxonomies': instance.taxonomies,
      'url': instance.url,
      'score': instance.score,
      'announce_date': instance.announceDate?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'date_tbd': instance.dateTbd,
      'title': instance.title,
      'popularity': instance.popularity,
      'description': instance.description,
      'status': instance.status,
      'access_method': instance.accessMethod,
      'event_promotion': instance.eventPromotion,
      'announcements': instance.announcements,
      'conditional': instance.conditional,
      'enddatetime_utc': instance.enddatetimeUtc,
      'themes': instance.themes,
      'domain_information': instance.domainInformation,
    };

Venue _$VenueFromJson(Map<String, dynamic> json) => Venue(
      state: json['state'] as String?,
      nameV2: json['name_v2'] as String?,
      postalCode: json['postal_code'] as String?,
      name: json['name'] as String?,
      links: json['links'] as List<dynamic>?,
      timezone: json['timezone'] as String?,
      url: json['url'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      location: json['location'] as Map<String, dynamic>?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      hasUpcomingEvents: json['has_upcoming_events'] as bool?,
      numUpcomingEvents: json['num_upcoming_events'] as int?,
      city: json['city'] as String?,
      slug: json['slug'] as String?,
      extendedAddress: json['extended_address'] as String?,
      id: json['id'] as int?,
      popularity: json['popularity'] as int?,
      accessMethod: json['access_method'] as Map<String, dynamic>?,
      metroCode: json['metro_code'] as int?,
      capacity: json['capacity'] as int?,
      displayLocation: json['display_location'] as String?,
    );

Map<String, dynamic> _$VenueToJson(Venue instance) => <String, dynamic>{
      'state': instance.state,
      'name_v2': instance.nameV2,
      'postal_code': instance.postalCode,
      'name': instance.name,
      'links': instance.links,
      'timezone': instance.timezone,
      'url': instance.url,
      'score': instance.score,
      'location': instance.location,
      'address': instance.address,
      'country': instance.country,
      'has_upcoming_events': instance.hasUpcomingEvents,
      'num_upcoming_events': instance.numUpcomingEvents,
      'city': instance.city,
      'slug': instance.slug,
      'extended_address': instance.extendedAddress,
      'id': instance.id,
      'popularity': instance.popularity,
      'access_method': instance.accessMethod,
      'metro_code': instance.metroCode,
      'capacity': instance.capacity,
      'display_location': instance.displayLocation,
    };

Performer _$PerformerFromJson(Map<String, dynamic> json) => Performer(
      type: json['type'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      id: json['id'] as int?,
      images: json['images'] as Map<String, dynamic>?,
      divisions: json['divisions'] as List<dynamic>?,
      hasUpcomingEvents: json['has_upcoming_events'] as bool?,
      primary: json['primary'] as bool?,
      stats: json['stats'] as Map<String, dynamic>?,
      taxonomies: json['taxonomies'] as List<dynamic>?,
      imageAttribution: json['image_attribution'] as String?,
      url: json['url'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      slug: json['slug'] as String?,
      homeVenueId: json['home_venue_id'] as int?,
      shortName: json['short_name'] as String?,
      numUpcomingEvents: json['num_upcoming_events'] as int?,
      colors: json['colors'] as Map<String, dynamic>?,
      imageLicense: json['image_license'] as String?,
      popularity: json['popularity'] as int?,
      homeTeam: json['home_team'] as bool?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      imageRightsMessage: json['image_rights_message'] as String?,
      awayTeam: json['away_team'] as bool?,
    );

Map<String, dynamic> _$PerformerToJson(Performer instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
      'images': instance.images,
      'divisions': instance.divisions,
      'has_upcoming_events': instance.hasUpcomingEvents,
      'primary': instance.primary,
      'stats': instance.stats,
      'taxonomies': instance.taxonomies,
      'image_attribution': instance.imageAttribution,
      'url': instance.url,
      'score': instance.score,
      'slug': instance.slug,
      'home_venue_id': instance.homeVenueId,
      'short_name': instance.shortName,
      'num_upcoming_events': instance.numUpcomingEvents,
      'colors': instance.colors,
      'image_license': instance.imageLicense,
      'popularity': instance.popularity,
      'home_team': instance.homeTeam,
      'location': instance.location,
      'image_rights_message': instance.imageRightsMessage,
      'away_team': instance.awayTeam,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

EventStats _$EventStatsFromJson(Map<String, dynamic> json) => EventStats(
      listingCount: json['listing_count'] as int?,
      averagePrice: json['average_price'] as int?,
      lowestPriceGoodDeals: json['lowest_price_good_deals'] as int?,
      lowestPrice: json['lowest_price'] as int?,
      highestPrice: json['highest_price'] as int?,
      visibleListingCount: json['visible_listing_count'] as int?,
      dqBucketCounts: (json['dq_bucket_counts'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      medianPrice: json['median_price'] as int?,
      lowestSgBasePrice: json['lowest_sg_base_price'] as int?,
      lowestSgBasePriceGoodDeals:
          json['lowest_sg_base_price_good_deals'] as int?,
    );

Map<String, dynamic> _$EventStatsToJson(EventStats instance) =>
    <String, dynamic>{
      'listing_count': instance.listingCount,
      'average_price': instance.averagePrice,
      'lowest_price_good_deals': instance.lowestPriceGoodDeals,
      'lowest_price': instance.lowestPrice,
      'highest_price': instance.highestPrice,
      'visible_listing_count': instance.visibleListingCount,
      'dq_bucket_counts': instance.dqBucketCounts,
      'median_price': instance.medianPrice,
      'lowest_sg_base_price': instance.lowestSgBasePrice,
      'lowest_sg_base_price_good_deals': instance.lowestSgBasePriceGoodDeals,
    };

Taxonomy _$TaxonomyFromJson(Map<String, dynamic> json) => Taxonomy(
      id: json['id'] as int?,
      name: json['name'] as String?,
      parentId: json['parent_id'] as int?,
      documentSource: json['document_source'] as Map<String, dynamic>?,
      rank: json['rank'] as int?,
    );

Map<String, dynamic> _$TaxonomyToJson(Taxonomy instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parent_id': instance.parentId,
      'document_source': instance.documentSource,
      'rank': instance.rank,
    };

AccessMethod _$AccessMethodFromJson(Map<String, dynamic> json) => AccessMethod(
      method: json['method'] as String?,
      createdAt: json['created_at'] as String?,
      employeeOnly: json['employee_only'] as bool?,
    );

Map<String, dynamic> _$AccessMethodToJson(AccessMethod instance) =>
    <String, dynamic>{
      'method': instance.method,
      'created_at': instance.createdAt,
      'employee_only': instance.employeeOnly,
    };

EventPromotion _$EventPromotionFromJson(Map<String, dynamic> json) =>
    EventPromotion(
      headline: json['headline'] as String?,
      additionalInfo: json['additional_info'] as String?,
      images: json['images'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$EventPromotionToJson(EventPromotion instance) =>
    <String, dynamic>{
      'headline': instance.headline,
      'additional_info': instance.additionalInfo,
      'images': instance.images,
    };
