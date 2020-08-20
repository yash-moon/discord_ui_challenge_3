import 'package:flutter/material.dart';
import 'package:ui_challenge_3/bottom_bar.dart';
import 'package:ui_challenge_3/colors.dart';
import 'package:ui_challenge_3/custom_extensions.dart';
import 'package:ui_challenge_3/details_page/details_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg_color,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: 'Home'.makeTextH1(),
        actions: [
          Image.network('https://assets1.lottiefiles.com/avatars/300_3700.jpg') //
              .borderRadius(BorderRadius.circular(15))
              .padding(EdgeInsets.all(8)),
        ],
      ),
      backgroundColor: bg_color,
      body: Stack(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(children: [
                  TabBarButton(name: 'Vaccine', width: 100),
                  TabBarButton(name: 'Sanitizer', width: 100),
                  TabBarButton(name: 'Mask', width: 70),
                  TabBarButton(name: 'Gloves', width: 90),
                ]),
              ),
              Container(
                // mid section
                margin: EdgeInsets.only(top: 25),
                color: Colors.transparent,
                height: scrSize.height - 500,
                child: SingleChildScrollView(
                  child: MedicineCard(),
                ),
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Sanitization'.makeTextCH(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                      print('all tapped');
                    },
                    child: 'All'.makeTextCH(),
                  )
                ],
              ).padding(EdgeInsets.symmetric(horizontal: 25)),
              //
              BottomCategory(isExpanded),
            ],
          ),
          //bottom nav bar custom
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            left: 20,
            right: 20,
            bottom: isExpanded ? 10 : 50,
            child: MyBottomBar() //
                .padding(EdgeInsets.symmetric(horizontal: 10)),
          ),
        ],
      ),
    );
  }
}

class TabBarButton extends StatefulWidget {
  String name = 'button';
  double width = 110;
  TabBarButton({this.name, this.width});
  @override
  _TabBarButtonState createState() => _TabBarButtonState();
}

class _TabBarButtonState extends State<TabBarButton> {
  var tabBarItems = ['Vaccine', 'Sanitizer', 'Mask', 'Gloves'];
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        print('tabbar pressed');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        alignment: Alignment.center,
        height: 40,
        width: widget.width,
        decoration: isSelected ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)) : BoxDecoration(color: tabBar_btn_notSelected, borderRadius: BorderRadius.circular(12)),
        child: Text(
          widget.name,
          style: TextStyle(
            color: isSelected == true ? Colors.black : Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.teal,
      child: Row(
        children: [
          Icon(
            Icons.menu,
          ),
          'Home'.makeTextH1(),
        ],
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    m_card({String name, String s_name, String price, String image, Gradient grad}) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                    name: name,
                    sname: s_name,
                    price: price,
                    grad: grad,
                    image: image,
                  )));
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
          width: scrSize.width * 0.64,
          height: scrSize.width * 0.85,
          // color: Colors.blueAccent,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 55),
                // width: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.0),
                  gradient: grad,
                ),
              ),
              Positioned(
                child: Image.asset(
                  image,
                  scale: 1.9,
                ).padding(EdgeInsets.only(left: 38, bottom: 0)),
              ),
              Positioned(
                left: 60,
                bottom: 30,
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      name.makeTextCH(),
                      s_name.makeTextCS(),
                      price.makeTextCardPrice(),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 195,
                  bottom: 20,
                  child: Container(
                    height: 52.00,
                    width: 52.00,
                    decoration: BoxDecoration(
                      color: Color(0xffffd35a),
                      borderRadius: BorderRadius.circular(12.00),
                    ),
                    child: Icon(Icons.shopping_basket),
                  )),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          m_card(name: 'Pro-Vac Venco', s_name: 'by baximco', price: '\$34.50', image: 'assets/pro-vac.png', grad: card_gradient_yellow),
          m_card(name: 'Disease', s_name: 'by b1 Strain', price: '\$21.44', image: 'assets/live-b1-scaled.png', grad: card_gradient_pink),
        ],
      ),
    );
  }
}

class BottomCategory extends StatelessWidget {
  final bool isExpanded;
  BottomCategory(this.isExpanded);

  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    //
    card({String name, String imgPath, Gradient gradient}) {
      return Container(
        width: scrSize.width / 2,
        height: scrSize.width / 2 + 15,
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: name.makeTextSmallCard(),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              // width: 180,
              // height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                gradient: gradient,
              ),
            ),
            Positioned(
              top: 75,
              left: 30,
              child: Image.asset(
                imgPath,
                scale: (scrSize.height / scrSize.width) * 2.8,
              ),
            ),
          ],
        ),
      );
    }

    //
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
          // height: 300,
          width: scrSize.width,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    card(
                      name: 'Mask',
                      imgPath: 'assets/kn95-mask-scaled.png',
                      gradient: small_card_grad_white,
                    ),
                    card(
                      name: 'Gloves',
                      imgPath: 'assets/gloves.png',
                      gradient: small_card_grad_blue,
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: isExpanded ? true : false,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        card(
                          name: 'Gloves',
                          imgPath: 'assets/gloves.png',
                          gradient: small_card_grad_blue,
                        ),
                        card(
                          name: 'Mask',
                          imgPath: 'assets/kn95-mask-scaled.png',
                          gradient: small_card_grad_white,
                        ),
                      ],
                    ),
                  ))
            ],
          )),
    ).expanded();
  }
}
