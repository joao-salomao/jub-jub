import 'package:flutter/material.dart';
import '../think/list/think_list_page.dart';
import '../../utils/navigation.dart';
import '../../entities/user.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  void redirect() {
    Future futureUser = User.get();
    Future futureDelay = Future.delayed(Duration(seconds: 2));

    Future.wait([futureUser, futureDelay]).then((List results) {
      User user = results[0];
      if (user != null) {
        push(context, ThinkListPage(user), replace: true);
      } else {
        push(context, LoginPage(), replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
