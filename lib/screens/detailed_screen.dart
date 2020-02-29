import 'package:databank/databank_global_variables.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

// Components & Services
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedScreen extends StatefulWidget {
  DetailedScreen(
    this.titleName,
    this.firstName,
    this.lastName,
    this.largePicture,
    this.nationality,
    this.gender,
    this.phone,
    this.email,
    this.locationCity,
    this.locationCountry,
    this.dobDate,
    this.dobAge,
  );

  final titleName;
  final firstName;
  final lastName;
  final largePicture;
  final nationality;
  final gender;
  final phone;
  final email;
  final locationCity;
  final locationCountry;
  final dobDate;
  final dobAge;

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  personalDataHandler() {
    if (letPersonalData) {
      return Column(
        children: <Widget>[
          LineLabelWidget("Personal data"),
          LineDataWidget(Icons.folder_shared, "Age", widget.dobAge.toString(),
              Color(0xFF03729e), false),
        ],
      );
    } else {
      return Container();
    }
  }

  _buildGenderIcon(gender) {
    if (gender == "female") {
      return CommunityMaterialIcons.human_female;
    } else if (gender == "male") {
      return CommunityMaterialIcons.human_male;
    } else {
      return CommunityMaterialIcons.human;
    }
  }

  @override
  Widget build(BuildContext context) {
    var nationality = widget.nationality.toLowerCase();
    // Initialize Screen util
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);

    return Scaffold(
      backgroundColor: Color(0xFFf1f1f1),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil.getInstance().setHeight(90)),
        child: AppBar(
          brightness: Brightness.light, // status bar color
          iconTheme: IconThemeData(
            size: 1,
            color: Color(0xFF03729e),
          ),
          backgroundColor: Color(0xFFf8f8f8),
          elevation: 0.0,
          title: Text(
            "Worker's data",
            style: TextStyle(
              fontSize: ScreenUtil(allowFontScaling: true).setSp(34),
              fontFamily: 'SF_Pro',
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),

          bottom: PreferredSize(
            child: Container(
              color: Color(0xFFb5b5b5),
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(4.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(60),
              ),
              Row(
                children: <Widget>[
                  ///// NAMING /////
                  Container(
                    width: ScreenUtil.getInstance().setWidth(440),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Text(
                            widget.lastName + " " + widget.firstName,
                            style: TextStyle(
                              fontSize:
                                  ScreenUtil(allowFontScaling: true).setSp(62),
                              fontFamily: 'SF_Pro',
                              fontWeight: FontWeight.w200,
                              color: Color(0xFF363636),
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),

                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(25),
                        ),

                        // COUNTRY FLAG //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'icons/flags/png/$nationality.png',
                              package: 'country_icons',
                              scale: 2,
                            ),
                            SizedBox(
                              width: ScreenUtil.getInstance().setWidth(25),
                            ),
                            // GENDER ICON //
                            Container(
                              child: Icon(
                                _buildGenderIcon(
                                  widget.gender,
                                ),
                                size: ScreenUtil.getInstance().setSp(60),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///// PICTURE /////
                  Container(
                    width: ScreenUtil.getInstance().setWidth(270),
                    height: ScreenUtil.getInstance().setWidth(300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70.0),
                            child: Image.network(widget.largePicture),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                ],
              ),

              SizedBox(
                height: ScreenUtil.getInstance().setHeight(70),
              ),

              ///// RESIDENCY /////
              LineLabelWidget("Residency"),

              // COUNTRY //
              LineDataWidget(Icons.location_on, "Country",
                  widget.locationCountry, Color(0xFF363636), false),

              // CITY //
              LineDataWidget(Icons.location_city, "City", widget.locationCity,
                  Color(0xFF363636), false),

              SizedBox(
                height: ScreenUtil.getInstance().setHeight(60),
              ),

              ///// CONTACT /////
              LineLabelWidget("Contact"),

              // PHONE //
              LineDataWidget(
                  Icons.phone, "Phone", widget.phone, Color(0xFF03729e), false),

              // EMAIL //
              LineDataWidget(
                  Icons.email, "Email", widget.email, Color(0xFF03729e), true),

              ///// PERSONAL DATA /////
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(60),
              ),
              personalDataHandler(),
            ],
          ),
        ),
      ),
    );
  }
}

class LineLabelWidget extends StatelessWidget {
  LineLabelWidget(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: ScreenUtil.getInstance().setWidth(40),
            ),
            Container(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: ScreenUtil(allowFontScaling: true).setSp(48),
                  fontFamily: 'SF_Pro',
                  fontWeight: FontWeight.w200,
                  color: Color(0xFF363636),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(23),
        ),
      ],
    );
  }
}

class LineDataWidget extends StatelessWidget {
  LineDataWidget(
      this.icon, this.lineLabel, this.lineData, this.dataColor, this.isLink);

  final icon;
  final String lineLabel;
  final lineData;
  final Color dataColor;
  final bool isLink;

  emailHandler() {
    if (isLink) {
      return "mailto:" + lineData.toString();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: ScreenUtil.getInstance().setWidth(70),
            ),
            Container(
              child: Icon(
                icon,
                size: ScreenUtil.getInstance().setSp(40),
                color: Color(0xFF838383),
              ),
            ),
            SizedBox(
              width: ScreenUtil.getInstance().setWidth(20),
            ),
            Container(
              child: Text(
                lineLabel + ":   ",
                style: TextStyle(
                  fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
                  fontFamily: 'SF_Pro',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9a9a9a),
                ),
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
            ),
            Container(
              child: Flexible(
                child: InkWell(
                  child: Text(
                    lineData,
                    style: TextStyle(
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(35),
                      fontFamily: 'SF_Pro',
                      fontWeight: FontWeight.w500,
                      color: dataColor,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                  onTap: () => launch(emailHandler()),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(23),
        ),
      ],
    );
  }
}
