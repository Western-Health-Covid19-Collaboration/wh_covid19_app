import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes.dart';

class IntroRouter extends StatefulWidget {
  @override
  _IntroRouterState createState() => _IntroRouterState();
}

class _IntroRouterState extends State<IntroRouter> {
  @override
  void initState() {
    super.initState();
    _checkDisclaimerFirstView();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> _checkDisclaimerFirstView() async {
    final prefs = await SharedPreferences.getInstance();
    final disclaimerFirstView = prefs.getBool('disclaimer_first_view') ?? false;

    if (disclaimerFirstView) {
      await Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      await Navigator.of(context).pushReplacementNamed(Routes.disclaimer);
    }
  }
}
