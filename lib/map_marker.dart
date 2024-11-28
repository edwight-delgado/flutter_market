import 'package:latlong2/latlong.dart';

class MapMarker {
  const MapMarker({
    required this.id,
    required this.image,
    required this.title,
    required this.address,
    required this.location,
  });
  final String id;
  final String image;
  final String title;
  final String address;
  final LatLng location;
}

final List locations = [
  LatLng(11.09156, -70.67000),
  LatLng(11.07156, -70.68900),
];

final List<MapMarker> mapMarkers = [
  MapMarker(
    id: '1',
    image: 'img/pizzahunt.png',
    title: 'El Rincon Del Chivo',
    address: 'address pizza hunt',
    location: LatLng(11.0294872, -70.6778367),
  ),
  MapMarker(
    id: '2',
    image: 'img/pizzahunt.png',
    title: 'Hotel Don Guillermo',
    address:
        'Casco Central de Dabajuro, Frente a la Av. Bolívar, Dabajuro 4118, Falcón',
    location: LatLng(11.0260816, -70.6843184),
  ),
  MapMarker(
    id: '3',
    image: 'img/kfc.png',
    title: 'Comercializadora "El Negro"',
    address: '4118, Dabajuro 4118, Falcón',
    location: LatLng(11.0260816, -70.6843184),
  ),
  MapMarker(
    id: '4',
    image: 'img/papas.png',
    title: 'Sporting Pizza',
    address: 'Ecuador, Dabajuro 4118, Falcón',
    location: LatLng(11.0190872, -70.6778667),
  ),
  MapMarker(
    id: '5',
    image: 'img/starbucks.png',
    title: 'Variedades La Montañesa',
    address: '289C+GJ3, Dabajuro 4118, Falcón',
    location: LatLng(11.0190701, -70.6783173),
  ),
];
