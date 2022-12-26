# Flutter Clean architecute with BLoC 

A flutter app that demonstrates clean architecture and that uses bloc library for state management.

### Topics covered
* Modularizing architechure layer with flutter [package](https://docs.flutter.dev/development/packages-and-plugins/using-packages)
* [Bloc](https://bloclibrary.dev/#/) library for state management that also enforces to follow [clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
* Hydrated bloc/cubit for state management with persisted state
* [Google map](https://pub.dev/packages/google_maps_flutter)
* [Multi language/locale support](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
* [Material theme](https://docs.flutter.dev/cookbook/design/themes) with dark and light mode
* Popular [dio](https://github.com/flutterchina/dio) package for http service
* Offline synchronization with [Floor](https://github.com/pinchbv/floor) library for database management

### App Architecture summary
- Used [Very Good Architecture](https://verygood.ventures/blog/very-good-flutter-architecture) for structuring the app.
- There are three layers in the app

    * Application/Feature layer (where user interacts, app UI and widget, where bloc resides and handles business logic)
    * Domain layer (where generate business value, aggregate data from data layer and provide data to business layer.
    * Data layer (where raw data is generated from various sources like remote and local sources.

### Graphical represenatation of Very Good Architechture (VGA)
<p align="center">
    <img src="ss/very_good_architecture.png" width="500">
</p>

Followed separation of concerns in terms of organizing the code.
Separation of concern brings below benefits:

    - Ease of refactoring
    - Ease of testing
    - Reusability of code

The first two layers reside in the main app. For the other two layers, two separate packages have been created for.

     
     1. main app - Application/Feature layer
     2. price_tracker_repository - Domain layer
     3  price_tracker_api -Domain layer (this an interface, this will implement by the concrete api servie like derive_api
     3. deriv_api  - Data Layer (concret implementation for derive_api
     
                                                                                                                                                  
                                                                                                                                                  
### Installation

If you're new to Flutter the first thing you'll need is to follow the [setup instructions](https://flutter.dev/docs/get-started/install). 

Once Flutter is setup, you can use the latest `stable` channel:
 * Run `flutter channel stable`
 * Run `flutter upgrade`

Once you're on `master` branch, you're ready to run the app:
* `flutter run -d android`
* `flutter run -d ios`
* `flutter run -d web`   

