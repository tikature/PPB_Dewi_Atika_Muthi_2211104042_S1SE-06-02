import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  static final LatLng _initialLocation = LatLng(-7.431391, 109.247833);

  void _showPlacePicker() async {
    if (Platform.isAndroid) {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlacePicker(
            apiKey: "AIzaSyBqlg_d8HJqQ7AFLXSquBfFimlLo3Kf4Mc",
            onPlacePicked: (LocationResult result) {
              debugPrint("Place picked: ${result.formattedAddress}");
              Navigator.of(context).pop();
            },
            initialLocation: LatLng(-7.431391, 109.247833),
          ),
        ),
      );

      if (result != null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Lokasi Dipilih"),
            content: Text(result.formattedAddress ?? "Tidak ada alamat"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    } else {
      debugPrint("PlacePicker hanya mendukung Android saat ini.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialLocation,
              zoom: 11.0,
            ),
            myLocationEnabled: true,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: _showPlacePicker,
              child: Text('Pilih Lokasi'),
            ),
          ),
        ],
      ),
    );
  }
}
