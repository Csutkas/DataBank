import 'package:flutter/material.dart';

// Screens
import 'package:databank/screens/detailed_screen.dart';

// Components & Services
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:databank/services/worker_data.dart';
import 'package:databank/services/worker_data_collector.dart';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> with TickerProviderStateMixin {
  var workerData;
  var workersAllData = [];
  @override
  void initState() {
    // Get workers data
    getAllData();

    super.initState();
  }

  Future getAllData() async {
    WorkerModel workerModel = WorkerModel();

    workersAllData = await workerModel.getWorkerData();

    setState(() {});
  }

  Widget _buildWorkersBody(listFunction) {
    setState(() {});
    return Container(
      height: ScreenUtil.getInstance().height,
      child: SingleChildScrollView(
        child: Container(
          width: ScreenUtil.getInstance().width,
          //height: ScreenUtil.getInstance().height,
          color: Color(0xFFffffff),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            ///// FAVOURITE LINES /////
            children: listFunction,
            //children: stationLineWidgetList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initialize Screen util
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);

    List<Widget> workersLineWidgetList() {
      List<Widget> list = new List();
      for (var i = 0; i < workersAllData.length; i++) {
        list.add(
          WorkersLineWidget(
            Results.fromJson(workersAllData[i]).name.title,
            Results.fromJson(workersAllData[i]).name.first,
            Results.fromJson(workersAllData[i]).name.last,
            Results.fromJson(workersAllData[i]).picture.thumbnail,
            Results.fromJson(workersAllData[i]).picture.large,
            Results.fromJson(workersAllData[i]).nat,
            Results.fromJson(workersAllData[i]).gender,
            Results.fromJson(workersAllData[i]).phone,
            Results.fromJson(workersAllData[i]).email,
            Results.fromJson(workersAllData[i]).location.country,
            Results.fromJson(workersAllData[i]).location.city,
            Results.fromJson(workersAllData[i]).dob.date,
            Results.fromJson(workersAllData[i]).dob.age,
          ),
        );
      }

      return list;
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: RefreshIndicator(
          child: _buildWorkersBody(workersLineWidgetList()),
          onRefresh: getAllData,
        ),
      ),
    );
  }
}

class WorkersLineWidget extends StatelessWidget {
  WorkersLineWidget(
      this.titleName,
      this.firstName,
      this.lastName,
      this.thumbnailPicture,
      this.largePicture,
      this.nationality,
      this.gender,
      this.phone,
      this.email,
      this.locationCountry,
      this.locationCity,
      this.dobDate,
      this.dobAge);

  final titleName;
  final firstName;
  final lastName;
  final thumbnailPicture;
  final largePicture;
  final nationality;
  final gender;
  final phone;
  final email;
  final locationCountry;
  final locationCity;
  final dobDate;
  final dobAge;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().width,
      child: Column(
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(120),
                  width: ScreenUtil.getInstance().setWidth(30),
                ),

                ///// THUMBNAIL PICTURE /////
                Column(
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(26.0),
                        child: Image.network(thumbnailPicture),
                      ),
                    ),
                  ],
                ),

                ///// WORKERS NAME /////
                Container(
                  height: ScreenUtil.getInstance().setHeight(130),
                  width: ScreenUtil.getInstance().setWidth(450),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: ScreenUtil.getInstance().setWidth(45),
                      ),

                      ///// TITLE NAME /////
                      Text(
                        titleName,
                        style: TextStyle(
                          fontSize:
                              ScreenUtil(allowFontScaling: true).setSp(31),
                          fontFamily: 'SF_Pro',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF363636),
                        ),
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(
                        width: ScreenUtil.getInstance().setWidth(12),
                      ),

                      ///// LAST NAME /////
                      Flexible(
                        child: Text(
                          lastName,
                          style: TextStyle(
                            fontSize:
                                ScreenUtil(allowFontScaling: true).setSp(31),
                            fontFamily: 'SF_Pro',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF363636),
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil.getInstance().setWidth(12),
                      ),

                      ///// FIRST NAME /////
                      Flexible(
                        child: Text(
                          firstName,
                          style: TextStyle(
                            fontSize:
                                ScreenUtil(allowFontScaling: true).setSp(31),
                            fontFamily: 'SF_Pro',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF363636),
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),

                ///// Gray separator /////
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: ScreenUtil.getInstance().setHeight(75),
                      width: ScreenUtil.getInstance().setWidth(3),
                      color: Color(0xFFf1f1f1),
                    ),
                  ],
                ),

                ///// NATIONALITY /////
                SizedBox(
                  width: ScreenUtil.getInstance().setWidth(20),
                ),
                Container(
                  height: ScreenUtil.getInstance().setHeight(120),
                  width: ScreenUtil.getInstance().setWidth(60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(nationality.toString()),
                      ),
                    ],
                  ),
                ),

                ///// RIGHT ICON /////
                Container(
                  height: ScreenUtil.getInstance().setHeight(120),
                  width: ScreenUtil.getInstance().setWidth(60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.chevron_right,
                          color: Color(0xFFc9c9c9),
                          size: ScreenUtil(allowFontScaling: true).setSp(55),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailedScreen(
                    titleName,
                    firstName,
                    lastName,
                    largePicture,
                    nationality,
                    gender,
                    phone,
                    email,
                    locationCity,
                    locationCountry,
                    dobDate,
                    dobAge),
              ),
            ),
          ),

          ///// Gray separator /////
          Container(
              height: ScreenUtil.getInstance().setHeight(0.8),
              width: ScreenUtil.getInstance().width,
              color: Color(0xFF838383)),
        ],
      ),
    );
  }
}
