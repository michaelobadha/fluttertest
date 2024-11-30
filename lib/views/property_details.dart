import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PropertyDetails extends StatefulWidget {
  const PropertyDetails({super.key});

  @override
  _PropertyDetailsState createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  final ApiService apiService = ApiService();
  late Future<Map<String, dynamic>> propertyDetails;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final propertyId = ModalRoute.of(context)!.settings.arguments as String;
    propertyDetails = apiService.fetchPropertyDetails(propertyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Property Details')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: propertyDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final property = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(property['name'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text('Description: ${property['description']}'),
                  // Add more details here based on the API response
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
