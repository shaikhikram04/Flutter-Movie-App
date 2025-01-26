import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/modified_text.dart';

class TvList extends StatelessWidget {
  const TvList({
    super.key,
    required this.tvList,
    required this.title,
  });

  final List tvList;
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
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final tvData = tvList[index];
                final String tvName = tvData['name'] ?? tvData['title'];

                const String initialUrl = 'https://image.tmdb.org/t/p/w500';

                String bannerUrl = initialUrl +
                    (tvData['backdrop_path'] ?? tvData['poster_path']);
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Description(
                        name: tvName,
                        description: tvData['overview'],
                        bannerUrl: bannerUrl,
                        posterUrl: initialUrl + tvData['poster_path'],
                        vote: tvData['vote_average'].toString(),
                        launchOn: tvData['first_air_date'],
                      ),
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      spacing: 10,
                      children: [
                        Container(
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(bannerUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: ModifiedText(
                            text:
                                tvList[index]['name'] ?? tvList[index]['title'],
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
