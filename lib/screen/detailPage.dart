import 'package:flutter/material.dart';
import 'package:plant_shop/helper.dart';
import 'package:plant_shop/model/icon_model.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String image;
  DetailPage({this.image});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double _value = 1;
  void _setValue(double value) {
    setState(() {
      _value = value;
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSelectImage(mq),
              SizedBox(
                height: 8,
              ),
              Center(
                  child: Text(
                "Ca-Tiax",
                style: bold,
              )),
              buildHorizontalChoose(mq),
              buildHorzontalIconText(mq),
              buildText(),
              buildSlider(),
              buildRowText(),
              SizedBox(
                height: mq.height * 0.09,
              ),
              buildListView(mq),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSelectImage(Size mq) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: mq.height * 0.3,
          width: 250,
          child: Image.asset(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: OutlinedButton(
          style: OutlinedButton.styleFrom(
              minimumSize: Size(100, 70),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
      elevation: 0,
    );
  }

  Widget buildListView(Size mq) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(18)),
        alignment: Alignment.center,
        height: mq.height * 0.09,
        width: mq.width,
        child: ListTile(
          leading: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white, minimumSize: Size(60, 50)),
              onPressed: () {},
              child: Icon(
                Icons.alarm,
                color: Colors.grey,
                size: 33,
              )),
          title: Text(
            "Configure an alert",
            // style: textStyle4,
          ),
          trailing: Icon(
            Icons.more_vert,
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }

  Widget buildRowText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Too Dry"),
        Text("Healthy"),
        Text("Too wet"),
      ],
    );
  }

  Widget buildSlider() {
    return Slider(
      min: 1,
      max: 100,
      divisions: 3,
      value: _value,
      onChanged: _setValue,
    );
  }

  Widget buildText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15),
      child: Text(
        "Volumetric soil\nmoisture content",
        style: newStyle,
      ),
    );
  }

  Widget buildHorzontalIconText(Size mq) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 2),
      child: Container(
        height: mq.height * 0.12,
        // color: Colors.grey,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: iconText.length,
            itemBuilder: (_, index) {
              return Container(
                alignment: Alignment.center,
                height: mq.height * 0.1,
                width: 95,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(elevation: 8, child: iconText[index].iconImage),
                    Text(
                      iconText[index].iconName,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget buildHorizontalChoose(Size mq) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15),
      child: Container(
        height: mq.height * 0.05,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: chooseText.length,
          itemBuilder: (_, index) {
            if (chooseText[index] == chooseText[0]) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(20, 50),
                          backgroundColor: Colors.grey[100],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Icon(Icons.add)),
                  SizedBox(
                    width: 5,
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.blue,
                        height: 50,
                        width: 120,
                        child: Text(
                          chooseText[2],
                          style: textStyle4,
                        )),
                  ),
                ],
              );
            } else {
              Container(
                  alignment: Alignment.center,
                  color: Colors.orange,
                  height: 40,
                  width: 120,
                  child: Text(
                    chooseText[2],
                    style: textStyle4,
                  ));
            }
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 120,
                  child: Text(
                    chooseText[index],
                    style: textStyle5,
                  )),
            );
          },
        ),
      ),
    );
  }
}
