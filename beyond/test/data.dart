import 'package:beyond/service/api_service.dart';

class TestData {
  TestData._();

  static Place get place => Place(
        displayName: 'Place',
        lat: '42',
        lon: '42',
        placeId: 'id',
        address: Address(
          city: 'city',
          country: 'country',
          houseNumber: '42',
          postcode: '12345',
          county: 'county',
          countryCode: 'CODE',
          road: 'road',
          state: 'ST',
        ),
        importance: 12,
        licence: '1234',
      );

  static PointOfInterest get pointOfInterest => PointOfInterest(
        lat: '42',
        lon: '42',
        name: 'POI',
        distance: 10,
        tagType: 'type',
      );
}
