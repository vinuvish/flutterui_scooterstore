import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterui_scooterstore/models/scooter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightMain = 655;
  double _heightDetails = 90;
  bool isShowMain;

  List<Scooter> listScooter = [
    Scooter(name: 'Fold in 1 second', imageUrl: 'assets/images/scooter2.png'),
    Scooter(name: 'Up to 193 cm', imageUrl: 'assets/images/scooter3.png'),
    Scooter(name: 'Handle Break', imageUrl: 'assets/images/scooter4.png')
  ];

  @override
  void initState() {
    isShowMain = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    // _heightMain = _size.height * 0.80;
    // _heightDetails = _size.height * 0.11;

    return Scaffold(
      backgroundColor: Color(0xff7654ff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        leading: Icon(
          Icons.menu_outlined,
          color: Colors.black,
          size: 30,
        ),
        title: Text(
          'Adult Scooters',
          textScaleFactor: 1.0,
          style: TextStyle(color: Colors.black, letterSpacing: .05),
        ),
        actions: [
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              height: _heightMain,
              duration: Duration(milliseconds: 300),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (isShowMain)
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: _size.height * 0.05),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 50),
                                    height: _size.height * 0.31,
                                    width: _size.height * 0.32,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: _size.height * 0.4,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/scooter1.png'))),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 5; i++)
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  height: i == 2 ? 8 : 5,
                                  width: i == 2 ? 8 : 5,
                                  decoration: BoxDecoration(
                                      color:
                                          i == 2 ? Colors.indigo : Colors.grey,
                                      shape: BoxShape.circle),
                                )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Oxelo Town 9',
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '€120,99',
                            style: TextStyle(
                                wordSpacing: 1,
                                fontSize: 20,
                                color: Colors.indigo,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Easy Fold Adult Scooter will transform the way you commute ...',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 0),
              height: _heightDetails,
              child: Column(
                children: [
                  if (isShowMain)
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Show Details',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {
                              isShowMain = false;
                              _heightMain = 180;
                              _heightDetails = 600;
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(Icons.arrow_downward_outlined),
                            ),
                          )
                        ],
                      ),
                    ),
                  if (!isShowMain)
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Key Features',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (Scooter scooter in listScooter)
                                  Card(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    color: Color(0xff583fbc),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: _size.height * 0.2,
                                          width: _size.width * 0.35,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      scooter.imageUrl))),
                                        ),
                                        Container(
                                          height: 45,
                                          width: _size.width * 0.35,
                                          decoration: BoxDecoration(
                                              color: Color(0xff602fb5),
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(15),
                                                  bottomLeft:
                                                      Radius.circular(15))),
                                          child: Center(
                                            child: Text(
                                              scooter.name,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Specaification Rate',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Wheel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    width: 200,
                                    child: LinearProgressIndicator(
                                      value: 0.6,
                                      backgroundColor: Color(0xff583fbc),
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  ),
                                  Text(
                                    '200 mm',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Weight',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    width: 200,
                                    child: LinearProgressIndicator(
                                      value: 0.3,
                                      backgroundColor: Color(0xff583fbc),
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  ),
                                  Text(
                                    '5.6 kg',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Speed',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    width: 200,
                                    child: LinearProgressIndicator(
                                      value: 0.9,
                                      backgroundColor: Color(0xff583fbc),
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  ),
                                  Text(
                                    '9.5/10',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.orange,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Buy Now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(Icons.arrow_right_alt_rounded),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
