import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../widgets/header.dart';
import '../widgets/footer.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({Key? key}) : super(key: key);

  @override
  _AmbulanceScreenState createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  final _locationController = Location();
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  GoogleMapController? mapController;
  LatLng _ambulanceLocation = const LatLng(-1.9403, 29.8739);
  final LatLng _currentLocation = const LatLng(-1.65275, 29.50684);
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  // ignore: unused_field
  static const LatLng _nyabihuLocation = LatLng(-1.65275, 29.50684);
  static const LatLng _bugeseraLocation = LatLng(-2.23456, 30.14825);
  LatLng? _currentP;
  final TextEditingController _searchController = TextEditingController();
  Map<PolylineId, Polyline> polylines = {};
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    initSocket();
    _getCurrentLocation().then((_) => {
          getPolylinePoints().then((coordinates) => {
                generatePolyLineFromPoints(coordinates),
              }),
        });
    getPolylinePoints();
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

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _cameraToPosition(_currentP!);
        sendLocationUpdate(_currentP!);
      });
    });
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBkAzB6UX78XjJ1RWx30Qwn3Mvf9Vdd64Q',
      PointLatLng(_currentP!.latitude, _currentP!.longitude),
      PointLatLng(_ambulanceLocation.latitude, _ambulanceLocation.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.black,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }

  void initSocket() {
    socket = IO.io('http://your-node-server.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.onConnect((data) {
      print('Connected to server');
    });

    socket.on('update-ambulance-location', (data) {
      updateAmbulanceLocation(data);
    });
  }

  void sendLocationUpdate(LatLng location) {
    socket.emit('update-location', {
      'latitude': location.latitude,
      'longitude': location.longitude,
    });
  }

  void updateAmbulanceLocation(dynamic data) {
    LatLng ambulanceLocation = LatLng(data['latitude'], data['longitude']);
    setState(() {
      _ambulanceLocation = ambulanceLocation;
      getPolylinePoints().then((coordinates) => {
            generatePolyLineFromPoints(coordinates),
          });
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
                      // _searchLocation(_searchController.text);
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  _mapController.complete(controller)),
              initialCameraPosition: CameraPosition(
                target: _currentP ?? _currentLocation,
                zoom: 14.0,
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
                  position: _ambulanceLocation,
                  infoWindow: InfoWindow(title: 'Ambulance Location',
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