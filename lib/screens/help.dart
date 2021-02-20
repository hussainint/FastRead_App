import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  static const routeName = "Help";

  _sendMail(String url) async {
    // Android and iOS
    // 'mailto:hussainint08@gmail.com?subject=Make this for me&body='
    var uri = url;
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Help',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                // Navigator.of(context).pushNamed(AppInfo.routeName);
                // Navigator.push(context, SlideRightRoute(page: AppInfo()));
                // _sendMail(),
              },
              leading: Icon(
                Icons.info,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'App Info',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.navigate_next_rounded),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).pushNamed(AppInfo.routeName);
                _sendMail(
                    'https://play.google.com/store/apps/details?id=com.hussainint.CalciPro');
              },
              leading: Icon(
                Icons.rate_review_rounded,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'Write a Review',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.navigate_next_rounded),
            ),
            ListTile(
              onTap: () {
                _sendMail(
                    'mailto:msvideos15@gmail.com?subject=CalciPro User me&body=');
              },
              leading: Icon(
                Icons.mail,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'Contact us',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.navigate_next_rounded),
            ),
            ListTile(
              onTap: () {
                _sendMail('https://calcipro.flycricket.io/privacy.html');
              },
              leading: Icon(
                Icons.sticky_note_2_rounded,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.navigate_next_rounded),
            ),
            ListTile(
              onTap: () {
                _sendMail(
                    'https://play.google.com/store/apps/dev?id=5497953301162057133');
              },
              leading: Icon(
                Icons.mobile_friendly,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'Discover more apps',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.navigate_next_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
