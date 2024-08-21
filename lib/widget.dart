import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String text = "Ни одна кнопка не нажата";

  void printFirst() {
    setState(() {
      text = 'Нажата первая или вторая кнопка';
    });
  }

  void printSecond() {
    setState(() {});
    text = 'Нажата третья кнопка';
  }

  void printLast() {
    text = 'Нажата четвёртая кнопка';
    setState(() {});
  }

  void onLong() {
    setState(() {
      text = 'Долгое нажатие';
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.red),
      foregroundColor: WidgetStateProperty.all(Colors.black),
      overlayColor: WidgetStateProperty.all(Colors.green),
      shadowColor: WidgetStateProperty.all(Colors.blue),
      elevation: WidgetStateProperty.all(19),
      padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
      minimumSize: WidgetStateProperty.all(const Size(100, 100)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      //alignment:Alignment.topLeft,
    );
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          ElevatedButton(
            style: style,
            onPressed: printFirst,
            onLongPress: onLong,
            clipBehavior: Clip.hardEdge,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.bubble_chart),
                const SizedBox(width: 10),
                const Text('Нажми меня'),
                const SizedBox(width: 10),
                const Icon(Icons.bubble_chart),
                Container(
                  color: Colors.amber,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
          OutlinedButton(
            style: style,
            onLongPress: onLong,
            onPressed: printFirst,
            clipBehavior: Clip.hardEdge,
            child: const Text('Нажми меня'),
          ),
          TextButton(
            style: style,
            onLongPress: onLong,
            onPressed: printSecond,
            clipBehavior: Clip.hardEdge,
            child: const Text('Нажми меня'),
          ),
          IconButton(
            iconSize: 40,
            //padding: const EdgeInsets.all(0),
            style: style,
            onPressed: printLast,
            alignment: Alignment.topRight,

            // highlightColor: Colors.brown,
            // splashRadius: 20,
            // splashColor: Colors.yellow,
            // color: Colors.blue,

            // disabledColor: Colors.pink,

            icon: const Icon(Icons.bubble_chart),
          ),
        ],
      ),
    );
  }
}
