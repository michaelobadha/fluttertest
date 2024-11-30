import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PropertyList extends StatefulWidget {
  const PropertyList({super.key});

  @override
  _PropertyListState createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  final ApiService apiService = ApiService();
  late Future<List<dynamic>> properties;

  @override
  void initState() {
    super.initState();
    properties = apiService.fetchProperties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Properties')),
      body: FutureBuilder<List<dynamic>>(
        future: properties,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final properties = snapshot.data!;
            return ListView.builder(
              itemCount: properties.length,
              itemBuilder: (context, index) {
                final property = properties[index];
                return ListTile(
                  title: Text(property['name']),
                  onTap: () {
                    Navigator.pushNamed(context, '/details', arguments: property['id']);
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
