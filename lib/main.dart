import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant App Demo',
      theme: ThemeData(
        primaryColor: Color(0xff67864a),
      ),
      home: HomeScreen(),
    );
  }
}

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

class PlantOverview extends StatelessWidget {
  const PlantOverview({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(this.subtitle, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8.0),
            Text(
              this.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: plants.length,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              PlantDetailScreen(plant: plants[index]),
                        ),
                      );
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: plants[index].title,
                            child: Image.network(
                              plants[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            plants[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.0),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            plants[index].description,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Text(
                                '\$${plants[index].price}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 36.0),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    Key? key,
    required this.title,
    required this.index,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);
  final String title;
  final int index;
  final VoidCallback onPressed;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelected
              ? Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                )
              : Container(height: 8.0),
          SizedBox(height: 8.0),
          Text(
            this.title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white60,
              fontSize: isSelected ? 20.0 : 18.0,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class Plant {
  final String title;
  final String description;
  final String price;
  final String height;
  final String image;
  final String temperature;
  final String port;

  Plant({
    required this.title,
    required this.description,
    required this.price,
    required this.height,
    required this.image,
    required this.temperature,
    required this.port,
  });
}

List<Plant> plants = [
  Plant(
      title: "Turf Pot Plant",
      description: "Small leaf plant for your home and office decoration",
      height: "40.0 cm to 50cm",
      temperature: "18c to 25c",
      image: "https://img.pngio.com/download-artificial"
          "-potted-plant-oregano-png-image-for-free-potted-plants-png-2000_2000.png",
      port: "Self Growing pot",
      price: "59.00"),
  Plant(
      title: "Scandinavain",
      description: "Small leaf plant for your home and office decoration",
      height: "40.0 cm to 50cm",
      temperature: "18c to 25c",
      image:
          "https://purepng.com/public/uploads/large/purepng.com-plantnatureplant-961524678664sj8de.png",
      port: "Self Growing pot",
      price: "59.00"),
];

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({
    Key? key,
    required this.plant,
  }) : super(key: key);
  final Plant plant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 36.0),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 24.0,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_bag,
                          color: Colors.black,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Hero(
                      tag: this.plant.title,
                      child: Image.network(
                        this.plant.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.0),
                        Text(
                          plant.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          plant.description,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Text(
                              '\$${plant.price}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 36.0),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '+',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 36.0),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16.0,
                runSpacing: 16.0,
                runAlignment: WrapAlignment.spaceBetween,
                children: [
                  PlantCardInfo(
                    title: 'Height',
                    iconData: Icons.height,
                    info: plant.height,
                  ),
                  PlantCardInfo(
                    title: 'Temperature',
                    iconData: Icons.thermostat,
                    info: plant.temperature,
                  ),
                  PlantCardInfo(
                    title: 'Pot',
                    iconData: Icons.portrait,
                    info: plant.port,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlantCardInfo extends StatelessWidget {
  const PlantCardInfo({
    Key? key,
    required this.title,
    required this.iconData,
    required this.info,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.iconData, size: 40.0, color: Colors.white),
        Text(
          this.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 6),
        Text(
          this.info,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
