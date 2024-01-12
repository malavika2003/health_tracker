import 'dart:async';
import 'dart:convert';
import 'dart:ui'; // Import the 'ui' library for the Color class
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class QuotesSection extends StatefulWidget {
  const QuotesSection({Key? key});

  @override
  State<QuotesSection> createState() => _QuotesSectionState();
}

class _QuotesSectionState extends State<QuotesSection> {
  var accessKey = 'eTdRNnruPpky2ANZXVM80Ovy-Eas2kc8Nm_fAaO10N0';
  var category = 'inspirational';
  var apiKey = 'VOKAD3v8FLR7fPMxJsrnNw==5X4ltVJXs0SspJVX';
  List<dynamic>? quoteList;
  int imagenumber = 0;
  List? imageList = [];

  Color getContrastColor(Color backgroundColor) {

    double luminance = (0.299 * backgroundColor.red +
        0.587 * backgroundColor.green +
        0.114 * backgroundColor.blue) /
        255;


    return luminance > 0.2 ? Colors.black : Colors.white;
  }

  @override
  void initState() {
    super.initState();
    getImage();
    startImageRotation();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      shadowColor: Colors.black38,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: double.infinity,
        height: 200,
        child: Stack(
          children: [
            if (imageList != null && imageList!.isNotEmpty)
              Opacity(
                opacity: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        imageList![imagenumber]['urls']['regular'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: quoteList != null && quoteList!.isNotEmpty
                    ? Text(
                  "\"${quoteList![0]['quote'] ?? ''}\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: getContrastColor(
                        Theme.of(context).colorScheme.onBackground),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
                    : Text(
                  "Nothing is impossible. The word itself says 'I'm possible!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: getContrastColor(
                        Theme.of(context).colorScheme.onBackground),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getImage() async {
    var url =
        'https://api.unsplash.com/search/photos?per_page=30&query=nature&order_by=relevant&client_id=$accessKey';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var unsplashData = json.decode(response.body);
    setState(() {
      imageList = unsplashData['results'];
    });
  }

  void startImageRotation() {
    const Duration rotationDuration = Duration(seconds: 100);

    Timer.periodic(rotationDuration, (timer) {
      if (imageList != null && imageList!.isNotEmpty) {
        setState(() {
          imagenumber = (imagenumber + 1) % imageList!.length;
        });
      }
    });
  }

  void getQuotes() async {
    var apiUrl = 'https://api.api-ninjas.com/v1/quotes?category=$category';
    try {
      http.Response response = await http.get(
        Uri.parse(apiUrl),
        headers: {'X-Api-Key': apiKey},
      );

      if (response.statusCode == 200) {
        setState(() {
          quoteList = json.decode(response.body);
        });
      } else {
        print("Error: ${response.statusCode} ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
