import 'package:flutter/material.dart';

class FlexExp extends StatelessWidget {
  const FlexExp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flexible and Expanded"),
        backgroundColor: const Color.fromARGB(255, 14, 135, 210),
      ),
      body: Column(
        children: [
          Text(
            "Flexible",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 251, 175, 255),
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(255, 115, 222, 255),
                  child: Text(
                      "This is flexible widget, it takes up remaining space but can chirnk if needed"),
                ),
              ),
              Icon(Icons.sentiment_satisfied_alt_outlined)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Expanded",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 251, 175, 255),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(255, 115, 222, 255),
                  child: Text(
                      "This is Expended Widget, it forces the widget to take up all the remaining space"),
                ),
              ),
              Icon(Icons.sentiment_satisfied_alt_outlined)
            ],
          ),
        ],
      ),
    );
  }
}
