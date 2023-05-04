import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:firebase_database/firebase_database.dart';

import 'package:map_artist/pages/preview.dart';
import 'package:map_artist/data/points.dart';

import 'dart:async';

class Firebase extends HookConsumerWidget {
  const Firebase({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("artRecord");

    final subscription = useState<StreamSubscription?>(null);
    var points = useState<List<dynamic>>([]);

    subscription.value = databaseRef.onValue.listen((DatabaseEvent event) {
        final Object? snapShot = event.snapshot.value;
        List<dynamic> snapShotList = (snapShot as List).where((element) => element != null).toList();
        points.value = [...snapShotList];
        // debugPrint("${snapShotList}");
    });
    useEffect(() {
      return () {
        subscription.value?.cancel();
      };
    }, []);
    
    return Scaffold(
      body: points.value.isEmpty ? const Center(child: Text("クラウド上にデータはありません")):
      ListView.builder(
        itemCount: points.value.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(points.value[index]["title"]),
              subtitle: Text(
                DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(points.value[index]["createdAt"]))
              ),
              trailing: IconButton(
                icon: const Icon(Icons.map),
                onPressed: () {
                },
              ),
            )
          );
        } 
      ),
    );
  }
}