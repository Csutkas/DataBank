import 'package:flutter/material.dart';

// Components and Services
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

// Screens
import 'package:databank/screens/data_screen.dart';
import 'package:databank/screens/setting_screen.dart';
import 'package:databank/screens/contact_screen.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class MenuPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Data Bank", Icons.library_books),
    new DrawerItem(
      "Settings",
      Icons.settings,
    ),
    new DrawerItem("Contact", Icons.contact_mail),
  ];

  @override
  State<StatefulWidget> createState() {
    return new MenuPageState();
  }
}

class MenuPageState extends State<MenuPage> {
  var _selectedDrawerIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return DataScreen();
      case 1:
        return SettingScreen();
      case 2:
        return ContactScreen();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); //  close the drawer
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);

    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: Icon(
                d.icon,
                color: Color(0xFF414243),
                size: ScreenUtil(allowFontScaling: true).setSp(46),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Color(0xFF595a62),
                size: ScreenUtil(allowFontScaling: true).setSp(50),
              ),
              title: Text(
                d.title,
                style: TextStyle(
                  fontSize: ScreenUtil(allowFontScaling: true).setSp(42),
                  fontFamily: 'SF_Pro',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  letterSpacing: 1.8,
                ),
              ),
              selected: i == _selectedDrawerIndex,
              onTap: () => _onSelectItem(i),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.6),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil.getInstance().setHeight(100)),
        child: AppBar(
          brightness: Brightness.light, // status bar color
          backgroundColor: Color(0xFFf8f8f8),
          elevation: 0.0,
          title: Text(
            widget.drawerItems[_selectedDrawerIndex].title,
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
      drawer: SizedBox(
        width: ScreenUtil.getInstance().setWidth(580),
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: ScreenUtil.getInstance().setHeight(1120),
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: ScreenUtil.getInstance().setHeight(100),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(children: drawerOptions),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(10),
              ),
            ],
          ),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
