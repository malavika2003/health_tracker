import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_tracker/widgets/bottom_navigation_bar.dart';
import '../widgets/main_drawer.dart';

class TaskScreen extends StatefulWidget{

  const TaskScreen({super.key});
  @override
  State<TaskScreen> createState() {
    return _TaskScreenState();
  }
}

class _TaskScreenState extends State<TaskScreen> {
  List tasks = List.empty();
  String title = "";
  String description = "";
  var username = "User";

  // @override
  // void initState() {
  //   super.initState();
  //   tasks = ['task1', 'task2','task3'];
  // }


  void fetchUsername() async {
    var snapshot = await FirebaseFirestore.instance.collection('users').doc(
        username).get();

    if (snapshot.exists) {
      setState(() {
        username = snapshot.data()?['username'];
      });
    }

  }
  @override
  void initState() {
    super.initState();
    // Call a function to fetch the username when the screen is initialized
    fetchUsername();
  }
  createTask() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Tasks').doc(title);
    Map<String, String> taskList = {
      'taskTitle': title,
      'taskDesc': description,
    };
    documentReference.set(taskList).whenComplete(() =>
        print('Data stored successfully'));
  }

  deleteTask(item) {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Tasks').doc(item);
    documentReference.delete().whenComplete(() =>
        print('Deleted successfully'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, \n $username',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        toolbarHeight: 120,
      ),
      drawer: const MainDrawer(),


      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Tasks').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong.');
          }
          else if (snapshot.hasData || snapshot.data != null) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  QueryDocumentSnapshot<Object?>? documentSnapshot =
                  snapshot.data?.docs[index];
                  return Dismissible(
                      key: UniqueKey(),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text((documentSnapshot != null)
                              ? (documentSnapshot['taskTitle'])
                              : ""),
                          subtitle: Text((documentSnapshot != null)
                              ? (documentSnapshot['taskDesc'])
                              : ""),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                //tasks.removeAt(index);
                                deleteTask((documentSnapshot != null)
                                    ? (documentSnapshot['taskTitle'])
                                    : "");
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      ));
                });
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
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: const Text('Add task'),
                  content: Container(
                    width: 400,
                    height: 100,
                    child: Column(
                      children: [
                        TextField(

                          onChanged: (String value) {
                            title = value;
                          },
                        ),
                        TextField(
                          onChanged: (String value) {
                            description = value;
                          },
                        ),

                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          setState(() {
                            //tasks.add(title);
                            createTask();
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Add'))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),


      bottomNavigationBar: const BottomNavigation()
    );

  }
}

