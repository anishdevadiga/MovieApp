import 'package:flutter/material.dart';
import '../utils/html_remover.dart';

class DetailsScreen extends StatelessWidget {
  final Map movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['name'] ?? 'No Title'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            movie['image'] != null
                ? Image.network(movie['image']['original'])
                : Icon(Icons.movie, size: 150),
            SizedBox(height: 16),
            Text(
              movie['name'] ?? 'No Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(movie['summary'] != null
                ? removeHtmlTags(movie['summary'])
                : 'No Summary'),
            SizedBox(height: 16),
            Text('Genres: ${movie['genres']?.join(', ') ?? 'N/A'}'),
            SizedBox(height: 8),
            Text('Language: ${movie['language'] ?? 'N/A'}'),
            SizedBox(height: 8),
            Text('Premiered: ${movie['premiered'] ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}
