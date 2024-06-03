import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import '../widgets/header.dart';
import '../widgets/footer.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({Key? key}) : super(key: key);

  @override
  _AmbulanceScreenState createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  Location _locationController = Location();
  GoogleMapController? mapController;
  LatLng _ambulanceLocation = const LatLng(-1.9403, 29.8739);
  LatLng _currentLocation = const LatLng(-1.65275, 29.50684);
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  static const LatLng _nyabihuLocation = LatLng(-1.65275, 29.50684);
  static const LatLng _bugeseraLocation = LatLng(-2.23456, 30.14825);
  LatLng? _currentP;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _getPolyline();
  }

  Future<void> _getCurrentLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final LocationData _locationData = await _locationController.getLocation();
    setState(() {
      _currentP = LatLng(_locationData.latitude!, _locationData.longitude!);
    });
  }

  Future<void> _getPolyline() async {
    try {
      if (_currentP != null && _ambulanceLocation != null) {
        PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          '', // Replace with your Google Maps API key
          PointLatLng(_currentP!.latitude, _currentP!.longitude),
          PointLatLng(_ambulanceLocation.latitude, _ambulanceLocation.longitude),
          travelMode: TravelMode.driving,
        );
        if (result.points.isNotEmpty) {
          polylineCoordinates.clear();
          for (var point in result.points) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          }
          setState(() {});
        } else {
          print(result.errorMessage);
        }
      }
    } catch (e) {
      print('Error fetching polyline: $e');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _searchLocation(String query) async {
    try {
      List<geocoding.Location> locations = await geocoding.locationFromAddress(query);
      if (locations.isNotEmpty) {
        geocoding.Location location = locations.first;
        LatLng searchedLocation = LatLng(location.latitude, location.longitude);
        mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: searchedLocation,
              zoom: 4.0,
            ),
          ),
        );
      } else {
        print('No location found');
      }
    } catch (e) {
      print('Error searching location: $e');
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search location',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0,
                  ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.grey[600]),
                    onPressed: () {
                      _searchLocation(_searchController.text);
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentP ?? _currentLocation,
                zoom: 8.0,
              ),
              markers: {
                if (_currentP != null)
                  Marker(
                    markerId: MarkerId('currentLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentP!,
                    infoWindow: InfoWindow(
                      title: 'Your Location',
                      snippet: 'Your current location',
                    ),
                  ),
                Marker(
                  markerId: MarkerId('ambulance'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _nyabihuLocation,
                  infoWindow: InfoWindow(
                    title: 'Ambulance Location',
                    snippet: 'Kigali, Rwanda',
                  ),
                ),
                Marker(
                  markerId: MarkerId('bugeseraLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _bugeseraLocation,
                  infoWindow: InfoWindow(
                    title: 'Bugesera Location',
                    snippet: 'Bugesera, Rwanda',
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