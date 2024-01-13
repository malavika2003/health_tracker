import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_tracker/widgets/write_widget.dart';

final  _firebase = FirebaseAuth.instance;

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key,});
  //final String title;
  //final String description;

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {

  var email = {FirebaseAuth.instance.currentUser?.email};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Stories..",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        toolbarHeight: 120,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
        .collection('users')
        .doc(_firebase.currentUser!.uid)
        .collection('journals')
        .snapshots(),
        builder: (context, snapshot){
          if (snapshot.hasError){
            return const Text('Something went wrong.');
          }
          else if(snapshot.hasData || snapshot.data != null) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  QueryDocumentSnapshot<Object?>? documentSnapshot =
                  snapshot.data?.docs[index];
                  return Container(
                      margin: EdgeInsets.all(13.0),
                      child: Card(
                        surfaceTintColor: Theme.of(context).colorScheme.onPrimaryContainer,
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: ListTile(
                            title: Text((documentSnapshot != null)
                                ? (documentSnapshot['jTitle'])
                                : ""),
                            subtitle: Text((documentSnapshot != null)
                                ? (documentSnapshot['jDesc'])
                                : ""),
                          ),
                        ),
                      )
                  );
                }
            );
          }

            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.red,
                ),
              ),
            );


        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>
            WriteWidget()));
          },
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),


    );
  }
}
