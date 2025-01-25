import 'package:flutter/material.dart';
import 'package:movie_app/utils/modified_text.dart';

class MoviesHorizontalList extends StatelessWidget {
  const MoviesHorizontalList({
    super.key,
    required this.moviesList,
    required this.title,
  });

  final List moviesList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: title,
            color: Colors.white,
            fontSize: 26,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moviesList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${moviesList[index]['poster_path']}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: ModifiedText(
                            text: moviesList[index]['title'] ??
                                moviesList[index]['name'],
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
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
