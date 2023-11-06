import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:api_lol/models/models.dart';

class ChampionSwiper extends StatelessWidget {
  final List<Champion> champs;
  const ChampionSwiper({super.key, required this.champs});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: champs.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final champion = champs[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: champion),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
/*               child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(champion.fullPosterImg),
                fit: BoxFit.cover,
              ), */
            ),
          );
        },
      ),
    );
  }
}
