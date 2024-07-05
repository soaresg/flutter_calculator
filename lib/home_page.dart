import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<String>> labels = [
    ['DEL', 'AC', '%', 'X'],
    ['7', '8', '9', '/'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['0', '.', '='],
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(color: Colors.indigo),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.amber,
              child: ListView.builder(
                itemCount: labels.length,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: labels[index]
                      .map(
                        (e) => SizedBox(
                          width: e == '0' ? width * .5 : width * .25,
                          height: height * .1,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('$e '),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
