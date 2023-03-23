import 'package:pet_care/view/dashboard_page.dart';
import 'package:pet_care/view/history_page.dart';
import 'package:pet_care/view/profile_page.dart';
import 'package:flutter/cupertino.dart';

class PageLists {
  static const List pages = <Widget>[
    DashboardPage(),
    HistoryPage(),
    ProfilePage()
  ];
}
