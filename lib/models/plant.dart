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
