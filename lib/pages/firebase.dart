import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase extends HookConsumerWidget {
  const Firebase({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();

    void fire() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final snapshot = await firestore.collection("pointsFirebase").get();
      var msg = "";
      snapshot.docChanges.forEach((element) {
        final createdAt = element.doc.get("createdAt");
        final points = element.doc.get("points");
        final title = element.doc.get("title");
        msg += "$title (${points[0]}, ${points[1]})";
      });
      textEditingController.text = msg;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("RESOURCE ACCESS"),
            const Padding(padding: EdgeInsets.all(10.0)),
            TextField(
              controller: textEditingController,
              style: const TextStyle(fontSize: 24),
              minLines: 1,
              maxLines: 5,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          fire();
        },
        child: const Icon(Icons.open_in_new),
      ),
    );
  }
}
