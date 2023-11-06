import 'package:flutter/material.dart';
import 'package:kantor_gubernur_indonesia/json/office_list.dart';
import 'package:kantor_gubernur_indonesia/screens/map_screen.dart';

class OfficeListScreen extends StatelessWidget {
  const OfficeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF0000),
        title: const Text('Kantor Gubernur'),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        itemCount: offices.length,
        itemBuilder: (_, index) {
          final office = offices[index];

          return Container(
            margin: const EdgeInsets.only(
              bottom: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.15),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(office["image"]!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        office["name"]!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: Text(
                          office["address"]!,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        office["website"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: Text(
                          office["phone"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => MapScreen(
                                  name: office["name"]!,
                                  lat: double.parse(office["lat"]!),
                                  long: double.parse(office["long"]!),
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF0000),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                            child: const Text(
                              'Lihat Di Map',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
