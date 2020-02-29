import 'package:flutter/material.dart';

// Components & Services
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    // Initialize Screen util
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(190),
            ),
            Center(
              child: Container(
                width: ScreenUtil.getInstance().setWidth(300),
                child: Image.asset("images/icoDataBankGray.png"),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(110),
            ),
            Text(
              "For more information visit our website",
              style: TextStyle(
                fontSize: ScreenUtil(allowFontScaling: true).setSp(31),
                fontFamily: 'Museo_Sans',
                fontWeight: FontWeight.w300,
                color: Color(0xFF919191),
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "or send an email to ",
                  style: TextStyle(
                    fontSize: ScreenUtil(allowFontScaling: true).setSp(31),
                    fontFamily: 'Museo_Sans',
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF919191),
                  ),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  child: Text(
                    'info@databank.com',
                    style: TextStyle(
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(31),
                      fontFamily: 'Museo_Sans',
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF00729e),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => launch(
                    'mailto:info@databank.com',
                  ),
                ),
                Text(
                  ".",
                  style: TextStyle(
                    fontSize: ScreenUtil(allowFontScaling: true).setSp(31),
                    fontFamily: 'Museo_Sans',
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF919191),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(70),
            ),

            ///// HOLFY Button /////
            Container(
              width: ScreenUtil.getInstance().setWidth(680),
              height: ScreenUtil.getInstance().setHeight(85),
              child: FlatButton(
                child: Center(
                  child: Text(
                    "WEBPAGE",
                    style: TextStyle(
                      fontFamily: 'SF_Pro',
                      fontWeight: FontWeight.w700,
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(29),
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                onPressed: () => launch('https://google.com'),
                color: Color(0xFF00729e),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(50),
            ),
            Text(
              "Follow us:",
              style: TextStyle(
                fontSize: ScreenUtil(allowFontScaling: true).setSp(31),
                fontFamily: 'Museo_Sans',
                fontWeight: FontWeight.w300,
                color: Color(0xFF919191),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(25),
            ),

            ///// FB and Insta Icon /////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(55),
                  child: Image(
                    image: AssetImage('images/fbIcon.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil.getInstance().setWidth(35),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(55),
                  child: Image(
                    image: AssetImage('images/instaIcon.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
