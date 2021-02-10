import 'all_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String countryName = '';
  String newDeath = '';
  String totalDeath = '';
  String newCases = '';
  String totalCases = '';
  String totalTests = '';
  String totalRecover = '';
  Map m, countryData;
  List<MapCoordinates> mapCoordinates = List<MapCoordinates>();

  void setData() async {
    firebase_data f = new firebase_data();
    m = await f.getData();

    try {
      countryName = await countryData['country_name'];
      newDeath = m[countryName]['New_Deaths'];
      totalDeath = m[countryName]['Total_Deaths'];
      newCases = m[countryName]['New_Cases'];
      totalCases = m[countryName]['Total_Cases'];
      totalTests = m[countryName]['Total_Tests'];
      totalRecover = m[countryName]['Total_Recovered'];
//      print('CurrentLatLng: ${_currentCountryLatLng}');
    }
    catch (e) {
      print('Error occured : ' + e.toString());
    }
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'country_name' : countryName,
      'new_death' : newDeath,
      'total_death' : totalDeath,
      'new_cases' : newCases,
      'total_cases' : totalCases,
      'total_tests' : totalTests,
      'total_recover' : totalRecover,
      'location' : _currentCountryLatLng,
      'allCountryData' : countryData,
      'firebaseData' : m,
    });
  }

  Position _currentPosition;
  Coordinates _currentCountryLatLng;

//  void getLocation() async{
//    await _getCurrentLocation();
//  }

//  Future<dynamic> getLocationFromCurrentLatLng() async{
//    final coordinates = new Coordinates(_currentPosition.latitude, _currentPosition.longitude);
//    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//    var first = addresses.first.countryName;
//    return first;
//  }
//  Future<void> getLanLng()async{
//    _currentCountryLatLng = new Coordinates(_currentPosition.latitude, _currentPosition.longitude);
//    final countryCode =await getLocationFromCurrentLatLng();
//    var addresses1 = await Geocoder.local.findAddressesFromQuery(countryName);
//    _currentCountryLatLng = _currentCountryLatLng == null ? addresses1.first.coordinates : countryData['LatLng'];
//    print('Country_LatLng: ${_currentCountryLatLng.latitude}');
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    getLocation();
//  }


  @override
  Widget build(BuildContext context) {
    countryData = ModalRoute.of(context).settings.arguments;
    setData();
    return Scaffold(
      backgroundColor: Colors.blueAccent[700],
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
//  _getCurrentLocation() {
//    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
//    geolocator
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//        .then((Position position) {
//      setState(() {
//        _currentPosition = position;
//        print('Current Location: $_currentPosition');
//        getLanLng();                      //get coordinate of the current country
//      });
//    }).catchError((e) {
//      print(e);
//    });
//  }
}

