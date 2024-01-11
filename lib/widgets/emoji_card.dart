import 'package:flutter/material.dart';

class MoodInputScreen extends StatefulWidget {
  @override
  _MoodInputScreenState createState() => _MoodInputScreenState();
}

class _MoodInputScreenState extends State<MoodInputScreen> {
  String selectedMood = '😊';

  final List<String> moodOptions = ['😊', '😢', '😡', '😎', '😇', '😍', '🤔', '🙄', '😂', '😴'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'How are you feeling today?',
            style:  TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            shrinkWrap: true,
            itemCount: moodOptions.length,
            itemBuilder: (context, index) {
              return _buildMoodButton(moodOptions[index]);
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'My Mood',
            style: TextStyle(fontSize: 20),
          ),
          Text(
                '$selectedMood',
            style: const TextStyle(fontSize: 35),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodButton(String mood) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedMood = mood;
        });
      },
      child: Text(mood, style: const TextStyle(fontSize: 24)),
    );
  }
}