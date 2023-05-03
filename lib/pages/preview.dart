import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:map_artist/data/points.dart';
import 'package:map_artist/utils.dart';

import 'package:map_artist/providers/database_provider.dart';

import 'package:firebase_database/firebase_database.dart';

class Preview extends HookConsumerWidget {
  const Preview({super.key, required this.record});
  final ArtRecord record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pointsValue = record.value.points.toList();
    final List<LatLng?> pointsListNullable = pointsValue.map((e) => LatLng.fromJson(e)).toList();
    final List<LatLng> pointsList = [for (var value in pointsListNullable) if (value != null) value];
    final LatLng center = culcCenter(pointsList);
    final pointsListNotifier = ref.watch(pointsListProvider.notifier);

    final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("artRecord/${record.key}");

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: Text(record.value.title),
        actions: [
          IconButton(
            onPressed: (){
              pointsListNotifier.delete(record)
              .then((_) => Navigator.pushNamed(context, "/root"));
            },
            icon: const Icon(Icons.delete, color: Colors.black,),)
        ],
      ),

      body: GoogleMap(
        zoomControlsEnabled: false,
        myLocationEnabled: false,
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 14.0,
        ),
        polylines:{Polyline(
          polylineId: const PolylineId('result polyline'),
          color: Colors.orange,
          width: 3,
          points: pointsList,
        )},
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud_upload),
        onPressed: () async {
          await databaseRef.set(
            record.value.toJson()
          );
        },
      ),
    );
  }
}