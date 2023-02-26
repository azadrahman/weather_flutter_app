import 'package:flutter/material.dart';
import 'package:weather/models/post.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  PostDto? post;

  Future<dynamic> getFetchData() async {
    PostApi postApi = PostApi();
    var data = await postApi.fetch();
    setState(() {
      post = PostDto.fromJson(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getFetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_left,
                    size: 50,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 24,
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    icon: const Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 40,
                    ),
                    hintText: 'Enter a city name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )),
                onChanged: (value) {
                  cityName = value;
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: const Text('Get Weather'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              post == null
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Mr ABC'),
                                const SizedBox(
                                  width: 30,
                                ),
                                Row(
                                  children: [
                                    Text('User Id: ${post?.userId}'),
                                    Text('post Id: ${post?.id}')
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Text('${post?.title}'),
                          subtitle: Text('${post?.body}'),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
