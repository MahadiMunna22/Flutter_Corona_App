import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'all_classes.dart';
import 'package:flutter/material.dart';


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  TextEditingController editingController = TextEditingController();

  List<String> country = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua_and_Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia_and_Herzegovina","Botswana","Brazil","British_Virgin_Islands","Brunei_","Bulgaria","Burkina_Faso","Burundi","Cabo_Verde","Cambodia","Cameroon","Canada","CAR","Caribbean_Netherlands","Cayman_Islands","Chad","Channel_Islands","Chile","China","Colombia","Congo","Costa_Rica","Croatia","Cuba","Curaçao","Cyprus","Czechia","Denmark","Djibouti","Dominica","Dominican_Republic","DRC","Ecuador","Egypt","El_Salvador","Equatorial_Guinea","Eritrea","Estonia","Eswatini","Ethiopia","Faeroe_Islands","Falkland_Islands","Fiji","Finland","France","French_Guiana","French_Polynesia","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hong_Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle_of_Man","Israel","Italy","Ivory_Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macao","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nepal","Netherlands","New_Caledonia","New_Zealand","Nicaragua","Niger","Nigeria","North_Macedonia","Norway","Oman","Pakistan","Palestine","Panama","Papua_New_Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russia","Rwanda","Réunion","S_Korea","Saint_Kitts_and_Nevis","Saint_Lucia","Saint_Martin","Saint_Pierre_Miquelon","San_Marino","Sao_Tome_and_Principe","Saudi_Arabia","Senegal","Serbia","Seychelles","Sierra_Leone","Singapore","Sint_Maarten","Slovakia","Slovenia","Somalia","South_Africa","South_Sudan","Spain","Sri_Lanka","St_Barth","St_Vincent_Grenadines","Sudan","Suriname","Sweden","Switzerland","Syria","Taiwan","Tanzania","Thailand","Timor-Leste","Togo","Trinidad_and_Tobago","Tunisia","Turkey","Turks_and_Caicos","UAE","Uganda","UK","Ukraine","Uruguay","USA","Uzbekistan","Vatican_City","Venezuela","Vietnam","Western_Sahara","Yemen","Zambia","Zimbabwe"];
  var searchItem = List<String>();
  List<MapCoordinates> mapCoordinates = List<MapCoordinates>();

  @override
  void initState() {
    super.initState();
    searchItem.addAll(country);
    getMapData();
    getCountryName();
  }

  _write(String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/my_file.txt');
    await file.writeAsString(text, mode: FileMode.write);
  }
  Future<String> _read() async {
    String text;
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/my_file.txt');
      text = await file.readAsString();
      print(text);
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }

  void getMapData(){
    setState(() {
      mapCoordinates.add(MapCoordinates(Country_Name: 'Afghanistan', Latitude: 33.93911, Longitude: 67.709953));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Albania', Latitude: 41.153332, Longitude: 20.168331));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Algeria', Latitude: 28.033886, Longitude: 1.6596259999999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Andorra', Latitude: 42.506285, Longitude: 1.521801));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Angola', Latitude: -11.202691999999999, Longitude: 17.873887));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Anguilla', Latitude: 18.220554, Longitude: -63.06861499999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Antigua_and_Barbuda', Latitude: 17.060816, Longitude: -61.796428));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Argentina', Latitude: -38.416097, Longitude: -63.616671999999994));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Armenia', Latitude: 40.069099, Longitude: 45.038189));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Aruba', Latitude: 12.52111, Longitude: -69.968338));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Australia', Latitude: -25.274397999999998, Longitude: 133.775136));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Austria', Latitude: 47.516231, Longitude: 14.550072));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Azerbaijan', Latitude: 40.143105, Longitude: 47.576927));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Bahamas', Latitude: 25.034280000000003, Longitude: -77.39627999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Bahrain', Latitude: 26.066699999999997, Longitude: 50.5577));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Bangladesh', Latitude: 23.684994, Longitude: 90.356331));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Barbados', Latitude: 13.193887, Longitude: -59.543198));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Belarus', Latitude: 53.709807, Longitude: 27.953388999999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Belgium', Latitude: 50.503887, Longitude: 4.469936));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Belize', Latitude: 17.189877, Longitude: -88.49765));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Benin', Latitude: 9.30769, Longitude: 2.3158339999999997));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Bermuda', Latitude: 32.3078, Longitude: -64.7505));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Bhutan', Latitude: 27.514162, Longitude: 90.433601));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Bolivia', Latitude: -16.290153999999998, Longitude: -63.588652999999994));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Bosnia_and_Herzegovina', Latitude: 43.915886, Longitude: 17.679076));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Botswana', Latitude: -22.328474, Longitude: 24.684866));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Brazil', Latitude: -14.235004, Longitude: -51.92528));
      mapCoordinates.add(MapCoordinates(Country_Name: 'British_Virgin_Islands', Latitude: 18.420695, Longitude: -64.639968));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Brunei_', Latitude: 4.535277, Longitude: 114.72766899999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Bulgaria', Latitude: 42.733883, Longitude: 25.48583));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Burkina_Faso', Latitude: 12.238332999999999, Longitude: -1.561593));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Burundi', Latitude: -3.373056, Longitude: 29.918886));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Cabo_Verde', Latitude: 16.5388, Longitude: -23.041800000000002));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Cambodia', Latitude: 12.565679, Longitude: 104.990963));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Cameroon', Latitude: 7.369721999999999, Longitude: 12.354721999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Canada', Latitude: 56.130365999999995, Longitude: -106.34677099999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'CAR', Latitude: 6.611110999999999, Longitude: 20.939443999999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Caribbean_Netherlands', Latitude: 12.1783611, Longitude: -68.2385339));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Cayman_Islands', Latitude: 19.313299999999998, Longitude: -81.2546));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Chad', Latitude: 15.454165999999999, Longitude: 18.732207));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Channel_Islands', Latitude: 49.446669799999995, Longitude: -2.342378));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Chile', Latitude: -35.675146999999996, Longitude: -71.542969));
      mapCoordinates.add(MapCoordinates(Country_Name: 'China', Latitude: 35.86166, Longitude: 104.195397));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Colombia', Latitude: 4.570868, Longitude: -74.297333));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Congo', Latitude: -4.038333, Longitude: 21.758664));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Costa_Rica', Latitude: 9.748916999999999, Longitude: -83.753428));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Croatia', Latitude: 45.1, Longitude: 15.2000001));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Cuba', Latitude: 21.521756999999997, Longitude: -77.781167));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Curaçao', Latitude: 12.16957, Longitude: -68.99002));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Cyprus', Latitude: 35.126413, Longitude: 33.429859));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Czechia', Latitude: 49.817491999999994, Longitude: 15.472961999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Denmark', Latitude: 56.26392, Longitude: 9.501785));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Djibouti', Latitude: 11.825137999999999, Longitude: 42.590275));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Dominica', Latitude: 15.414999000000002, Longitude: -61.370976000000006));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Dominican_Republic', Latitude: 18.735692999999998, Longitude: -70.162651));
      mapCoordinates.add(MapCoordinates(Country_Name: 'DRC', Latitude: -4.038333, Longitude: 21.758664));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Ecuador', Latitude: -1.831239, Longitude: -78.18340599999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Egypt', Latitude: 26.820553, Longitude: 30.802498000000003));
      mapCoordinates.add(MapCoordinates(Country_Name: 'El_Salvador', Latitude: 13.794184999999999, Longitude: -88.89653));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Equatorial_Guinea', Latitude: 1.650801, Longitude: 10.267895));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Eritrea', Latitude: 15.179383999999997, Longitude: 39.782334));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Estonia', Latitude: 58.595272, Longitude: 25.013607099999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Eswatini', Latitude: -26.522503, Longitude: 31.465866));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Ethiopia', Latitude: 9.145000000000001, Longitude: 40.489672999999996));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Faeroe_Islands', Latitude: 61.892635000000006, Longitude: -6.9118061));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Falkland_Islands', Latitude: -51.796253, Longitude: -59.523613));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Fiji', Latitude: -17.713371, Longitude: 178.06503200000003));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Finland', Latitude: 61.92410999999999, Longitude: 25.748151099999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'France', Latitude: 46.227638, Longitude: 2.213749));
      mapCoordinates.add(MapCoordinates(Country_Name: 'French_Guiana', Latitude: 3.9338889999999997, Longitude: -53.125782));
      mapCoordinates.add(MapCoordinates(Country_Name: 'French_Polynesia', Latitude: -17.679742, Longitude: -149.40684299999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Gabon', Latitude: -0.803689, Longitude: 11.609444));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Gambia', Latitude: 13.443182, Longitude: -15.310139000000001));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Georgia', Latitude: 32.1656221, Longitude: -82.9000751));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Germany', Latitude: 51.165690999999995, Longitude: 10.451526));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Ghana', Latitude: 7.946527, Longitude: -1.023194));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Gibraltar', Latitude: 36.140751, Longitude: -5.353585));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Greece', Latitude: 39.074208, Longitude: 21.824312));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Greenland', Latitude: 71.706936, Longitude: -42.604303));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Grenada', Latitude: 12.1165, Longitude: -61.678999999999995));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Guadeloupe', Latitude: 16.265, Longitude: -61.550999999999995));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Guatemala', Latitude: 15.783470999999999, Longitude: -90.23075899999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Guinea', Latitude: 9.945587, Longitude: -9.696645));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Guinea-Bissau', Latitude: 11.803749, Longitude: -15.180412999999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Guyana', Latitude: 4.860416, Longitude: -58.93018));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Haiti', Latitude: 18.971187, Longitude: -72.285215));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Honduras', Latitude: 15.199999000000002, Longitude: -86.241905));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Hong_Kong', Latitude: 22.3193039, Longitude: 114.16936109999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Hungary', Latitude: 47.162493999999995, Longitude: 19.503304099999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Iceland', Latitude: 64.146582, Longitude: -21.9426354));
      mapCoordinates.add(MapCoordinates(Country_Name: 'India', Latitude: 20.593684, Longitude: 78.96288));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Indonesia', Latitude: -3.548471, Longitude: 121.730002));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Iran', Latitude: 32.427907999999995, Longitude: 53.688046));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Iraq', Latitude: 33.223191, Longitude: 43.679291));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Ireland', Latitude: 53.142367199999995, Longitude: -7.6920535999999995));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Isle_of_Man', Latitude: 54.236107, Longitude: -4.548056));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Israel', Latitude: 31.046051, Longitude: 34.851611999999996));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Italy', Latitude: 41.871939999999995, Longitude: 12.56738));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Ivory_Coast', Latitude: 7.539988999999999, Longitude: -5.547079999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Jamaica', Latitude: 18.109581, Longitude: -77.297508));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Japan', Latitude: 36.204823999999995, Longitude: 138.252924));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Jordan', Latitude: 31.9539494, Longitude: 35.910635));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Kazakhstan', Latitude: 48.019573, Longitude: 66.923684));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Kenya', Latitude: -0.023559, Longitude: 37.906193));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Kuwait', Latitude: 29.31166, Longitude: 47.481766));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Kyrgyzstan', Latitude: 41.20438, Longitude: 74.766098));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Laos', Latitude: 19.85627, Longitude: 102.49549599999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Latvia', Latitude: 56.879635, Longitude: 24.603189));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Lebanon', Latitude: 33.854721, Longitude: 35.862285));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Liberia', Latitude: 6.428055, Longitude: -9.429499000000002));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Libya', Latitude: 26.335099999999997, Longitude: 17.228331));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Liechtenstein', Latitude: 47.166, Longitude: 9.555373));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Lithuania', Latitude: 55.169438, Longitude: 23.881275));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Luxembourg', Latitude: 49.815273, Longitude: 6.129582999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Macao', Latitude: 22.198745, Longitude: 113.54387299999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Madagascar', Latitude: -18.766947, Longitude: 46.869107));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Malawi', Latitude: -13.254308, Longitude: 34.301525));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Malaysia', Latitude: 4.210484, Longitude: 101.975766));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Maldives', Latitude: 3.202778, Longitude: 73.22068));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Mali', Latitude: 17.570691999999998, Longitude: -3.9961659999999997));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Malta', Latitude: 35.937495999999996, Longitude: 14.375416));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Martinique', Latitude: 14.641528000000001, Longitude: -61.024174));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Mauritania', Latitude: 21.00789, Longitude: -10.940835));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Mauritius', Latitude: -20.348404, Longitude: 57.55215200000001));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Mayotte', Latitude: -12.827499999999999, Longitude: 45.166244));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Mexico', Latitude: 23.634501, Longitude: -102.55278399999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Moldova', Latitude: 47.411631, Longitude: 28.369885));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Monaco', Latitude: 43.738417600000005, Longitude: 7.424615799999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Mongolia', Latitude: 46.862496, Longitude: 103.846656));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Montenegro', Latitude: 42.708678, Longitude: 19.37439));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Montserrat', Latitude: 16.742497999999998, Longitude: -62.187366000000004));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Morocco', Latitude: 31.791702, Longitude: -7.092619999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Mozambique', Latitude: -18.665695, Longitude: 35.529562));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Myanmar', Latitude: 21.916221, Longitude: 95.955974));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Namibia', Latitude: -22.957639999999998, Longitude: 18.49041));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Nepal', Latitude: 28.394857, Longitude: 84.12400799999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Netherlands', Latitude: 52.132633, Longitude: 5.291265999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'New_Caledonia', Latitude: -20.904305, Longitude: 165.618042));
      mapCoordinates.add(MapCoordinates(Country_Name: 'New_Zealand', Latitude: -40.900557, Longitude: 174.88597099999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Nicaragua', Latitude: 12.865416, Longitude: -85.207229));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Niger', Latitude: 17.607789, Longitude: 8.081666));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Nigeria', Latitude: 9.081999, Longitude: 8.675277));
      mapCoordinates.add(MapCoordinates(Country_Name: 'North_Macedonia', Latitude: 41.608635, Longitude: 21.745275));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Norway', Latitude: 60.47202399999999, Longitude: 8.468945999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Oman', Latitude: 21.4735329, Longitude: 55.975412999999996));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Pakistan', Latitude: 30.375321000000003, Longitude: 69.34511599999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Palestine', Latitude: 31.952161999999998, Longitude: 35.233154));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Panama', Latitude: 8.537981, Longitude: -80.782127));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Papua_New_Guinea', Latitude: -6.314992999999999, Longitude: 143.95555));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Paraguay', Latitude: -23.442503, Longitude: -58.443832));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Peru', Latitude: -9.189967, Longitude: -75.015152));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Philippines', Latitude: 12.879721, Longitude: 121.77401700000001));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Poland', Latitude: 51.919438, Longitude: 19.145136));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Portugal', Latitude: 39.399871999999995, Longitude: -8.224454));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Qatar', Latitude: 25.354826, Longitude: 51.183884));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Romania', Latitude: 45.943160999999996, Longitude: 24.966759999999997));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Russia', Latitude: 61.52401, Longitude: 105.318756));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Rwanda', Latitude: -1.9402780000000002, Longitude: 29.873887999999997));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Réunion', Latitude: -21.115140999999998, Longitude: 55.536384));
      mapCoordinates.add(MapCoordinates(Country_Name: 'S_Korea', Latitude: 35.907757, Longitude: 127.76692200000001));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Saint_Kitts_and_Nevis', Latitude: 17.357822, Longitude: -62.782998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Saint_Lucia', Latitude: 13.909443999999999, Longitude: -60.978893));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Saint_Martin', Latitude: 18.0708298, Longitude: -63.0500809));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Saint_Pierre_Miquelon', Latitude: 46.8852, Longitude: -56.3159));
      mapCoordinates.add(MapCoordinates(Country_Name: 'San_Marino', Latitude: 43.94236, Longitude: 12.457777));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Sao_Tome_and_Principe', Latitude: 0.18636, Longitude: 6.613080999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Saudi_Arabia', Latitude: 23.885942, Longitude: 45.079162));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Senegal', Latitude: 14.497401000000002, Longitude: -14.452361999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Serbia', Latitude: 44.016521, Longitude: 21.005858999999997));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Seychelles', Latitude: -4.679574, Longitude: 55.491977));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Sierra_Leone', Latitude: 8.460555, Longitude: -11.779888999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Singapore', Latitude: 1.352083, Longitude: 103.819836));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Sint_Maarten', Latitude: 18.042479999999998, Longitude: -63.054829999999995));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Slovakia', Latitude: 48.669025999999995, Longitude: 19.699023999999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Slovenia', Latitude: 46.151241, Longitude: 14.995462999999997));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Somalia', Latitude: 5.152149, Longitude: 46.199616));
      mapCoordinates.add(MapCoordinates(Country_Name: 'South_Africa', Latitude: -30.559482000000003, Longitude: 22.937506));
      mapCoordinates.add(MapCoordinates(Country_Name: 'South_Sudan', Latitude: 6.876991899999999, Longitude: 31.3069788));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Spain', Latitude: 40.46366700000001, Longitude: -3.7492199999999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Sri_Lanka', Latitude: 7.873053999999999, Longitude: 80.77179699999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'St_Barth', Latitude: 17.9, Longitude: -62.833332999999996));
      mapCoordinates.add(MapCoordinates(Country_Name: 'St_Vincent_Grenadines', Latitude: 12.984304999999999, Longitude: -61.287228));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Sudan', Latitude: 12.862807, Longitude: 30.217636));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Suriname', Latitude: 3.919305, Longitude: -56.027783));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Sweden', Latitude: 60.128161000000006, Longitude: 18.643501));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Switzerland', Latitude: 46.818188, Longitude: 8.227511999999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Syria', Latitude: 34.802074999999995, Longitude: 38.996815));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Taiwan', Latitude: 23.69781, Longitude: 120.96051500000002));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Tanzania', Latitude: -6.369028, Longitude: 34.888822));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Thailand', Latitude: 15.870032000000002, Longitude: 100.99254099999999));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Timor-Leste', Latitude: -8.874217, Longitude: 125.72753900000001));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Togo', Latitude: 6.1256261, Longitude: 1.2254182999999998));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Trinidad_and_Tobago', Latitude: 10.691803, Longitude: -61.222502999999996));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Tunisia', Latitude: 33.886917, Longitude: 9.537499));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Turkey', Latitude: 38.963744999999996, Longitude: 35.243322));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Turks_and_Caicos', Latitude: 21.694025, Longitude: -71.797928));
      mapCoordinates.add(MapCoordinates(Country_Name: 'UAE', Latitude: 23.424076, Longitude: 53.847818000000004));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Uganda', Latitude: 1.373333, Longitude: 32.290275));
      mapCoordinates.add(MapCoordinates(Country_Name: 'UK', Latitude: 55.378051, Longitude: -3.4359729999999997));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Ukraine', Latitude: 48.379433, Longitude: 31.1655799));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Uruguay', Latitude: -32.522779, Longitude: -55.765834999999996));
      mapCoordinates.add(MapCoordinates(Country_Name: 'USA', Latitude: 37.09024, Longitude: -95.712891));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Uzbekistan', Latitude: 41.377491, Longitude: 64.585262));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Vatican_City', Latitude: 41.902916, Longitude: 12.453389000000001));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Venezuela', Latitude: 6.42375, Longitude: -66.58973));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Vietnam', Latitude: 14.058324, Longitude: 108.277199));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Western_Sahara', Latitude: 24.215526999999998, Longitude: -12.885834));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Yemen', Latitude: 15.552727, Longitude: 48.516388));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Zambia', Latitude: -13.133897, Longitude: 27.849332));
      mapCoordinates.add(MapCoordinates(Country_Name: 'Zimbabwe', Latitude: -19.015438, Longitude: 29.154857));
    });

  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(country);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        searchItem.clear();
        searchItem.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        searchItem.clear();
        searchItem.addAll(country);
      });
    }

  }

  Widget appBar(){
    return Container(
      height: 65,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                'Select Country',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent[700],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  void getCountryName() async{
    String data = await _read();
    String countryName = data.split(' ')[0];
    int index = int.parse(data.split(' ')[1]);
    print('CountryName written in txt: $data');
    Navigator.pushReplacementNamed(context, '/loading', arguments: {
      'country_name' : countryName,
      'getMapData' : mapCoordinates,
      'country_index': index,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent[700],
        body: Column(
          children: <Widget>[
            appBar(),
          ],
        ),

      ),
    );
  }
}
