import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_mark/map_marker.dart';

const MAPBOX_ACCESS_TOKEN = '';
const MAPBOX_STYLE = '';
const MARKER_COLOR = Color(0xFF3DC5A7);

final _myLocation = LatLng(11.03156, -70.67900);

class AnimatedMarkerMap extends StatefulWidget {
  const AnimatedMarkerMap({super.key});

  @override
  State<AnimatedMarkerMap> createState() => _AnimatedMarkerMapState();
}

class _AnimatedMarkerMapState extends State<AnimatedMarkerMap> {
  final _pageController = PageController();
  List<Marker> _buildMarkers() {
    final markerList = <Marker>[];
    for (int i = 0; i <= mapMarkers.length - 1; i++) {
      final mapItem = mapMarkers[i];

      markerList.add(Marker(
          width: 40,
          height: 40,
          point: mapItem.location,
          builder: (_) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(i,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.elasticOut);
                print(mapItem.title);
              },
              child: Image.asset('img/unnamed.png'),
            );
          }));
    }
    return markerList;
  }

  Widget _darkModeTileBuilder(
    BuildContext context,
    Widget tileWidget,
    TileImage tile,
  ) {
    return ColorFiltered(
      //colorFilter: const ColorFilter.matrix(<double>[
      //  -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
      //  -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
      //  -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
      //  0, 0, 0, 1, 0, // Alpha channel
      //]),
      colorFilter: const ColorFilter.matrix(<double>[
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
      ]),
      child: tileWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Marker> markers = _buildMarkers();
    return Scaffold(
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                  minZoom: 8, maxZoom: 20, zoom: 14, center: _myLocation),
              nonRotatedChildren: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  tileBuilder: _darkModeTileBuilder,
                  //additionalOptions: {'accessToken':MAPBOX_ACCESS_TOKEN,'id':MAPBOX_STYLE},
                ),
                MarkerLayer(
                  markers: markers,
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        point: _myLocation,
                        builder: (_) {
                          return Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: MARKER_COLOR, shape: BoxShape.circle),
                          );
                        })
                  ],
                ),
              ],
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                height: MediaQuery.of(context).size.height * 0.3,
                child: PageView.builder(
                    itemCount: markers.length,
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = mapMarkers[index];
                      return _MapItemDetails(mapMarker: item);
                    })), //add a pageview
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  icon: const Icon(Icons.local_grocery_store),
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  }),
              label: 'product'),
          BottomNavigationBarItem(
              icon: IconButton(
                  icon: const Icon(Icons.map_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, "/map");
                  }),
              label: 'map'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'acount')
        ]));
  }
}

class _MapItemDetails extends StatelessWidget {
  const _MapItemDetails({super.key, required this.mapMarker});
  final MapMarker mapMarker;

  @override
  Widget build(BuildContext context) {
    final _styleDesc = TextStyle(
        fontWeight: FontWeight.w200, color: Colors.grey[800], fontSize: 20);
    final _styleTitle = TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25);
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/tiendas",
            arguments: {'query': mapMarker.id}),
        child: Card(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(child: Image.asset(mapMarker.image)),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      mapMarker.title,
                      style: _styleTitle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      mapMarker.address,
                      style: _styleDesc,
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
