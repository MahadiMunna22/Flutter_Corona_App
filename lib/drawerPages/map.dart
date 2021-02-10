import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:coronaupdateflutter/pages/all_classes.dart';

void main() => runApp(MaterialApp(
  home: Flutter_Map(),
));

// ignore: camel_case_types
class Flutter_Map extends StatefulWidget {
  @override
  _Flutter_MapState createState() => _Flutter_MapState();
}

// ignore: camel_case_types
class _Flutter_MapState extends State<Flutter_Map> {
  GoogleMapController mapController;
  Map currentPosition;
  List<Marker> currentLocation = [];
  String cur;
  List<MapCoordinates>mapCoordinates = List<MapCoordinates>();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Color selected = Colors.blueAccent[700];
  Color unselected = Colors.grey[400];

  Widget navigationDrawer() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width/2.5,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      color: Colors.blue[900],
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey[600], height: 0,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              color: Colors.grey[50],
              child: InkWell(
                onTap: (){
                  var count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 3;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_balance,
                      size: 50,
                      color: unselected,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'HOME',
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 12,
                        color: unselected,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey[600], height: 0,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: InkWell(
                onTap: (){

                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.map,
                      size: 50,
                      color: selected,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'MAP',
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 12,
                        color: selected,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey[600], height: 0,),Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: InkWell(
                onTap: (){},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.public,
                      size: 50,
                      color: unselected,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'CORONA TEST',
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 12,
                        color: unselected,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey[600], height: 0,),
          ],
        ),
      ),
    );
  }

  void addMarker() {
//      currentLocation.add(Marker(
//          markerId: MarkerId('Current Location'),
//          draggable: false,
//          infoWindow: InfoWindow(
//            title: 'Bangladesh',
//            snippet: 'New Death: ${currentPosition['countryData']['new_death']}',
//          ),
//          position: LatLng(currentPosition['countryData']['location'].latitude, currentPosition['countryData']['location'].longitude),
//      ));
      for(int i = 0; i<210; i++){
//        print(mapCoordinates[i].Country_Name);
        try{
          currentLocation.add(Marker(
            markerId: MarkerId('All Location'),
            draggable: false,
            infoWindow: InfoWindow(
              title: mapCoordinates[i].Country_Name,
              snippet: 'New Death: ${currentPosition['countryData']['firebaseData'][mapCoordinates[i].Country_Name]['New_Deaths']}',
            ),
            position: LatLng(mapCoordinates[i].Latitude,mapCoordinates[i].Longitude),
          ));
//            print('${mapCoordinates[i].Country_Name} $i');
//            print('New Death: ${currentPosition['countryData']['firebaseData'][mapCoordinates[i].Country_Name]['New_Deaths']} $i');
        }
        catch(e){print('${mapCoordinates[i].Country_Name} having problem.........................................');}
      }

  }

  @override
  Widget build(BuildContext context) {
    currentPosition = ModalRoute.of(context).settings.arguments;
//    cur = currentPosition['countryData'];
    mapCoordinates = currentPosition['countryData']['allCountryData']['getMapData'];
    print('Current Country index: ${currentPosition['countryData']['allCountryData']['country_index']}');
    addMarker();
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
                'Maps Sample App',
              style: TextStyle(
                color: Colors.blueAccent[700],
              ),
            ),
          ),
          backgroundColor: Colors.grey,
        ),
        drawer: navigationDrawer(),
        body: GoogleMap(
          mapToolbarEnabled: false,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(mapCoordinates[currentPosition['countryData']['allCountryData']['country_index']].Latitude, mapCoordinates[currentPosition['countryData']['allCountryData']['country_index']].Longitude),
            zoom: 4.6,
          ),
          markers: Set.from(currentLocation),
        ),
    );
  }

}
