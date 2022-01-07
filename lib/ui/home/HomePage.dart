
import 'package:flutter/material.dart';
import 'package:mufin/ui/budgets/BudgetsPage.dart';
import 'package:mufin/ui/overview/OverviewPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title, required this.navigatorKey}) : super(key: key);
  final String title;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Navigator(
                key: navigatorKey,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => OverviewPage(),
                ),
              ),
            )
          ],
        ),
      ),

      drawer: AppNavBar(navigatorKey: navigatorKey),
    );
  }
}

class AppNavBar extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const AppNavBar({Key? key, required this.navigatorKey}) : super(key: key);

  Future<void> push(Route route) {
    return navigatorKey.currentState!.push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("MuFin"),
            accountEmail: Text("Your finances"),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(size: 42.0),
            ),
          ),
          ListTile(
            title: const Text('Overview'),
            leading: const Icon(Icons.pie_chart),
            onTap: () {
              push(MaterialPageRoute(builder: (context) => OverviewPage()));
            },
          ),
          ListTile(
            title: const Text('Accounts'),
            leading: const Icon(Icons.attach_money),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Bills'),
            leading: const Icon(Icons.money_off),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Budgets'),
            leading: const Icon(Icons.bar_chart),
            onTap: () {
              push(MaterialPageRoute(builder: (context) => BudgetsPage()));
            },
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

}