import 'package:expocrato_2024/attraction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Attraction> _listFavorite = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 63, 33, 197),
        foregroundColor: Colors.white,
        title: const Text('ExpoCrato 2024'),
      ),
      body: ListView.builder(
        itemCount: listAttractions.length,
        itemBuilder: (context, index) {
          final isFavorite = _listFavorite.contains(listAttractions[index]);
          return ListTile(
            title: Text(listAttractions[index].name),
            subtitle: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: listAttractions[index]
                  .tags
                  .map((tag) => Chip(label: Text('#$tag')))
                  .toList(),
            ),
            leading: CircleAvatar(
              child: Text('${listAttractions[index].day}'),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  if (isFavorite) {
                    _listFavorite.remove(listAttractions[index]);
                  } else {
                    _listFavorite.add(listAttractions[index]);
                  }
                });
              },
              icon: isFavorite
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    );
  }
}
