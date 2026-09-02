// // import 'package:custom_info_window/custom_info_window.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:university/Model/new_model.dart';
// // import 'dart:typed_data';
// // import 'dart:ui' as ui;

// // class GoogleMapScreen extends StatefulWidget {
// //   final Faculty faculty;
// //   const GoogleMapScreen({super.key, required this.faculty});

// //   @override
// //   State<GoogleMapScreen> createState() => _GoogleMapScreenState();
// // }

// // class _GoogleMapScreenState extends State<GoogleMapScreen> {
// //   final CustomInfoWindowController _customInfoWindowController =
// //       CustomInfoWindowController();
// //   final Set<Marker> _markers = {};
// //   String _status = "";
// //   Color _statusColor = Colors.black;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _updateStatus();
// //   }

// //   void _updateStatus() {
// //     final now = DateTime.now();
// //     final hour = now.hour;
// //     setState(() {
// //       if (hour >= 8 && hour < 16) {
// //         _status = "Open Now";
// //         _statusColor = Colors.green;
// //       } else {
// //         _status = "Closed Now";
// //         _statusColor = Colors.red;
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _customInfoWindowController.dispose();
// //     super.dispose();
// //   }

// //   Future<BitmapDescriptor> _getCustomMarkerIcon() async {
// //     try {
// //       // Load the marker image from assets
// //       final ByteData data = await DefaultAssetBundle.of(
// //         context,
// //       ).load('assets/images/marker.png');
// //       final ui.Codec codec = await ui.instantiateImageCodec(
// //         data.buffer.asUint8List(),
// //         targetWidth: 60, // Smaller marker width
// //         targetHeight: 60, // Smaller marker height
// //       );
// //       final ui.FrameInfo fi = await codec.getNextFrame();
// //       final ByteData? resizedData = await fi.image.toByteData(
// //         format: ui.ImageByteFormat.png,
// //       );

// //       return BitmapDescriptor.fromBytes(resizedData!.buffer.asUint8List());
// //     } catch (e) {
// //       // Fallback to asset image if scaling fails
// //       return await BitmapDescriptor.fromAssetImage(
// //         ImageConfiguration.empty,
// //         'assets/images/marker.png',
// //       );
// //     }
// //   }

// //   Widget _buildInfoWindow(Size size) {
// //     return Container(
// //       height: size.height * 0.32,
// //       width: size.width * 0.85,
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(25),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black26,
// //             blurRadius: 10,
// //             offset: Offset(0, 5),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Stack(
// //             children: [
// //               SizedBox(
// //                 height: size.height * 0.15,
// //                 width: size.width * 0.85,
// //                 child: ClipRRect(
// //                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// //                   child: Image.network(
// //                     widget.faculty.universityImage,
// //                     fit: BoxFit.cover,
// //                     errorBuilder: (context, error, stackTrace) {
// //                       return Container(
// //                         color: Colors.grey[300],
// //                         child: Icon(Icons.image_not_supported),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ),
// //               // Close Button
// //               Positioned(
// //                 right: 0,
// //                 top: 0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     _customInfoWindowController.hideInfoWindow!();
// //                   },
// //                   child: CircleAvatar(
// //                     radius: 15,
// //                     backgroundColor: Colors.white,
// //                     child: Icon(Icons.close),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           //  Name and Other Info
// //           SizedBox(height: 5),
// //           Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 15),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   flex: 5,
// //                   child: Text(
// //                     "${widget.faculty.name}, 3-km Shahkergar Road, Narowal",
// //                     maxLines: 3,
// //                     overflow: TextOverflow.ellipsis,
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 16,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(width: 20),
// //                 Expanded(
// //                   child: Flex(
// //                     direction: Axis.horizontal,
// //                     children: [
// //                       Container(
// //                         padding: EdgeInsets.all(5),
// //                         decoration: BoxDecoration(
// //                           border: Border.all(color: Colors.black45),
// //                           shape: BoxShape.circle,
// //                         ),
// //                         child: Icon(
// //                           Icons.directions,
// //                           color: Colors.greenAccent,
// //                         ),
// //                       ),
// //                       SizedBox(width: 15),
// //                       Container(
// //                         padding: EdgeInsets.all(5),
// //                         decoration: BoxDecoration(
// //                           border: Border.all(color: Colors.black45),
// //                           shape: BoxShape.circle,
// //                         ),
// //                         child: Icon(
// //                           Icons.bookmark_add_outlined,
// //                           color: Colors.greenAccent,
// //                         ),
// //                       ),
// //                       SizedBox(width: 15),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           //  For Rating
// //           Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 15),
// //             child: Flex(
// //               direction: Axis.horizontal,
// //               children: [
// //                 Text(
// //                   widget.faculty.rating.toString(),
// //                   style: TextStyle(color: Colors.black),
// //                 ),
// //                 RatingBar.builder(
// //                   itemBuilder: (context, _) =>
// //                       Icon(Icons.star, color: Colors.yellow),
// //                   initialRating: widget.faculty.rating,
// //                   minRating: 1,
// //                   direction: Axis.horizontal,
// //                   allowHalfRating: true,
// //                   itemCount: 5,
// //                   itemSize: 20,
// //                   onRatingUpdate: (rating) {},
// //                 ),
// //                 Text(
// //                   "(${widget.faculty.number.toString()})",
// //                   style: TextStyle(color: Colors.black),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           //  For Identify and structure
// //           Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 15),
// //             child: Flex(
// //               direction: Axis.horizontal,
// //               children: [
// //                 Text("University", style: TextStyle(color: Colors.black)),
// //                 SizedBox(width: 10),
// //                 Icon(
// //                   Icons.wheelchair_pickup_outlined,
// //                   size: 18,
// //                   color: Colors.lightGreenAccent,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           //  For University Opening and Closing TimeTable
// //           Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 15),
// //             child: Flex(
// //               direction: Axis.horizontal,
// //               children: [
// //                 Text(_status, style: TextStyle(color: _statusColor)),
// //                 SizedBox(width: 10),
// //                 if (_status == "Open Now")
// //                   Text(
// //                     "Closed at 4:00 PM",
// //                     style: TextStyle(color: Colors.black),
// //                   ),
// //                 if (_status == "Closed Now")
// //                   Text(
// //                     "Open at 8:00 AM",
// //                     style: TextStyle(color: Colors.black),
// //                   ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void addCustomMarkerWithInfoWindow() async {
// //     final customIcon = await _getCustomMarkerIcon();

