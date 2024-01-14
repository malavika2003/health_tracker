import 'package:flutter/material.dart';
import 'package:health_tracker/screens/read_screen.dart';
import 'package:health_tracker/widgets/write_widget.dart';

class BlogsNextScreen extends StatelessWidget {
  const BlogsNextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'What do you want to do today?',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        toolbarHeight: 120,
      ),

      body:
      GridView(
        padding: const EdgeInsets.all(24.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          SizedBox(
            height: 300,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
                side: BorderSide(color: Colors.blueGrey, width: 2.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const WriteWidget()));

                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 100,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Write your stories here!!',
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 200,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
                side: BorderSide(color: Colors.lightGreenAccent, width: 2.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const ReadScreen()));

                    },
                    icon: const Icon(
                      Icons.book,
                      color: Colors.orange,
                      size: 100,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Read your stories here!!',
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
