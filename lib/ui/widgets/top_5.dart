import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:covid_19_tracker_in_flutter/models/result.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';

class TopContainer extends StatefulWidget {
  final List<CountryResult> countryList;

  const TopContainer({
    Key key,
    @required this.countryList,
  }) : super(key: key);

  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .45,
        width: MediaQuery.of(context).size.width * .9,
        decoration: _containerBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(left: 20.0), child: Text(AppStrings.kureselDurumilk5, style: _headerTextStyle)),
              _casesRowIcons,
              _countryStatus(0),
              _countryStatus(1),
              _countryStatus(2),
              _countryStatus(3),
              _countryStatus(4),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _casesRowIcons {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width * .15),
          _casesRow(FontAwesomeIcons.procedures, AppColors.colorDarkBlue),
          _casesRow(FontAwesomeIcons.procedures, AppColors.colorDarkRed),
          _casesRow(Icons.add_box, AppColors.colorGreen),
        ],
      ),
    );
  }

  Widget _countryStatus(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text((widget.countryList[index].countryName), style: _countryNameTextStyle),
          SizedBox(),
          Text(widget.countryList[index].totalCases.toString(), style: _countryCaseTextStyle(AppColors.colorDarkBlue)),
          Text(widget.countryList[index].totalDeaths.toString(), style: _countryCaseTextStyle(AppColors.colorDarkRed)),
          Text(widget.countryList[index].totalRecovered.toString(), style: _countryCaseTextStyle(AppColors.colorGreen)),
        ],
      ),
    );
  }

  BoxDecoration get _containerBoxDecoration => BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 8)]);
  TextStyle get _headerTextStyle => GoogleFonts.openSans(color: AppColors.colorDarkBlue, letterSpacing: 0.68, fontWeight: FontWeight.w700, fontSize: 14);
  TextStyle get _countryNameTextStyle => GoogleFonts.openSans(color: AppColors.colorDarkRed, fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle _countryCaseTextStyle(Color _color) => GoogleFonts.openSans(color: _color, fontSize: 14, fontWeight: FontWeight.bold);
  Widget _casesRow(IconData _icon, Color _color) => FaIcon(_icon, size: 20, color: _color);
}
