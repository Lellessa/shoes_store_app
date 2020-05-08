import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main.dart';
import 'package:shoes_app/constants.dart';

class ShoesPage extends StatelessWidget {

  Map<String, dynamic> info;
  ShoesPage({this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  IconButton(
                    onPressed: ()=>Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios, size: 25.0, color: mainColor,),
                  ),
                  SvgPicture.asset('assets/icons/logo.svg', height: 43.0, color: mainColor,),
                  SvgPicture.asset('assets/icons/shop.svg', height: 25.0, color: mainColor,),

                ],
              ),
            ),

            Stack(
              children: <Widget>[

                Container(
                  height: 230.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white10, bgColor])
                    ),
                  child: Image.asset(
                    info['img2'],
                    fit: BoxFit.cover,
                  ),
                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Sale(),
                        SvgPicture.asset('assets/icons/heart.svg', color: Colors.red, height: 25.0,)
                      ],
                    ),
                  ),
                ),


              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    LittleBar(),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Text(info['name'], style: TextStyle(color: mainColor, fontSize: 23.0, fontWeight: FontWeight.bold),),
                              Stars(),

                            ],
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text('Inspired by the original that debuted in 1985, the Air Jordan 1 Low offers a clean, classic look that\'s familiar yet always fresh.', style: TextStyle(fontSize: 16.0, color: Colors.black54),),
                          ),

                          Text('Size', style: TextStyle(color: mainColor, fontSize: 20.0, fontWeight: FontWeight.bold),),

                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Size(size: '5',),
                                Size(size: '5.5',),
                                Size(size: '6',),
                                Size(size: '6.5', isActive: true,),
                                Size(size: '7',),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.0),
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
                      ),
                      child: Column(
                        children: <Widget>[

                          LittleBar(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Text('Reviews 39', style: TextStyle(color: mainColor, fontSize: 20.0, fontWeight: FontWeight.bold),),

                              Expanded(
                                child: Stack(
                                  children: <Widget>[
                                    
                                    ReviewCard(image: 'assets/images/people_1.png', margin: 30.0,),  
                                    ReviewCard(image: 'assets/images/people_2.png', margin: 70.0,),  
                                    ReviewCard(image: 'assets/images/people_3.png', margin: 110.0,),  
                                    ReviewCard(image: 'assets/images/people_4.png', margin: 150.0,),  

                                  ],
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          //$100
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Row(
                              children: <Widget>[

                                SvgPicture.asset('assets/icons/dollar.svg', height: 15.0, color: mainColor,),
                                Text('100', style: TextStyle(fontSize: 30.0, color: mainColor, fontWeight: FontWeight.bold),),

                              ],
                            ),
                          ),

                          //Add Cart
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.add, size: 20.0, color: contrastColor,),
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: Text('Add To Cart', style: TextStyle(fontSize: 18.0, color: contrastColor),),
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
            ),

          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {

  String image;
  double margin;

  ReviewCard({this.image, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      margin: EdgeInsets.only(left: margin),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: Colors.white),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
    );
  }
}

class LittleBar extends StatelessWidget {
  const LittleBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.0,
      width: 40.0,
      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black38,
      ),
    );
  }
}

class Size extends StatelessWidget {

  String size;
  bool isActive;

  Size({this.size, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      alignment: Alignment.center,

      decoration: BoxDecoration(
        color: (isActive)?mainColor:null,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: mainColor, width: 2.0),
      ),
      child: Text(size, style: TextStyle(color: (isActive)?contrastColor:null, fontSize: 16.0, fontWeight: FontWeight.bold),),
    );
  }
}

class Stars extends StatelessWidget {
  const Stars({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: contrastColor,),
        Icon(Icons.star, color: contrastColor,),
        Icon(Icons.star, color: contrastColor,),
        Icon(Icons.star, color: contrastColor,),
        Icon(Icons.star_border, color: contrastColor,),
      ],
    );
  }
}