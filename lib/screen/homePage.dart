import 'package:flutter/material.dart';
import 'package:plant_shop/helper.dart';
import 'package:plant_shop/model/plant_model.dart';
import 'package:plant_shop/screen/detailPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/back-two.png'), fit: BoxFit.cover),
            ),
            child: Container(
              height: mq.height,
              width: mq.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTopAppBar(mq),
                  SizedBox(height: mq.height * 0.10),
                  buildText(name: "Plant\nSensors", choose: textStyle1),
                  buildText(
                      name: "It tells you when your plant\nneeds water",
                      choose: textStyle2),
                  SizedBox(
                    height: mq.height * 0.02,
                  ),
                  buildImageScroll(mq),
                  SizedBox(height: 10),
                  buildText(
                      name: "Track temperature, soil nutrition and\nmoisture",
                      choose: textStyle3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTopAppBar(Size mq) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 15),
      child: Container(
        height: mq.height * 0.07,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("me.", style: textStyle),
          Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white30,
                    side: BorderSide(color: Colors.white),
                    primary: Colors.white,
                    minimumSize: Size(20, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: Icon(
                  Icons.dashboard,
                ),
              ),
              SizedBox(width: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    'assets/topimg.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildImageScroll(Size mq) {
    return Padding(
      padding: const EdgeInsets.only(left: 45),
      child: Container(
        height: mq.height * 0.4,
        width: mq.width,
        child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: plant.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailPage(
                                image: plant[0].img,
                              )));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: mq.height * 0.4,
                    width: 250,
                    child: Image.asset(
                      plant[index].img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget buildText({String name, TextStyle choose}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Text(
        name,
        style: choose,
      ),
    );
  }
}
