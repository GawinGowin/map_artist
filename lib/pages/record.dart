import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_artist/providers/app_theme_provider.dart';

import 'package:map_artist/pages/local.dart';
import 'package:map_artist/pages/firebase.dart';

class Record extends HookConsumerWidget {
  const Record({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ThemeMode modeNow = ref.watch(appThemeNotifierProvider);
    if (modeNow == ThemeMode.system){
      bool isDarkMode = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      modeNow = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
    IconData switchIcon = modeNow == ThemeMode.light ? Icons.dark_mode : Icons.light_mode;
    ThemeMode modeNext = modeNow == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    TabController tabController = useTabController(initialLength:2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Data'),
        centerTitle: true,
        elevation: 10,
        leading: const Icon(Icons.map),
        actions: [
          IconButton(
            icon: Icon(switchIcon),
            onPressed: () {
              ref.read(appThemeNotifierProvider.notifier).updateState(modeNext);
            },
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.folder_open),
              child: Text("local"),
            ),
            Tab(icon: Icon(Icons.cloud_outlined),
              child: Text("cloud"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const <Widget>[
          Local(),
          Firebase(),
        ],
      ),
    );
  }
}