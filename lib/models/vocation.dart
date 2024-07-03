import 'package:flutter/material.dart';

// enhanced enum is an enum of objects
enum Vocation {
  raider(
    title: "Terminal Raider",
    description: "Adept in terminal commands to trigger traps.",
    image: "terminal_raider.jpg",
    weapon: "Terminal",
    ability: "ShellShock",
  ),
  junkie(
      title: "Code Junkie",
      description: "Uses code to infiltrate enemy defenses.",
      weapon: "React 99",
      ability: "Higher Order Overdrive",
      image: "code_junkie.jpg"),
  ninja(
      title: "UX Ninja",
      description: "Uses quick & stealthy visual attacks.",
      weapon: "Infused Stylus",
      ability: "Triple Swipe",
      image: "ux_ninja.jpg"),
  wizard(
      title: "Algo Wizard",
      description: "Carries a staff to unleash algorithm magic.",
      weapon: "Crystal Staff",
      ability: "Algorythmic Daze",
      image: "algo_wizard.jpg");

  const Vocation({
    required this.title,
    required this.description,
    required this.image,
    required this.weapon,
    required this.ability,
  });

  final String title;
  final String description;
  final String image;
  final String weapon;
  final String ability;
}

enum Status { approved, rejected, pending }

Status newStatus = Status.approved;

Vocation v = Vocation.raider; 


/*
enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
*/