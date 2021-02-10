import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  Map homeData = {};
  bool isSearched = false;
  Color selected = Colors.blueAccent[700];
  Color unselected = Colors.grey[400];



  Widget appbarTitle(){
    return Center(
      child: Text(
        'Daily Update',
        style: TextStyle(
          fontSize: 20,
          color: Colors.blue[900],
        ),
      ),
    );
  }

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
                Navigator.pop(context);
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

                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_balance,
                      size: 50,
                      color: selected,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'HOME',
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
            Divider(color: Colors.grey[600], height: 0,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: InkWell(
                onTap: (){
                    Navigator.pushNamed(context, '/map', arguments: {
                      'countryData': homeData,
                    });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.map,
                      size: 50,
                      color: unselected,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'MAP',
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
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: InkWell(
                onTap: (){
                  Navigator.popAndPushNamed(context, '/');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      size: 50,
                      color: unselected,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'CHANGE COUNTRY',
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
          ],

        ),

      ),
    );
  }

  Widget appBar(){
    return Container(
      height: 65,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Builder(
            builder: (context)=>IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu,),
              color: Colors.blue[900],
            ),
          ),

          Container(
            child: appbarTitle(),
          ),

          Builder(
            builder: (context)=>IconButton(
              onPressed: (){
                isSearched = true;
                setState(() {
                  Navigator.of(context).popAndPushNamed('/start_page');
                });
              },
              icon: Icon(Icons.refresh,),
              color: Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }

  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,10),
              child: Text("NO"),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width/2.2,),
          new GestureDetector(
            onTap: () => SystemNavigator.pop(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,20,10),
              child: Text("YES"),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    homeData = ModalRoute.of(context).settings.arguments;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: Scaffold(
          drawer: navigationDrawer(),
          body: Column(
            children: <Widget>[
              appBar(),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 120,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),

                      decoration: BoxDecoration(
                        color: Colors.blueAccent[700],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[600],
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0,10),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: (){},
                            color: Colors.white,
                            icon: Icon(Icons.arrow_back),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                homeData['country_name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: (){

                            },
                            color: Colors.white,
                            icon: Icon(Icons.arrow_forward),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),

                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent[700],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[600],
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0,10),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Death',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              letterSpacing: 1,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(homeData['new_death'], style: TextStyle(color: Colors.white, fontSize: 30),),
                                    Text(homeData['total_death'], style: TextStyle(color: Colors.white, fontSize: 30),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text('NEW', style: TextStyle(color: Colors.white, fontSize: 20),),
                                    Text('TOTAL', style: TextStyle(color: Colors.white, fontSize: 20),),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 20,),

                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent[700],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[600],
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0,10),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Cases',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              letterSpacing: 1,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(homeData['new_cases'], style: TextStyle(color: Colors.white, fontSize: 30),),
                                    Text(homeData['total_cases'], style: TextStyle(color: Colors.white, fontSize: 30),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text('NEW', style: TextStyle(color: Colors.white, fontSize: 20),),
                                    Text('TOTAL', style: TextStyle(color: Colors.white, fontSize: 20),),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width/2,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent[700],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[600],
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0,10),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              letterSpacing: 1,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(homeData['total_tests'], style: TextStyle(color: Colors.white, fontSize: 30),),
                                    Text(homeData['total_recover'], style: TextStyle(color: Colors.white, fontSize: 30),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text('TESTS', style: TextStyle(color: Colors.white, fontSize: 20),),
                                    Text('RECOVER', style: TextStyle(color: Colors.white, fontSize: 20),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),


          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('UPDATE'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('TABLE'),
              ),

            ],
            onTap: onTabTapped,
          ),
        ),
      ),
    );
  }

}
