import 'package:flutter/material.dart';

class Customscrollview extends StatelessWidget {
  const Customscrollview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 234, 14, 237),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // Sliver App Bar
          const SliverAppBar(
            pinned: true,
            expandedHeight: 20,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Custom Demo'),
            ),
          ),
          // Sliver Grid
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.pink[100 * (index % 9 + 1)],
                  child: Column(
                    children: [
                      Icon(Icons.access_alarm, size: 15),
                      Text('Grid Item $index')
                    ],
                  ),
                );
              },
              childCount: 20,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4,
            ),
          ),
          // Sliver Fixed List
        ],
      ),
    );
  }
}
