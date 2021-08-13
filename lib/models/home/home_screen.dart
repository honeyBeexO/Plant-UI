import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final widgets = [
    PlantOverview(
      title: 'Green',
      subtitle: 'Plants',
    ),
    Container(color: Colors.blue),
    Container(color: Colors.red),
  ];
  int _currentIndex = 0;

  void _changeActiveIndex(int newIndex) {
    if (newIndex != _currentIndex) {
      setState(() => _currentIndex = newIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 90.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 36.0),
            child: RotatedBox(
              quarterTurns: 1,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                  Spacer(),
                  CustomMenuItem(
                    title: 'Green Plant',
                    index: 0,
                    onPressed: () {
                      _changeActiveIndex(0);
                    },
                    isSelected: _currentIndex == 0,
                  ),
                  CustomMenuItem(
                    title: 'Indoor Plant',
                    index: 1,
                    onPressed: () {
                      _changeActiveIndex(1);
                    },
                    isSelected: _currentIndex == 1,
                  ),
                  CustomMenuItem(
                    title: 'Outdoor Plant',
                    index: 2,
                    onPressed: () {
                      _changeActiveIndex(2);
                    },
                    isSelected: _currentIndex == 2,
                  ),
                  Spacer(),
                  RotatedBox(
                    quarterTurns: -1,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: PageView(
                children: [
                  widgets[_currentIndex],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
