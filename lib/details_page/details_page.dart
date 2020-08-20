import 'package:flutter/material.dart';
import 'package:ui_challenge_3/colors.dart';
import 'package:ui_challenge_3/custom_extensions.dart';
import 'package:ui_challenge_3/main_page.dart';

class DetailsPage extends StatelessWidget {
  String name;
  String sname;
  String price;
  String image;
  Gradient grad;
  DetailsPage({this.name, this.sname, this.price, this.image, this.grad});
  String description = 'A COVID-19 vaccine manufacturing plant os the institute in Kungming, capital city Yunnan Province, will be put into use in the second half of 2020';
  //
  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bg_color,
      body: Column(
        children: [
          Container(
            height: scrSize.width - 70,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  height: scrSize.width - 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    gradient: card_gradient_yellow,
                    // color: Colors.orange,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ],
                  ).padding(EdgeInsets.only(top: 10, left: 10, right: 10)),
                ),
                Positioned(
                  top: 30,
                  left: 55,
                  child: Image.asset(
                    image,
                    scale: 1.4,
                  ),
                ),
              ],
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontFamily: "Segoe UI",
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: Color(0xffffffff),
            ),
          ),
          sname.makeTextCS(),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white, letterSpacing: 1),
          ).padding(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Divider(
                  color: Colors.white.withOpacity(0.4),
                  thickness: 1.0,
                ).expanded(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: price.makeTextCardPrice(),
              ),
              Container(
                child: Divider(
                  color: Colors.white.withOpacity(0.4),
                  thickness: 1.0,
                ).expanded(),
              ),
            ],
          ).padding(EdgeInsets.symmetric(horizontal: 40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TabBarButton(name: '50 ml', width: 100),
              TabBarButton(name: '100 ml', width: 100),
              TabBarButton(name: '150 ml', width: 100),
            ],
          ),
          ItemCounter(),
          AddToBucketBtn(),
        ],
      ),
    );
  }
}

class ItemCounter extends StatefulWidget {
  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int itemCount = 1;
  _incrementCounter() {
    setState(() {
      return ++itemCount;
    });
  }

  _decrementCounter() {
    setState(() {
      return --itemCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7),
      width: 194.0,
      height: 64.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.0),
        color: Color(0xff49494b),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 53.0,
            height: 52.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              color: Color(0xff6d6d6f),
            ),
            child: IconButton(
              onPressed: () {
                _decrementCounter();
              },
              icon: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
          itemCount.toString().makeTextCH(),
          Container(
            width: 53.0,
            height: 52.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _incrementCounter();
                });
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class AddToBucketBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      alignment: Alignment.center,
      width: 433.0,
      height: 66.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Color(0xffffd35a),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_basket_outlined),
          Text(
            'Add to bucket',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
