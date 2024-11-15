import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/pages/project_page.dart';
import 'package:portfolio/pages/projects/cofence_page.dart';
import 'package:portfolio/pages/projects/fencing_tableau_page.dart';
import 'package:portfolio/pages/projects/funcially_page.dart';

final birthday = DateTime(2007, 02, 18);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int age = (DateTime.now().difference(birthday).inDays / 365).floor();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, I'm",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text(
                  "David Ganz",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 25),
                InfoCard(
                  color: Colors.blue[800]!,
                  title: "Summary",
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ListTile(
                        title: Text("Aspiring software engineer from Germany"),
                      ),
                      ListTile(title: Text("$age years old")),
                    ],
                  ),
                ),
                const Divider(height: 50, thickness: 4),
                Text(
                  "My Projects",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  children: [
                    _ProjectCard(
                      backgroundImage: "assets/fencing_tableau_thumbnail.png",
                      name: "Fencing Tableau",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const FencingTableauPage()),
                      ),
                    ),
                    _ProjectCard(
                      backgroundImage: "assets/funcially_thumbnail.png",
                      name: "Funcially",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const FunciallyPage()),
                      ),
                    ),
                    _ProjectCard(
                      backgroundImage: "assets/cofence_thumbnail.png",
                      name: "Cofence",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CofencePage()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.backgroundImage,
    required this.name,
    required this.onTap,
  });

  final String backgroundImage;
  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: ExactAssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: Colors.black.withOpacity(0.6),
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton.filled(
                    onPressed: onTap,
                    icon: const Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
