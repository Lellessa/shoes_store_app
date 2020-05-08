import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_app/shoesPage.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10.0),
                  color: mainColor,
                  child: Column(
                    children: <Widget>[
                      SvgPicture.asset('assets/icons/logo.svg', height: 120.0, color: Colors.white,),
                      Text('Welcome Leonardo', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
                    ],
                  ),
                ),

                SizedBox(height: 15.0,),
                DrawerItens(name: 'Account', icon: 'assets/icons/user.svg',),
                DrawerItens(name: 'My Orders', icon: 'assets/icons/shop.svg',),
                DrawerItens(name: 'My Cart', icon: 'assets/icons/shopping_cart.svg',),
                DrawerItens(name: 'Wish list', icon: 'assets/icons/heart_border.svg',),

                Expanded(
                  child: Container(),
                ),                

                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Text('Logout', style: TextStyle(fontSize: 20.0, color: mainColor, fontWeight: FontWeight.bold),),
                ),

              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: MediaQuery.of(context).size.height,
                color: bgColor,
              ),
            ),

            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 20.0),
                child: Column(
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          IconButton(
                            onPressed: ()=>_drawerKey.currentState.openDrawer(),
                            icon: SvgPicture.asset('assets/icons/menu.svg', height: 25.0, color: mainColor,),
                          ),
                          SvgPicture.asset('assets/icons/logo.svg', height: 43.0, color: mainColor,),
                          SvgPicture.asset('assets/icons/shop.svg', height: 25.0, color: mainColor,),

                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 20.0, top: 20.0),
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: Offset(3, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search, color: mainColor, size: 25.0,),
                          hintText: 'Air Jordan',
                          hintStyle: TextStyle(fontSize: 18.0, color: mainColor.withOpacity(0.6)),
                        ),
                      ),
                    ),

                    CardAttraction(img1: 'assets/images/airForceInclinado.png', img2: 'assets/images/airForceInclinado2.png',),

                    Container(
                      margin: EdgeInsets.only(right: 20.0, top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Text('On Trend', style: TextStyle(color: mainColor, fontSize: 20.0, fontWeight: FontWeight.bold),),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[

                              Text('1/10', style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),),
                              CustomBar(progress: 40,),

                            ],
                          ),

                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[

                          ShoesCard(info:{
                            'name': 'Air Jordan 1', 
                            'img': 'assets/images/airJordanInclinado.png', 
                            'img2': 'assets/images/airJordan.png', 
                            'price': '329',}),
                          ShoesCard(info: {
                            'name': 'Stranger Thinks', 
                            'img': 'assets/images/strangerThinksInclinado.png', 
                            'img2': 'assets/images/strangerThinks.png', 
                            'price': '100', 
                            'isSale': true,}),
                          ShoesCard(info: {'name': 'Air Force', 
                          'img': 'assets/images/airForceInclinado.png', 
                          'img2': 'assets/images/airForce.png', 
                          'price': '318',}),
                          ShoesCard(info: {'name': 'Air VaporMax', 
                          'img': 'assets/images/vaporMaxInclinado.png', 
                          'img2': 'assets/images/vaporMax.png', 
                          'price': '249',}),

                        ],
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
}

class DrawerItens extends StatelessWidget {

  String name, icon;
  DrawerItens({this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, bottom: 20.0),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(icon, height: 20.0, color: mainColor,),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(name, style: TextStyle(fontSize: 22.0, color: mainColor),),
          ),
        ],
      ),
    );
  }
}

class ShoesCard extends StatelessWidget {

  Map<String, dynamic> info;
  ShoesCard({this.info});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoesPage(info: this.info))),
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Container(
              height: 170.0,
              width: 130.0,

              child: Stack(
                children: <Widget>[

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 130.0,
                      alignment: Alignment.centerLeft,

                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(15.0)
                      ),

                      child: (info['isSale']!=true)?Container():Sale(),
                    ),
                  ),

                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(info['img']),
                  ),

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Price(price: info['price'],),
                  ),

                ],
              ),
            ),

            SizedBox(height: 5.0,),
            Text(info['name'], style: TextStyle(color: mainColor, fontSize: 20.0, fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}

class Sale extends StatelessWidget {
  const Sale({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      margin: EdgeInsets.only(left: 5.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: contrastColor,
      ),
      child: Text('SALE'),
    );
  }
}

class Price extends StatelessWidget {

  String price;
  Price({this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Row(
            children: <Widget>[
              SvgPicture.asset('assets/icons/dollar.svg', height: 13.0, color: contrastColor,),
              Text(price, style: TextStyle(color: Colors.white, fontSize: 28.0),),
            ],
          ),

          SvgPicture.asset('assets/icons/heart.svg', height: 15.0, color: Colors.red,)

        ],
      ),
    );
  }
}

class CustomBar extends StatelessWidget {

  double progress;
  CustomBar({this.progress = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 5.0,
            width: progress,
            color: mainColor.withOpacity(0.3),
          ),
          Container(
            height: 5.0,
            width: 130-progress,
            color: mainColor.withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}

class CardAttraction extends StatelessWidget {

  String img1, img2;
  CardAttraction({this.img1, this.img2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 20.0),
      child: Stack(
        children: <Widget>[

          Image.asset(img1),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Image.asset(img2, height: 100.0),
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Nike', style: TextStyle(color: mainColor, fontSize: 35.0, fontWeight: FontWeight.bold),),
                Text('Collection', style: TextStyle(color: mainColor, fontWeight: FontWeight.w300, fontSize: 35.0),),
              ],
            ),          
          ),

        ],
      ),
    );
  }
}