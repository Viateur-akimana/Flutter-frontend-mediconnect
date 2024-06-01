// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({super.key});

  @override
  _AmbulanceScreenState createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  GoogleMapController? mapController;
  final LatLng _ambulanceLocation = LatLng(-1.9403, 29.8739); // Coordinates for Kigali, Rwanda

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _ambulanceLocation,
                zoom: 14.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('ambulance'),
                  position: _ambulanceLocation,
                  infoWindow: InfoWindow(
                    title: 'Ambulance Location',
                    snippet: 'Kigali, Rwanda',
                  ),
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ambulanceSuccess');
              },
              child: Text('Confirm Location'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
