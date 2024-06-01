// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AmbulanceScreenState createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  GoogleMapController? mapController;
  late LatLng _ambulanceLocation;
  late LatLng _currentLocation;
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  late PolylineResult result;
  Location location = Location();

  @override
  void initState() {
    super.initState();
    _getAmbulanceLocation();
    _getCurrentLocation();
    _getPolyline();
  }

  Future<void> _getAmbulanceLocation() async {
    // Set the ambulance location to Kigali, Rwanda coordinates
    _ambulanceLocation = const LatLng(-1.9403, 29.8739);
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationData currentLocation = await location.getLocation();
      setState(() {
        _currentLocation = LatLng(currentLocation.latitude!, currentLocation.longitude!);
      });
    } catch (e) {
      print('Could not get the location: $e');
    }
  }

  Future<void> _getPolyline() async {
    try {
      result = await polylinePoints.getRouteBetweenCoordinates(
        "",
        PointLatLng(_currentLocation.latitude, _currentLocation.longitude),
        PointLatLng(_ambulanceLocation.latitude, _ambulanceLocation.longitude),
        travelMode: TravelMode.driving,
      );
      if (result.points.isNotEmpty) {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }
        setState(() {});
      } else {
        print(result.errorMessage);
      }
    } catch (e) {
      print('Error fetching polyline: $e');
    }
  }

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
                target: _currentLocation, // Set initial camera position to current location
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
                Marker(
                  markerId: MarkerId('currentLocation'),
                  position: _currentLocation,
                  infoWindow: InfoWindow(
                    title: 'Your Location',
                    snippet: 'Your current location',
                  ),
                ),
              },
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: polylineCoordinates,
                  color: Colors.blue,
                  width: 5,
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
