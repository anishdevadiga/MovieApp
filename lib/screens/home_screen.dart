import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../screens/details_screen.dart';
import '../screens/search_screen.dart';
import '../utils/html_remover.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Get.to(() => SearchScreen()),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.movies.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.movies.length,
          itemBuilder: (context, index) {
            final movie = controller.movies[index]['show'];
            return ListTile(
              leading: movie['image'] != null
                  ? Image.network(movie['image']['medium'], fit: BoxFit.cover)
                  : Icon(Icons.movie, size: 50),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        onTap: (index) {
          if (index == 1) Get.to(() => SearchScreen());
        },
      ),
    );
  }
}