// //     if (mounted) {
// //       setState(() {
// //         _markers.add(
// //           Marker(
// //             markerId: MarkerId("custom_marker"),
// //             position: LatLng(widget.faculty.latitude, widget.faculty.longitude),
// //             icon: customIcon,
// //             onTap: () {
// //               Size size = MediaQuery.of(context).size;
// //               _customInfoWindowController.addInfoWindow!(
// //                 _buildInfoWindow(size),
// //                 LatLng(widget.faculty.latitude, widget.faculty.longitude),
// //               );
// //             },
// //           ),
// //         );
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       body: SizedBox(
// //         height: size.height,
// //         width: size.width,
// //         child: Stack(
// //           children: [
// //             SizedBox(
// //               height: size.height,
// //               width: size.width,
// //               child: GoogleMap(
// //                 initialCameraPosition: CameraPosition(
// //                   target: LatLng(
// //                     widget.faculty.latitude,
// //                     widget.faculty.longitude,
// //                   ),
// //                   zoom: 14,
// //                 ),
// //                 markers: _markers,
// //                 mapType: MapType.normal,
// //                 myLocationButtonEnabled: false,
// //                 myLocationEnabled: false,
// //                 zoomControlsEnabled: true,
// //                 zoomGesturesEnabled: true,
// //                 scrollGesturesEnabled: true,
// //                 rotateGesturesEnabled: true,
// //                 tiltGesturesEnabled: true,

// //                 compassEnabled: true,
// //                 onMapCreated: (GoogleMapController controller) {
// //                   _customInfoWindowController.googleMapController = controller;
// //                   addCustomMarkerWithInfoWindow();
// //                 },
// //                 onTap: (argument) {
// //                   _customInfoWindowController.hideInfoWindow!();
// //                 },
// //                 onCameraMove: (position) {
// //                   _customInfoWindowController.onCameraMove!();
// //                 },
// //               ),
// //             ),
// //             CustomInfoWindow(
// //               controller: _customInfoWindowController,
// //               //
// //               height: size.height * 0.36,
// //               width: size.width * 0.85,
// //               offset: 50,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:custom_info_window/custom_info_window.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:university/Model/new_model.dart';

// class GoogleMapScreen extends StatefulWidget {
//   final Faculty faculty;
//   const GoogleMapScreen({super.key, required this.faculty});

//   @override
//   State<GoogleMapScreen> createState() => _GoogleMapScreenState();
// }

// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   final CustomInfoWindowController _customInfoWindowController =
//       CustomInfoWindowController();
//   final Set<Marker> _markers = {};
//   String _status = "";
//   Color _statusColor = Colors.black;

//   @override
//   void initState() {
//     super.initState();
//     _updateStatus();
//     // Pre-initialize marker so onTap registers reliably
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _loadCustomMarker();
//     });
//   }

//   void _updateStatus() {
//     final now = DateTime.now();
//     final hour = now.hour;
//     setState(() {
//       if (hour >= 8 && hour < 16) {
//         _status = "Open Now";
//         _statusColor = Colors.green;
//       } else {
//         _status = "Closed Now";
//         _statusColor = Colors.red;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _customInfoWindowController.dispose();
//     super.dispose();
//   }

//   Future<BitmapDescriptor> _getCustomMarkerIcon() async {
//     try {
//       final ByteData data = await DefaultAssetBundle.of(
//         context,
//       ).load('assets/images/marker.png');
//       final ui.Codec codec = await ui.instantiateImageCodec(
//         data.buffer.asUint8List(),
//         targetWidth: 60,
//         targetHeight: 60,
//       );
//       final ui.FrameInfo fi = await codec.getNextFrame();
//       final ByteData? resizedData = await fi.image.toByteData(
//         format: ui.ImageByteFormat.png,
//       );

//       return BitmapDescriptor.fromBytes(resizedData!.buffer.asUint8List());
//     } catch (e) {
//       return await BitmapDescriptor.fromAssetImage(
//         const ImageConfiguration(),
//         'assets/images/marker.png',
//       );
//     }
//   }

//   Future<void> _loadCustomMarker() async {
//     final customIcon = await _getCustomMarkerIcon();
//     final targetLatLng = LatLng(
//       widget.faculty.latitude,
//       widget.faculty.longitude,
//     );

//     if (mounted) {
//       setState(() {
//         _markers.add(
//           Marker(
//             markerId: const MarkerId("custom_marker"),
//             position: targetLatLng,
//             icon: customIcon,
//             consumeTapEvents: true, // Captures map tap event directly on marker
//             onTap: () {
//               final Size size = MediaQuery.of(context).size;
//               _customInfoWindowController.addInfoWindow!(
//                 _buildInfoWindow(size),
//                 targetLatLng,
//               );
//             },
//           ),
//         );
//       });
//     }
//   }

//   Widget _buildInfoWindow(Size size) {
//     return Container(
//       height: size.height * 0.32,
//       width: size.width * 0.85,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Stack(
//             children: [
//               SizedBox(
//                 height: size.height * 0.15,
//                 width: size.width * 0.85,
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.vertical(
//                     top: Radius.circular(20),
//                   ),
//                   child: Image.network(
//                     widget.faculty.universityImage,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         color: Colors.grey[300],
//                         child: const Icon(Icons.image_not_supported),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 8,
//                 top: 8,
//                 child: GestureDetector(
//                   onTap: () {
//                     _customInfoWindowController.hideInfoWindow!();
//                   },
//                   child: const CircleAvatar(
//                     radius: 15,
//                     backgroundColor: Colors.white,
//                     child: Icon(Icons.close, size: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 5,
//                   child: Text(
//                     "${widget.faculty.name}, 3-km Shakargarh Road, Narowal",
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 2,
//                   child: Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black45),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.directions,
//                           color: Colors.green,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Container(
//                         padding: const EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black45),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.bookmark_add_outlined,
//                           color: Colors.green,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               children: [
//                 Text(
//                   widget.faculty.rating.toString(),
//                   style: const TextStyle(color: Colors.black),
//                 ),
//                 const SizedBox(width: 5),
//                 RatingBar.builder(
//                   itemBuilder: (context, _) =>
//                       const Icon(Icons.star, color: Colors.amber),
//                   initialRating: widget.faculty.rating,
//                   minRating: 1,
//                   direction: Axis.horizontal,
//                   allowHalfRating: true,
//                   itemCount: 5,
//                   itemSize: 20,
//                   onRatingUpdate: (rating) {},
//                 ),
//                 const SizedBox(width: 5),
//                 Text(
//                   "(${widget.faculty.number})",
//                   style: const TextStyle(color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               children: const [
//                 Text("University", style: TextStyle(color: Colors.black)),
//                 SizedBox(width: 10),
//                 Icon(
//                   Icons.wheelchair_pickup_outlined,
//                   size: 18,
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               children: [
//                 Text(_status, style: TextStyle(color: _statusColor)),
//                 const SizedBox(width: 10),
//                 if (_status == "Open Now")
//                   const Text(
//                     "Closed at 4:00 PM",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 if (_status == "Closed Now")
//                   const Text(
//                     "Open at 8:00 AM",
//                     style: TextStyle(color: Colors.black),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final targetLatLng = LatLng(
//       widget.faculty.latitude,
//       widget.faculty.longitude,
//     );

//     return Scaffold(
//       body: SizedBox(
//         height: size.height,
//         width: size.width,
//         child: Stack(
//           children: [
//             GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: targetLatLng,
//                 zoom: 14,
//               ),
//               markers: _markers,
//               mapType: MapType.normal,
//               myLocationButtonEnabled: false,
//               myLocationEnabled: false,
//               zoomControlsEnabled: true,
//               zoomGesturesEnabled: true,
//               scrollGesturesEnabled: true,
//               rotateGesturesEnabled: true,
//               tiltGesturesEnabled: true,
//               compassEnabled: true,
//               onMapCreated: (GoogleMapController controller) {
//                 _customInfoWindowController.googleMapController = controller;
//               },
//               onTap: (argument) {
//                 _customInfoWindowController.hideInfoWindow!();
//               },
//               onCameraMove: (position) {
//                 _customInfoWindowController.onCameraMove!();
//               },
//             ),
//             CustomInfoWindow(
//               controller: _customInfoWindowController,
//               height: size.height * 0.36,
//               width: size.width * 0.85,
//               offset: 50,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:university/Model/new_model.dart';

class GoogleMapScreen extends StatefulWidget {
  final Faculty faculty;
  const GoogleMapScreen({super.key, required this.faculty});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  final Set<Marker> _markers = {};
  String _status = "";
  Color _statusColor = Colors.black;
  bool _isMapReady = false;

  @override
  void initState() {
    super.initState();
    _updateStatus();
    _initMarker();
  }

  void _updateStatus() {
    final now = DateTime.now();
    final hour = now.hour;
    setState(() {
      if (hour >= 8 && hour < 16) {
        _status = "Open Now";
        _statusColor = Colors.green;
      } else {
        _status = "Closed Now";
        _statusColor = Colors.red;
      }
    });
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  Future<BitmapDescriptor> _getCustomMarkerIcon() async {
    try {
      final ByteData data = await DefaultAssetBundle.of(
        context,
      ).load('assets/images/marker.png');
      final ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetWidth: 70,
        targetHeight: 70,
      );
      final ui.FrameInfo fi = await codec.getNextFrame();
      final ByteData? resizedData = await fi.image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      return BitmapDescriptor.fromBytes(resizedData!.buffer.asUint8List());
    } catch (e) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    }
  }

  Future<void> _initMarker() async {
    final customIcon = await _getCustomMarkerIcon();
    final LatLng position = LatLng(
      widget.faculty.latitude,
      widget.faculty.longitude,
    );

    if (!mounted) return;

    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId("faculty_marker"),
          position: position,
          icon: customIcon,
          consumeTapEvents: true, // IMPORTANT: Prevents map underlying tap
          onTap: () {
            if (_customInfoWindowController.addInfoWindow != null) {
              final Size size = MediaQuery.of(context).size;
              _customInfoWindowController.addInfoWindow!(
                _buildInfoWindow(size),
                position,
              );
            }
          },
        ),
      );
    });
  }

  Widget _buildInfoWindow(Size size) {
    return Container(
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Header with Close Button
            Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Image.network(
                    widget.faculty.universityImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported, size: 40),
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: GestureDetector(
                    onTap: () {
                      _customInfoWindowController.hideInfoWindow?.call();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Faculty details
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${widget.faculty.name}, 3-km Shakargarh Road, Narowal",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.directions,
                        color: Colors.green,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.bookmark_add_outlined,
                        color: Colors.green,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        "${widget.faculty.rating}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      RatingBar.builder(
                        initialRating: widget.faculty.rating.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16,
                        ignoreGestures: true,
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (_) {},
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "(${widget.faculty.number})",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        _status,
                        style: TextStyle(
                          color: _statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _status == "Open Now"
                            ? "• Closes 4:00 PM"
                            : "• Opens 8:00 AM",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final LatLng position = LatLng(
      widget.faculty.latitude,
      widget.faculty.longitude,
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.faculty.name)),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: position, zoom: 15),
            markers: _markers,
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
              setState(() {
                _isMapReady = true;
              });
            },
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow?.call();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove?.call();
            },
          ),

          // CustomInfoWindow must sit over the GoogleMap widget
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 260,
            width: size.width * 0.85,
            offset: 65, // Adjust vertical displacement above marker pin
          ),
        ],
      ),
    );
  }
}
