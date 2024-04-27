import 'package:flutter/material.dart';
import 'candidate.dart'; // Importer la classe Candidate depuis le fichier séparé

class CandidateDetailsPage extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailsPage({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du candidat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'L\'union progressiste',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(candidate.imagePath),
            ),
            SizedBox(height: 10),
            Text(
              '${candidate.firstName} ${candidate.lastName}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              candidate.description,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
