import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/detail/detail_screen.dart';

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
