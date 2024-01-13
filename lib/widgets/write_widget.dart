import 'package:flutter/material.dart';

class WriteWidget extends StatelessWidget {
  const WriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write down",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        toolbarHeight: 120,
      ),

      body: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.title,
          ),
          hintText: "Let's know your title"
        ),
      ),

    );
  }
}

