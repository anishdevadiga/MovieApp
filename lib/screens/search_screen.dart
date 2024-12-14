import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/details_screen.dart';
import '../controllers/search_controller.dart' as custom; // Alias for custom SearchController
import '../utils/html_remover.dart';

class SearchScreen extends StatelessWidget {
  final custom.SearchController controller = Get.find(); // Use the aliased name here
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Search movies...',
            border: InputBorder.none,
          ),
          onSubmitted: (value) => controller.searchMovies(value),
        ),
      ),
      body: Obx(() {
        if (controller.searchResults.isEmpty) {
          return const Center(child: Text('Search for movies'));
        }
        return ListView.builder(
          itemCount: controller.searchResults.length,
          itemBuilder: (context, index) {
            final movie = controller.searchResults[index]['show'];
            return ListTile(
              leading: movie['image'] != null
                  ? Image.network(movie['image']['medium'], fit: BoxFit.cover)
                  : const Icon(Icons.movie, size: 50),
              title: Text(movie['name'] ?? 'No Title'),
              subtitle: Text(
                movie['summary'] != null ? removeHtmlTags(movie['summary']) : 'No Summary',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => Get.to(() => DetailsScreen(movie: movie)),
            );
          },
        );
      }),
    );
  }
}
