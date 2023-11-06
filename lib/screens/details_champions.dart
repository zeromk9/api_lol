import 'package:flutter/material.dart';
import 'package:api_lol/models/models.dart';

class DetailsChampionScreen extends StatelessWidget {
  const DetailsChampionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Champion champ =
        ModalRoute.of(context)?.settings.arguments as Champion;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppbar(
            champ: champ,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [_InfoChampion(champ: champ), const _Info()],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  final Champion champ;

  const _CustomAppbar({required this.champ});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            champ.champion,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        background: Image(
          image: AssetImage(champ.champImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _InfoChampion extends StatelessWidget {
  final Champion champ;

  const _InfoChampion({required this.champ});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage(champ.champImage),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  champ.champion,
                  style: const TextStyle(fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  champ.origen,
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      champ.resource.toString(),
                      style: const TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Text(
        'Description of Champion:',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
