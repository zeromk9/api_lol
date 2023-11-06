import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_lol/providers/providers.dart';
import 'package:api_lol/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final championsProvider = Provider.of<ChampionsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          )
        ],
        title: const Center(
          child: Text('CHAMPIONS'),
        ),
      ),
      body: Column(
        children: [
          ChampionSwiper(
            champs: championsProvider.onDisplayChampions,
          ),
        ],
      ),
    );
  }
}
