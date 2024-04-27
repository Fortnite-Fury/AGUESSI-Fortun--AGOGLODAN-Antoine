import 'package:flutter/material.dart';
import 'pages/candidate_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulaire',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _nom = 'John';
  String? _prenom = 'Doe';
  String? _partiPolitique = 'Parti XYZ';
  String? _description = 'Description du candidat';
  DateTime? _date = DateTime(1990, 1, 1);

  void _showForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyForm()),
    );

    if (result != null) {
      setState(() {
        _nom = result['nom'];
        _prenom = result['prenom'];
        _partiPolitique = result['partiPolitique'];
        _description = result['description'];
        _date = result['date'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                // Espace pour la photo du candidat (à remplacer par votre code d'affichage de photo)
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey, // Placeholder pour la photo
                  margin: EdgeInsets.only(right: 16.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nom: $_nom'),
                    Text('Prénom: $_prenom'),
                    Text('Description: $_description'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _showForm,
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
