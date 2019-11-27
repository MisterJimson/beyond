import 'dart:convert';

import 'package:beyond/service/config/config_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final ConfigService _configService;

  /// This fake token for example purposes demonstrates the minimal amount of
  /// state we should store in services
  String token;

  ApiService(this._configService);

  /// This performs a fake login for demo purposes
  Future<ApiResponse<String>> getAuthToken(String username, String password) {
    return Future.delayed(
        Duration(milliseconds: 500), () => ApiResponse(200, data: "token"));
  }

  Future<ApiResponse<Place>> getPlace(double longitude, double latitude) async {
    var response = await http.get(
        "https://us1.locationiq.com/v1/reverse.php?key=${_configService.locationIqApiKey}&lat=$latitude&lon=$longitude&format=json");

    if (_isSuccessStatusCode(response.statusCode)) {
      return ApiResponse(response.statusCode,
          data: Place.fromJson(jsonDecode(response.body)));
    } else {
      return ApiResponse(response.statusCode, error: response.body);
    }
  }

  Future<ApiResponse<List<PointOfInterest>>> getPointsOfInterest(
      double longitude, double latitude, String type,
      {int radius = 500}) async {
    var response = await http.get(
        "https://us1.locationiq.com/v1/nearby.php?key=${_configService.locationIqApiKey}&lat=$latitude&lon=$longitude&tag=$type&radius=$radius&format=json");

    if (_isSuccessStatusCode(response.statusCode)) {
      Iterable list = json.decode(response.body);
      List<PointOfInterest> data =
          list.map((x) => PointOfInterest.fromJson(x)).toList();
      return ApiResponse(response.statusCode, data: data);
    } else {
      return ApiResponse(response.statusCode, error: response.body);
    }
  }

  String getStaticMapImageUrl(String longitude, String latitude) {
    return "https://maps.locationiq.com/v2/staticmap?key=${_configService.locationIqApiKey}&size=600x600&zoom=17&markers=$latitude,$longitude|icon:large-blue-cutout;&format=png";
  }
}

bool _isSuccessStatusCode(int code) => (code >= 200 && code < 300);

class ApiResponse<T> {
  final int statusCode;
  T data;
  String error;

  bool get isSuccess => _isSuccessStatusCode(statusCode);

  ApiResponse(this.statusCode, {this.data, this.error});
}

class Place {
  String placeId;
  String licence;
  String lat;
  String lon;
  String displayName;
  double importance;
  Address address;

  Place({
    this.placeId,
    this.licence,
    this.lat,
    this.lon,
    this.displayName,
    this.importance,
    this.address,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeId: json["place_id"],
        licence: json["licence"],
        lat: json["lat"],
        lon: json["lon"],
        displayName: json["display_name"],
        importance: json["importance"].toDouble(),
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "licence": licence,
        "lat": lat,
        "lon": lon,
        "display_name": displayName,
        "importance": importance,
        "address": address.toJson(),
      };
}

class Address {
  String houseNumber;
  String road;
  String city;
  String county;
  String state;
  String postcode;
  String country;
  String countryCode;

  Address({
    this.houseNumber,
    this.road,
    this.city,
    this.county,
    this.state,
    this.postcode,
    this.country,
    this.countryCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        houseNumber: json["house_number"],
        road: json["road"],
        city: json["city"],
        county: json["county"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "house_number": houseNumber,
        "road": road,
        "city": city,
        "county": county,
        "state": state,
        "postcode": postcode,
        "country": country,
        "country_code": countryCode,
      };
}

class PointOfInterest {
  String lat;
  String lon;
  String tagType;
  String name;
  int distance;

  PointOfInterest({
    this.lat,
    this.lon,
    this.tagType,
    this.name,
    this.distance,
  });

  factory PointOfInterest.fromJson(Map<String, dynamic> json) =>
      PointOfInterest(
        lat: json["lat"],
        lon: json["lon"],
        tagType: json["tag_type"],
        name: json["name"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "tag_type": tagType,
        "name": name,
        "distance": distance,
      };
}
