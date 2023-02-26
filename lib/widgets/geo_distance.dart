import 'package:flutter/material.dart';
import 'package:weather/services/geo_distance_model.dart';

class GeoDistanceWidget extends StatefulWidget {
  const GeoDistanceWidget({super.key});

  @override
  State<GeoDistanceWidget> createState() => _GeoDistanceWidgetState();
}

class _GeoDistanceWidgetState extends State<GeoDistanceWidget> {
  Map<String, dynamic> data = {};
  bool loading = false;

  Future<dynamic> fetchData() async {
    setState(() => loading = true);
    GeoDistanceModel distanceModel = GeoDistanceModel();
    var res = await distanceModel.fetchDistance(context);
    setState(() {
      data = res;
    });
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      );
    }
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              fetchData();
            },
            child: const Text('Get Geo Distance'),
          ),
          const SizedBox(
            height: 15,
          ),
          data.isEmpty
              ? const Text('No distance data! Please Fetch geo distance')
              : Column(
                  children: [
                    ListTile(
                      title: const Text('Distance'),
                      subtitle: Text('${data["distance"]}'),
                    ),
                    ListTile(
                      title: const Text('Metrics'),
                      subtitle: Text('${data["metrics"]}'),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
