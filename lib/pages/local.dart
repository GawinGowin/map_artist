import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:map_artist/providers/database_provider.dart';
import 'package:map_artist/pages/preview.dart';

class Local extends HookConsumerWidget {
  const Local({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(pointsListProvider);
    final pointsNotifier = ref.watch(pointsListProvider.notifier);

    useEffect(() {
      pointsNotifier.find();
      return;
    }, []);

    return Scaffold(
      body: points.isEmpty ? const Center(child: Text("保存されたデータはありません")):
      ListView.builder(
        itemCount: points.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(points[index].value.title),
              subtitle: Text(
                DateFormat('yyyy-MM-dd HH:mm:ss').format(points[index].value.createdAt)
              ),
              trailing: IconButton(
                icon: const Icon(Icons.map),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context){return Preview(record:points[index]);}
                  ));
                },
              ),
            )
          );
        } 
      )
    );
  }
}