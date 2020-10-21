import 'package:flutter/material.dart';
import 'package:shop_app/detailsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.grey[300],
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400], blurRadius: 10, spreadRadius: 1)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildBottomButtons(Icons.card_giftcard),
                buildBottomButtons(Icons.shopping_bag),
                buildBottomButtons(Icons.home, isSelected: true),
                buildBottomButtons(Icons.favorite),
                buildBottomButtons(Icons.settings)
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 50,
          backgroundColor: Colors.grey[300],
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 16),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Shopping ',
                  style: TextStyle(fontSize: 28, letterSpacing: 1),
                ),
                Text(
                  'Anthropologie',
                  style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildFlatButton('Home Decor', isSelected: true),
                buildFlatButton('Bath & Body'),
                buildFlatButton('Beauty')
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        spreadRadius: 1,
                        blurRadius: 20),
                  ],
                  color: Colors.grey[200],
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40))),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildColumn("Candles", isSelected: true),
                        buildColumn("Vases"),
                        buildColumn("Bins"),
                        buildColumn("Floral"),
                        buildColumn("Decor"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyCandels(),
                    LineBar(),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            'Holiday Special',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            'View All',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildBottomContainer(
                              "4", "Coconut Milk\nBath Soak", "16 oz", "\$ 28"),
                          buildBottomContainer("4", "Caramel Sugar\nBath Soak",
                              "12 oz", "\$ 17"),
                          buildBottomContainer(
                              "4", "Pine Milk\nBath Soak", "20 oz", "\$ 33"),
                          buildBottomContainer(
                              "4", "Grape Date\nBath Soak", "32 oz", "\$ 50"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Container buildBottomButtons(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1)]
              : [],
          color: isSelected ? Colors.pink[200] : Colors.white,
          shape: BoxShape.circle),
      height: 50,
      width: 50,
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }

  Container buildBottomContainer(
      String img, String title, String subtitle, String price) {
    return Container(
      height: 130,
      width: 230,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                  height: 120,
                  width: 100,
                  child: Image.asset("images/candel$img.jpg"))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                Spacer(),
                Text(
                  price,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildColumn(String text, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey, fontSize: 17),
        ),
        SizedBox(
          height: 5,
        ),
        if (isSelected)
          Container(
            height: 5,
            width: 5,
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          )
      ],
    );
  }

  FlatButton buildFlatButton(String text, {bool isSelected = false}) {
    return FlatButton(
      shape: StadiumBorder(),
      color: isSelected ? Colors.pink[100] : Colors.grey[400],
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black, fontSize: 18),
      ),
    );
  }
}

class MyCandels extends StatelessWidget {
  const MyCandels({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildColumnImage("1", "Elemental Tin Candel", "24", context),
          buildColumnImage("2", "Summer Candel", "43", context),
          buildColumnImage("3", "Winter Candel", "17", context),
          buildColumnImage("4", "Dummy Candel", "5", context),
        ],
      ),
    );
  }

  GestureDetector buildColumnImage(
      String img, String title, String price, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsPage();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                height: 180,
                width: 140,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "images/candel$img.jpg",
                      fit: BoxFit.cover,
                    ))),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Text('\$ $price', style: TextStyle(fontSize: 14))
          ],
        ),
      ),
    );
  }
}

class LineBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 5,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      color: Colors.grey[400],
      child: Container(
        height: 5,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
      ),
    );
  }
}
