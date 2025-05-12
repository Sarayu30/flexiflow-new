import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DefaultConnector {
  final FirebaseFirestore firestore;

  // Static connector config
  static final ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'default',
    'flexiflow',
  );

  // Private named constructor
  DefaultConnector._internal(this.firestore);

  // Singleton instance
  static final DefaultConnector _instance = DefaultConnector._internal(
    FirebaseFirestore.instance,  // Using FirebaseFirestore instance
  );

  // Factory to return the singleton instance
  factory DefaultConnector() {
    return _instance;
  }
}

// Assuming ConnectorConfig is your custom class, here's an example
class ConnectorConfig {
  final String region;
  final String environment;
  final String projectName;

  ConnectorConfig(this.region, this.environment, this.projectName);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Connector Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Example of using the DefaultConnector instance to access Firestore
              var connector = DefaultConnector();
              var firestore = connector.firestore;
              var usersCollection = firestore.collection('users');
              var snapshot = await usersCollection.get();

              // Display fetched data
              snapshot.docs.forEach((doc) {
                print(doc.data());
              });
            },
            child: Text('Fetch Data from Firestore'),
          ),
        ),
      ),
    );
  }
}
