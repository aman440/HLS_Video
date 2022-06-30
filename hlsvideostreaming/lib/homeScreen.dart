import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppBar(),
        MyAppBody(),
        MyAppBottomNavigationBar(),
      ],
    );
  }
}

class MyAppBar extends StatefulWidget {
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  int idx = 0;
  final arr = [
    "All",
    "Cricket",
    "Dubbing",
    "Live",
    "Hockey",
    "Football",
    "Bollywood",
    "Hollywood",
    "Tollywood",
    "Taylor Swift",
    "Hellen keller"
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.green,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: arr.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      idx = index;
                    });
                  },
                  child: ChoiceChip(
                      selectedColor: Colors.white,
                      disabledColor: Colors.grey,
                      label: Text(
                        arr[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (idx == index ? Colors.black : Colors.white),
                        ),
                      ),
                      selected: (idx == index ? true : false)),
                ),
              );
            }),
      ),
    );
  }
}

class MyAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        color: Colors.blue,
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text('Hello $index'),
          );
        }),
      ),
    );
  }
}

class MyAppBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            getBottomNavigationBarWidgets(icon: Icons.home, str: 'Home'),
            getBottomNavigationBarWidgets(icon: Icons.slow_motion_video, str: 'Shorts'),
            Icon(
              Icons.add_rounded,
            ),
            getBottomNavigationBarWidgets(icon: Icons.subscriptions, str: 'Subscriptions'),
            getBottomNavigationBarWidgets(icon: Icons.library_add, str: 'Library'),
          ],
        ),
      ),
    );
  }

  Column getBottomNavigationBarWidgets({required IconData icon, required String str}) {
    return Column(
            children: [
              Icon(
                icon,
              ),
              Text(str),
            ],
          );
  }
}
