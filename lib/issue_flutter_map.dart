import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class IssueFlutterMap extends StatefulWidget {
  const IssueFlutterMap({Key? key}) : super(key: key);

  @override
  State<IssueFlutterMap> createState() => _IssueFlutterMapState();
}

class _IssueFlutterMapState extends State<IssueFlutterMap> {
  late MapController _mapController;

  @override
  void initState() {
    _mapController = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          onMapReady: () {},
          minZoom: 0,
          maxZoom: 5,
          zoom: 3,
        ),
        children: [
          TileLayer(
            urlTemplate: 'assets/tiles/{z}-{x}-{y}.jpg',
            tileProvider: AssetTileProvider(),
          ),
        ],
      );
    });
  }
}

class AssetTileProvider extends TileProvider {
  @override
  ImageProvider<Object> getImage(Coords<num> coords, TileLayer options) {
    return AssetImage('assets/tiles/${coords.z.toInt()}-${coords.x.toInt()}-${coords.y.toInt()}.jpg');
  }
}