import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trending Movies',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  child: Column(
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/w500${trending[index]['poster_path']}',
                        height: 150,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        trending[index]['title'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
