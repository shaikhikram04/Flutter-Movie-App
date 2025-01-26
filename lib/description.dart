import 'package:flutter/material.dart';
import 'package:movie_app/utils/modified_text.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.vote,
    required this.launchOn,
  });

  final String name, description, bannerUrl, posterUrl, vote, launchOn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: ModifiedText(
                    text: '   ⭐ Average Rating : $vote',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(10),
            child: ModifiedText(text: name, fontSize: 24),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: ModifiedText(text: 'Released on - $launchOn', fontSize: 14),
          ),
          Row(
            spacing: 10,
            children: [
              const SizedBox(),
              SizedBox(
                height: 200,
                width: 100,
                child: Image.network(posterUrl),
              ),
              Expanded(
                  child: ModifiedText(
                text: description,
                fontSize: 18,
                maxLine: null,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
