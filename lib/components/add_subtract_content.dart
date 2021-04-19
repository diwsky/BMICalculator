import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class AddSubtractContent extends StatelessWidget {
  AddSubtractContent(
      {this.title,
      this.units,
      this.variables,
      this.onSubtractPressed,
      this.onAddPressed});
  String title;
  String units;
  int variables;
  Function onSubtractPressed;
  Function onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: kCustomTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              variables.toString(),
              style: kHeightTextStyle,
            ),
            Text(
              units,
              style: kCustomTextStyle,
            )
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onSubtractPressed,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundedIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onAddPressed,
            ),
          ],
        )
      ],
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      fillColor: kGreyColor,
      shape: CircleBorder(),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
    );
  }
}
