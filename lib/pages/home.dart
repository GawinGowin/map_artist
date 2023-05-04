import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    final responseMd = useState<String>("");

    Future<void> loadData() async {
      var response = await http.get(Uri.parse('https://raw.githubusercontent.com/GawinGowin/map_artist/develop/README.md'));
      switch (response.statusCode) {
        case 200:
          responseMd.value = response.body;
          break;
        case 403:
          responseMd.value = '403 Forbidden';
          break;
        case 404:
          responseMd.value = '404 Not Found';
          break;
      }
    }

    useEffect(() {
      loadData();
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        elevation: 10,
        leading: const Icon(Icons.home),
      ),
      body: Markdown(
          selectable: true,
          data: responseMd.value,
        )
    );
  }
}

