import 'package:flutter/material.dart';
import 'candidate.dart'; // Importer la classe Candidate depuis le fichier séparé
import 'candidate_details_page.dart'; // Importer la classe CandidateDetailsPage depuis le fichier séparé

class CandidateListPage extends StatefulWidget {
  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  List<Candidate> candidates = [
    Candidate(
      firstName: 'John',
      lastName: 'Doe',
      party: 'Parti A',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imagePath: 'assets/john_doe.jpg',
    ),
    Candidate(
      firstName: 'Jane',
      lastName: 'Smith',
      party: 'Parti B',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      imagePath: 'assets/jane_smith.jpg',
    ),
    // Liste des candidats initialisée vide pour l'exemple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des candidats'),
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(candidates[index].imagePath),
            ),
            title: Text('${candidates[index].firstName} ${candidates[index].lastName}'),
            subtitle: Text(candidates[index].party),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CandidateDetailsPage(candidate: candidates[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Naviguer vers la page du formulaire pour ajouter un nouveau candidat
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CandidateFormPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
