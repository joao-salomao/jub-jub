import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../utils/navigation.dart';
import '../../entities/user.dart';
import '../user/login_page.dart';

class DrawerList extends StatelessWidget {
  final defaultImageUrl =
      "https://freeiconshop.com/wp-content/uploads/edd/person-solid.png";
  final User user;
  DrawerList(this.user);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user.name ?? 'Não Definido'),
              accountEmail: Text(user.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    user.photoUrl ?? defaultImageUrl),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              subtitle: Text("Sair do Aplicativo"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    User.clearPrefs();
    push(context, LoginPage(), replace: true);
  }
}
