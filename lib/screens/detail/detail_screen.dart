import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

import 'widgets/plant_card_info.dart';

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
