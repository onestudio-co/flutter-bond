import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taleb/core/helpers/logger.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class ServiceProviderGoogleMap extends StatefulWidget {
  const ServiceProviderGoogleMap({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceProviderGoogleMap> createState() =>
      _ServiceProviderGoogleMapState();
}

class _ServiceProviderGoogleMapState extends State<ServiceProviderGoogleMap> {
  final Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    _determineCurrentUserPosition().then((position) {
      _goToThisLocation(LatLng(position.latitude, position.longitude));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TalebSizes.h200,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: TalebPadding.p24,
        vertical: TalebPadding.p8,
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.all(Radius.circular(TalebBorderRadius.r12)),
            child: GoogleMap(
              mapType: MapType.normal,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              initialCameraPosition: _kFirstCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              // ignore: prefer_collection_literals
              gestureRecognizers: Set()
                ..add(
                    Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
              markers: _markers,
              onTap: _goToThisLocation,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(TalebPadding.p8),
            child: FloatingActionButton(
              backgroundColor: TalebColors.white,
              onPressed: () {
                _determineCurrentUserPosition().then((position) {
                  _goToThisLocation(
                      LatLng(position.latitude, position.longitude));
                });
              },
              child: const Icon(
                Icons.my_location,
                color: TalebColors.blueDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToThisLocation(LatLng latLong) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
        target: latLong,
        zoom: 15,
      )),
    );
    _markers.clear();
    setState(() {});
    _updateMarker(latLong);
  }

  Future<Position> _determineCurrentUserPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // fixitShowToast(
      //   context: context,
      //   message: FixitStrings
      //       .addressManagementGoogleMapFailureMessageLocationServiceDisable,
      //   state: FixitAlertState.alert,
      // );
      logger.e('لازم تفعل الجي جي اس يا حبيبي');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // fixitShowToast(
        //   context: context,
        //   message: FixitStrings
        //       .addressManagementGoogleMapFailureMessageLocationPermissionDenied,
        //   state: FixitAlertState.failure,
        // );
        logger.e('لازم تفعل الجي جي اس يا حبيبي');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // fixitShowToast(
      //   context: context,
      //   message: FixitStrings
      //       .addressManagementGoogleMapFailureMessageLocationPermissionDeniedForever,
      //   state: FixitAlertState.failure,
      // );
      logger.e('لازم تفعل الجي جي اس يا حبيبي');
    }
    return await Geolocator.getCurrentPosition();
  }

  static const CameraPosition _kFirstCameraPosition = CameraPosition(
    target: LatLng(21.474716, 39.191951),
    zoom: 11,
  );

  final Set<Marker> _markers = HashSet<Marker>();

  void _updateMarker(LatLng location) {
    _markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: location,
      ),
    );
  }
}
