import 'package:flutter/material.dart';
import 'package:new_api_task/screens/dashboard/favourites.dart';
import 'package:new_api_task/screens/dashboard/hompage.dart';
import 'package:new_api_task/services/blocs/news/news_request.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  List<Widget>? body;

  @override
  void initState() {
    super.initState();

    body = [
      HomePage(),
      const Favourites(),
    ];
  }

  @override
  Widget build(BuildContext context) { 
    fetchNews(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: body![index],
      ),
      bottomSheet: BottomNavigationBar(
        elevation: 0,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        selectedIconTheme: const IconThemeData(color: Colors.blue),

        // selectedFontSize: 20,
        selectedLabelStyle:
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourites"),
        ],
      ),
    );
  }
}
