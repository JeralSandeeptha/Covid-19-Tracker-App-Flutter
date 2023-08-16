import 'package:covid_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/custom_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Create a class object
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; //to get screen width

    return Scaffold(
        body: FutureBuilder(
      future: apiService.getData(), //call future method
      builder: (context, snapshot) {
        //create builder
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data!; // mark is can be nullable
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.menu),
                    Text("Covid 19 Tracker",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    Icon(Icons.location_city)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainer(
                      size: size,
                      color: Colors.red,
                      title: "Local Deaths",
                      value: data['local_deaths'],
                    ),
                    CustomContainer(
                      size: size,
                      color: Colors.green,
                      title: 'Local Recovered',
                      value: data["local_recovered"],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainer(
                      size: size,
                      color: Colors.amber,
                      title: "Global Deaths",
                      value: data['global_deaths'],
                    ),
                    CustomContainer(
                      size: size,
                      color: Colors.blue,
                      title: 'Active Cases',
                      value: data["local_active_cases"],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainer(
                      size: size,
                      color: Colors.teal,
                      title: "Total PCR Tests",
                      value: data['total_pcr_testing_count'],
                    ),
                    CustomContainer(
                      size: size,
                      color: Colors.indigo,
                      title: 'Global New Cases',
                      value: data["global_new_cases"],
                    ),
                  ],
                )
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
