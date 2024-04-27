import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String? _nom;
  String? _prenom;
  String? _partiPolitique;
  String? _description;
  DateTime? _date;
  bool _accepteConditions = false;

  Future<void> _getImage() async {
    // Code pour ouvrir la galerie et récupérer une image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Création de candidat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ElevatedButton.icon(
                  onPressed: _getImage,
                  icon: Icon(Icons.image),
                  label: Text('Importer depuis la galerie'),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nom = value;
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre prénom';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _prenom = value;
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Parti politique',
                    icon: Icon(Icons.flag),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre parti politique';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _partiPolitique = value;
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value;
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date de naissance',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre date de naissance';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Convertir la chaîne en date
                    _date = DateTime.parse(value!);
                  },
                ),
              ),
              CheckboxListTile(
                title: Text('J\'accepte les termes d\'utilisation'),
                value: _accepteConditions,
                onChanged: (value) {
                  setState(() {
                    _accepteConditions = value!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _accepteConditions) {
                      _formKey.currentState!.save();
                      // Passer les données saisies à la page précédente
                      Navigator.pop(context, {
                        'nom': _nom,
                        'prenom': _prenom,
                        'partiPolitique': _partiPolitique,
                        'description': _description,
                        'date': _date,
                      });
                    }
                  },
                  child: Text('Sauvegarder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
