import 'package:flutter/material.dart';

class MoodInputScreen extends StatefulWidget {
  @override
  _MoodInputScreenState createState() => _MoodInputScreenState();
}

class _MoodInputScreenState extends State<MoodInputScreen> {
  String selectedMood = '😊';

  final List<String> moodOptions = [
    '😊',
    '😢',
    '😡',
    '😎',
    '😇',
    '😍',
    '🤔',
    '🙄',
    '😂',
    '😴'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'How are you feeling today?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  shrinkWrap: true,
                  itemCount: moodOptions.length,
                  itemBuilder: (context, index) {
                    return _buildMoodButton(moodOptions[index]);
                  },
                ),
              ),
            ),
            const Text(
              'My Mood',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$selectedMood',
              style: const TextStyle(fontSize: 70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodButton(String mood) {
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedMood = mood;
          });
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(8),
        ),
        child: Text(mood, style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
