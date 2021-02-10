import 'package:firebase_database/firebase_database.dart';
// ignore: camel_case_types
class firebase_data{

  firebase_data();

  Future<Map> getData() async{
    final db = FirebaseDatabase.instance.reference().child("Corona");
    Map m;
    await db.once().then((DataSnapshot snapshot){
//      print('Snapshot: ${snapshot.value}');
      m = snapshot.value;
    });
//    print('FirebaseData: $m');
    return m;
  }
}
class MapCoordinates{
  String Country_Name;
  double Latitude;
  double Longitude;


  MapCoordinates({this.Country_Name, this.Latitude, this.Longitude});
}