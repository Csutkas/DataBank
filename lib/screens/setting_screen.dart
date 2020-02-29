import 'package:databank/databank_global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Components & Services
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:databank/services/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // Cupertino Picker initialization
  int selectItem = 1;
  List pickerElementsWorkersList = [
    10,
    10,
    20,
    30,
    40,
    50,
    60,
    70,
    80,
    90,
    100
  ];
  List<Widget> pickerElementsWidgetList = [
    PickerElementWidget(" "),
    PickerElementWidget("10"),
    PickerElementWidget("20"),
    PickerElementWidget("30"),
    PickerElementWidget("40"),
    PickerElementWidget("50"),
    PickerElementWidget("60"),
    PickerElementWidget("70"),
    PickerElementWidget("80"),
    PickerElementWidget("90"),
    PickerElementWidget("100"),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFf1f1f1),
        body: SingleChildScrollView(
          child: Container(
            height: ScreenUtil.getInstance().height,
            width: ScreenUtil.getInstance().width,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),

                ///// GENERAL //////
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(35),
                    ),
                    Text(
                      "GENERAL",
                      style: TextStyle(
                        fontSize: ScreenUtil(allowFontScaling: true).setSp(25),
                        fontFamily: 'SF_Pro',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF737373),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(15),
                ),

                ///// Separator line
                Container(
                  color: Color(0xFFb5b5b5),
                  height: ScreenUtil.getInstance().setHeight(1),
                ),

                ///// First row -  List size
                FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext builder) {
                          return GestureDetector(
                            child: Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height /
                                  3.2,
                              child: CupertinoPicker(
                                magnification: 1.0,
                                backgroundColor: Color(0xFFe8e8e8),
                                children: pickerElementsWidgetList,
                                itemExtent: 45, // height of each item
                                looping: false,
                                onSelectedItemChanged: (int index) {
                                  setState(() {
                                    selectItem = index;
                                    workersNumber =
                                        pickerElementsWorkersList[selectItem];
                                  });
                                },
                              ),
                            ),
                            onTap: () {
                              ShareFavourites().saveSettingsData();
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                          );
                        });
                  },
                  child: Container(
                    color: Color(0xFFffffff),
                    height: ScreenUtil.getInstance().setHeight(105),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil.getInstance().setWidth(35),
                        ),
                        Text(
                          "List size",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil(allowFontScaling: true).setSp(31),
                            fontFamily: 'SF_Pro',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF363636),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil.getInstance().setWidth(480),
                        ),
                        Text(
                          workersNumber.toString(),
                          style: TextStyle(
                            fontSize:
                                ScreenUtil(allowFontScaling: true).setSp(31),
                            fontFamily: 'SF_Pro',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF919191),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil.getInstance().setWidth(10),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color(0xFFc9c9c9),
                          size: ScreenUtil.getInstance().setSp(50),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: Color(0xFFb5b5b5),
                      height: ScreenUtil.getInstance().setHeight(1),
                      width: ScreenUtil.getInstance().setWidth(750),
                    ),
                  ],
                ),

                ////// Second Row - Personal data
                Container(
                  color: Color(0xFFffffff),
                  height: ScreenUtil.getInstance().setHeight(110),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: ScreenUtil.getInstance().setWidth(35),
                      ),
                      Text(
                        "Enable personal data ",
                        style: TextStyle(
                          fontSize:
                              ScreenUtil(allowFontScaling: true).setSp(31),
                          fontFamily: 'SF_Pro',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF363636),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil.getInstance().setWidth(280),
                      ),
                      Container(
                        color: Color(0xFFffffff),
                        child: CupertinoSwitch(
                          value: letPersonalData,
                          onChanged: (bool value) {
                            setState(() {
                              letPersonalData = value;
                              ShareFavourites().saveSettingsData();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: Color(0xFFb5b5b5),
                      height: ScreenUtil.getInstance().setHeight(1),
                      width: ScreenUtil.getInstance().setWidth(750),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PickerElementWidget extends StatelessWidget {
  const PickerElementWidget(this.element);

  final String element;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        element,
        style: TextStyle(
          fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
          fontFamily: 'Museo_Sans',
          fontWeight: FontWeight.w500,
          color: Color(0xFF363636),
          textBaseline: TextBaseline.alphabetic,
        ),
      ),
    );
  }
}
