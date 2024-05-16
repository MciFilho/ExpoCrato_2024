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
      drawer: const Drawer(),
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
              radius: 45.0,
              backgroundColor: Color.fromARGB(255, 145, 107, 206),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${listAttractions[index].day}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.yellow,
                    ),
                  ),
                  Text(
                    listAttractions[index].sowingDay,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
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
