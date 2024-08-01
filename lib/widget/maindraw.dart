import 'package:flutter/material.dart';

class MainDraw extends StatelessWidget {
  const MainDraw({super.key, required this.selectTitle});
  final void Function(String identifier) selectTitle;
  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8)
                ],
                end: Alignment.bottomRight,
                begin: Alignment.topLeft,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Cooking up!!',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
           ListTile(
            leading:const Icon(Icons.restaurant, size: 20, color: Colors.white),
            title:const  Text('Meals',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onTap: () {
              selectTitle('Meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, size: 20, color: Colors.white),
            title: const Text('Filter',
                style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
              selectTitle('Filter');
            },
          ),
        ],
      ),
    );
  }
}
