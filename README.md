# Beyond
[![Actions Status](https://github.com/MisterJimson/beyond/workflows/Test/badge.svg)](https://github.com/MisterJimson/beyond/actions)

An example app that demonstrates an approach to scalable Flutter app development

Most Flutter content that currently exists focuses on state management and I hope this can dig into other areas a bit more. _Beyond just state management_

I am open to feedback, suggestions, and discussions on how this approach can be improved.

It's important to note that this is not meant to prescribe how everyone should write Flutter apps nor that this is the best option for every project.
## Goals
- Simple
- Clean
- Testable
- Consistent
- Don't reinvent the wheel, use libraries when appropriate
## Setup
1. Get a free API key from https://locationiq.com/
2. Open `lib/service/config/config.dart` and enter your API key
## Architecture Overview
The rest of this document describes how this app is structured
### Page
A Widget that takes up the entire view of your application and can be navigated to and from. Pages contain other Widgets that are used to compose UI.
### ViewModel
A class that contains all the logic and local state for a Page or other component. Provides a way to interact with and react to that state. Every Page should have a ViewModel. Other UI components that are not Pages can also have ViewModels when needed. Powered by MobX. See more below about state management.
### Service
A class that provides a way for the app to interact with something outside of its control. Examples are: web APIs, native device APIs, SDKs, and databases. Ideally services should hold minimal amounts of state.

Lets look two examples of Services in this project
#### Service Example 1: ApiService
The [ApiService](https://github.com/MisterJimson/beyond/blob/master/lib/service/api_service.dart) provides a way for our app to interact with the [LocationIQ](https://locationiq.com/) REST Api. When interacting with a REST Api there are a few things you need to do. Create Api models, serialize/deserialize JSON, handle authentication, etc. The Service should encapsulate most of that, and expose an interface that is easy to use and understand to the rest of the app.

Lets look at the public interface of this Service
```dart
String token;
Future<ApiResponse<String>> getAuthToken(String username, String password);
Future<ApiResponse<Place>> getPlace(double longitude, double latitude);
Future<ApiResponse<List<PointOfInterest>>> getPointsOfInterest(double longitude, double latitude, String type, {int radius = 500});
String getStaticMapImageUrl(String longitude, String latitude);
```
From the above its clear how to use this Service and its easy to know what data you get back. Anyone working on your app won't need to know the implementation details of the Service. 

Another reason we abstract the API with a Service is for mocking during tests. It's very simple to use a mock that returns anything you want from the above methods and properties. This will be expanded on below in Testing.
#### Service Example 2: SharedPreferencesService
The [SharedPreferencesService](https://github.com/MisterJimson/beyond/blob/master/lib/service/shared_preferences_service.dart) provides a way to for our app to interact with the native SharedPreferences/NSUserDefaults APIs on Android and iOS.

You may be thinking "Wait, isn't there an official package for this?" and you would be right. We are using that package here and we are not redeveloping its functionality.

Here is our SharedPreferencesService. We have only implemented what our app currently needs.
```dart
class SharedPreferencesService implements Startable {
  SharedPreferences prefs;

  @override
  Future start() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) {
    return prefs.setString(key, value);
  }

  String getString(String key) {
    return prefs.getString(key);
  }
}
```
Why wrap the SharedPreferences library in our own service? There are a few reasons.

First, to allow for better mocking and testing. Anything that interacts with things outside of your control (Services) should be mocked in most tests. For native Apis especially as there is no Android or iOS when running Flutter tests. If you try to use SharedPreferences during a test you will get `MissingPluginException`. Thats no good. 

While you can use `setMockMethodCallHandler` to mock calls to the native platform, that requires you to have a pretty solid understanding of how the plugin makes native calls and what data it expects. These calls can change version to version without changes to the public API of the plugin.

Second, startup control. Some Services will require some asynchronous work before they are ready to be used. You can see that in the `SharedPreferencesService` above and also in the [PackageInfoService](https://github.com/MisterJimson/beyond/blob/master/lib/service/package_info_service.dart). Creating our own classes allows us to standardize the startup of all these Services with a common interface (`Startable`) and lets us know for sure when the Service is ready to be used by the rest of the app.
### Manager
A class that holds global state and provides ways to interact with and react to that state.

TODO
## State Management
There are many articles and discussions on state management for Flutter so I will only touch on this briefly.

Lets define what state management is when it comes to writing a Flutter app.

State management is...
- How the app interacts with data
- How the app reacts to changes in data
- How the app organizes code related to doing the above

If you look at the above statements and compare them to using `StatefulWidgets` and `setState` you will come to a few limitations when working on a large app.
- App state and UI are tied closely together 
- Ties rebuilding UI to the same scope as your state
- Makes it hard to separate UI code from "business logic"

The above can be challenging when building a large application. There are a few alternative approaches built into Flutter and many third party libraries that each have different ways of solving for this.

MobX is the library used for state management here and the below section will expand on why.
### Why MobX?
There are a few primary reasons why MobX is the preferred choice for state management.

TODO
## Service Location & Dependency Injection
For SL and DI we keep it simple. We have a [ServiceLocator](https://github.com/MisterJimson/beyond/blob/master/lib/infra/service_locator.dart) that contains all our singletons and prepares them for use by the rest of the app. 

We also have a [ViewModelFactory](https://github.com/MisterJimson/beyond/blob/master/lib/infra/view_model_factory.dart) that is used to create instances of ViewModels and pass in parameters.

These 2 classes allow all our app's components to request what they need by constructor injection.

#### SL & DI Example 1: AuthManager
To understand what a class in our app depends on, just look at the final fields and constructor.
```dart
final ApiService _api;
final SharedPreferencesService _sharedPreferencesService;

AuthManager(this._api, this._sharedPreferencesService);
```
Here you can see the AuthManager requires the ApiService and the SharedPreferencesService. Easy. To provide these, just pass them in when the app starts up in our ServiceLocator.
```dart
AuthManager authManager;

ServiceLocator() {
  configService = ConfigService();
  packageInfoService = PackageInfoService();
  apiService = ApiService(configService, packageInfoService);
  sharedPreferencesService = SharedPreferencesService();
  authManager = AuthManager(apiService, sharedPreferencesService);
}
```
If you ever need the AuthManager to use another class, just pass it in and add it as another final field in the AuthManager.
## Testing
Testing is very important in any app designed to scale. The below sections go into detail about the different types of testing I recommend for this approach.
### Unit Testing: Managers
TODO
### UI Integration Testing: Pages, Widgets, ViewModels
TODO
### Integration Testing: Services
TODO
### End To End Testing
TODO
## Configuration
TODO