import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Icontext {
  String iconName;
  Icon iconImage;

  Icontext({this.iconName, this.iconImage});
}

List<String> chooseText = ["Living Room", "Bedroom", "Kitchen", "Bathroom"];
List<Icontext> iconText = [
  Icontext(
      iconName: "Moisture",
      iconImage: Icon(
        FontAwesomeIcons.egg,
        size: 50,
      )),
  Icontext(
      iconName: "Temperature",
      iconImage: Icon(
        FontAwesomeIcons.thermometerEmpty,
        size: 50,
      )),
  Icontext(
      iconName: "Nutrient",
      iconImage: Icon(
        FontAwesomeIcons.seedling,
        size: 50,
      )),
  Icontext(
      iconName: "Sunlight",
      iconImage: Icon(
        FontAwesomeIcons.cloudSun,
        size: 50,
      )),
];
