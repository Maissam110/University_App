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

  @override
  void initState() {
    super.initState();
    _updateStatus();
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

  Future<BitmapDescriptor> _createCustomMarker() async {
    return await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(48, 48)),
      "assets/images/marker.png",
    );
  }

  void addCustomMarkerWithInfoWindow() async {
    Size size = MediaQuery.of(context).size;
    final customMarker = await _createCustomMarker();
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("custom_marker"),
          position: LatLng(widget.faculty.latitude, widget.faculty.longitude),
          icon: customMarker,
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              // Let's design the custom info window
              Container(
                height: size.height * 8.32,
                width: size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //
                    Stack(
                      children: [
                        //
                        SizedBox(
                          height: size.height * 0.203,
                          width: size.width * 0.85,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.network(
                              widget.faculty.universityImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Close Button
                        Positioned(
                          right: 0,

                          top: 0,

                          child: GestureDetector(
                            onTap: () {
                              _customInfoWindowController.hideInfoWindow!();
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.close),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //  Name and Other Info
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "${widget.faculty.name}, 3-km Shahkergar Road, Narowal",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            //
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                //
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black45),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.directions,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black45),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.bookmark_add_outlined,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //  For Rating
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          //
                          Text(
                            widget.faculty.rating.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          RatingBar.builder(
                            itemBuilder: (context, _) =>
                                Icon(Icons.star, color: Colors.yellow),
                            initialRating: widget.faculty.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            onRatingUpdate: (rating) {},
                          ),
                          Text(
                            "(${widget.faculty.number.toString()})",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    //  For Identify and structure
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Text(
                            "University",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.wheelchair_pickup_outlined,
                            size: 18,
                            color: Colors.lightGreenAccent,
                          ),
                        ],
                      ),
                    ),
                    //  For University Opening and Closing TimeTable
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Text(_status, style: TextStyle(color: _statusColor)),
                          SizedBox(width: 10),
                          if (_status == "Open Now")
                            Text(
                              "Closed at 4:00 PM",
                              style: TextStyle(color: Colors.black),
                            ),
                          if (_status == "Closed Now")
                            Text(
                              "Open at 8:00 AM",
                              style: TextStyle(color: Colors.black),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              LatLng(widget.faculty.latitude, widget.faculty.longitude),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.faculty.latitude, widget.faculty.longitude),
              zoom: 14,
            ),
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
              addCustomMarkerWithInfoWindow();
            },
            onTap: (argument) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            //
            height: size.height * 0.36,
            width: size.width * 0.85,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
