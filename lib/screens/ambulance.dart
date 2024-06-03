import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../widgets/header.dart';
import '../widgets/footer.dart';

class Ambulance extends StatefulWidget {
  const Ambulance({Key? key}) : super(key: key);

  @override
  _AmbulanceScreenState createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<Ambulance> {
  final Location _locationController = Location();
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  GoogleMapController? mapController;
  LatLng _ambulanceLocation = const LatLng(-1.9403, 29.8739);
  final LatLng _defaultLocation = const LatLng(-1.65275, 29.50684);
  LatLng? _currentLocation;
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    initSocket();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentLocation = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _cameraToPosition(_currentLocation!);
        sendLocationUpdate(_currentLocation!);
      });
    });
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
  }

  void initSocket() {
    socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.connect();

    socket.on('connect', (_) {
      print('Connected to server');
    });

    socket.on('locationUpdate', (data) {
      updateAmbulanceLocation(data);
    });

    socket.on('disconnect', (_) => print('Disconnected from server'));
  }

  void sendLocationUpdate(LatLng location) {
    socket.emit('updateLocation', {
      'latitude': location.latitude,
      'longitude': location.longitude,
    });
  }

  void updateAmbulanceLocation(dynamic data) {
    LatLng newAmbulanceLocation = LatLng(data['location']['coordinates'][1], data['location']['coordinates'][0]);
    setState(() {
      _ambulanceLocation = newAmbulanceLocation;
      _updatePolyline();
    });
  }

  Future<void> _updatePolyline() async {
    if (_currentLocation == null) return;

    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBkAzB6UX78XjJ1RWx30Qwn3Mvf9Vdd64Q',
      PointLatLng(_currentLocation!.latitude, _currentLocation!.longitude),
      PointLatLng(_ambulanceLocation.latitude, _ambulanceLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      _generatePolyLineFromPoints(polylineCoordinates);
    } else {
      print(result.errorMessage);
    }
  }

  void _generatePolyLineFromPoints(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
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
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: TextEditingController(),
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
                      // Implement search functionality here if needed
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) => _mapController.complete(controller),
              initialCameraPosition: CameraPosition(
                target: _currentLocation ?? _defaultLocation,
                zoom: 14.0,
              ),
              markers: {
                if (_currentLocation != null)
                  Marker(
                    markerId: MarkerId('currentLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentLocation!,
                    infoWindow: InfoWindow(
                      title: 'Your Location',
                      snippet: 'Your current location',
                    ),
                  ),
                Marker(
                  markerId: MarkerId('ambulance'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _ambulanceLocation,
                  infoWindow: InfoWindow(
                    title: 'Ambulance Location',
                    snippet: 'Kigali, Rwanda',
                  ),
                ),
              },
              polylines: Set<Polyline>.of(polylines.values),
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
