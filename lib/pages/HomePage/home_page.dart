import 'dart:convert';

import 'package:animation/modals/modals.dart';
import 'package:animation/pages/DetailScreen/planet_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlanetListScreen extends StatefulWidget {
  @override
  _PlanetListScreenState createState() => _PlanetListScreenState();
}

class _PlanetListScreenState extends State<PlanetListScreen> {
  late Future<List<Planet>> _planets;

  @override
  void initState() {
    super.initState();
    _planets = _loadPlanets();
  }

  Future<List<Planet>> _loadPlanets() async {
    final jsonString = await rootBundle.loadString('assets/planets.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((planet) => Planet.fromJson(planet)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galaxy Planets Animator'),
      ),
      body: FutureBuilder<List<Planet>>(
        future: _planets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final planets = snapshot.data!;
            return ListView.builder(
              itemCount: planets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(planets[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlanetDetailScreen(planet: planets[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
