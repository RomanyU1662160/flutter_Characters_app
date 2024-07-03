// test for enhanced enums in Dart.

enum Vehicles {
  car(tyres: 4, doors: 4, passengers: 5, topSpeed: 116),
  bus(tyres: 6, doors: 2, passengers: 50, topSpeed: 110),
  bike(tyres: 2, doors: 0, passengers: 1, topSpeed: 20);

  const Vehicles(
      {required this.tyres,
      required this.doors,
      required this.passengers,
      required this.topSpeed});

  final int tyres;
  final int doors;
  final int passengers;
  final int topSpeed;
}

Vehicles v = Vehicles.car;

printVehicle(Vehicles v) {
  print(v.doors);
  print(v.passengers);
}
