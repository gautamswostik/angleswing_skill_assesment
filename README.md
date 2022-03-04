# angleswing_skill_assesment

A new Flutter project.

## Getting Started

# Project Setup

I have tried to follow clean architectire for the project for better redability and better management

Firstly I installed the packages and plugins which I'm going to use most in this project, the packaces are added throughout the development phase according to the needs of application.

The main packages and plugins installed are follows

1.Flutter_map - I decided to use this package because it is based on MapBox and uses MapBox api for Maps and stuffs related with map. There are many packages like google_maps which provide many more feature. But it was specified if I have used MapBox the better in requirement of Job vacancy so I decided to go with MapBox.<br/> 2. Bloc - For state management<br/> 3. Dio - For api calls<br/> 4. ohters for code generations and some other suffs<br/>

The project is divided into 4 parts<br/> 1. App Setup<br/> 2. Application<br/> 3. Infrastructure<br/> 4. Presentation<br/>

# App Setup

The App setup consists of Api services, Local storage services , bloc observer for observing bloc states and event and app.dart which is beginning of our application.

# Infrastructure

The Infrastructure consits of Repository classes for api, local storage , Models of api etc.

# Application

The Application is used to call repository which consists of bloc, api failure entites and api endpoints.

# Presentation

The presentaion consists of User Interface section of the application. All the screens and widgets are located in presentation.

# References

For all map activities I used Flutter map package and folowed pub.dev documentation
https://pub.dev/packages/flutter_map

For Location - For getting Users live latitude and longitude I used Location package
https://pub.dev/packages/location

To animate to new location
https://github.com/fleaflet/flutter_map/blob/master/example/lib/pages/animated_map_controller.dart

And some Stackoverflow solutions for some some small concepts and minor problems

# Install Guides

You'll recieve .apk file just tap on it, it would ask if to install or cancel.
press install it'll install application in your phone. If it asks for permission allow it it's for location and fetching data from internet purpose.

# Versions

Dart 2.16.1<br/>
Flutter 2.10.2<br/>
