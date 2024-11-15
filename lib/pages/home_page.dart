import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/pages/project_page.dart';
import 'package:portfolio/pages/projects/cofence_page.dart';
import 'package:portfolio/pages/projects/fencing_tableau_page.dart';
import 'package:portfolio/pages/projects/funcially_page.dart';
import 'package:url_launcher/url_launcher.dart';

const double mediumScreenWidth = 950;
const double largeScreenWidth = 1100;

final github = Uri.parse("https://github.com/david072");

final birthday = DateTime(2007, 02, 18);

class UrlListTile extends StatelessWidget {
  const UrlListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.uri,
  });

  final String title;
  final String? subtitle;
  final Uri uri;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: () => launchUrl(uri),
    );
  }
}

class ResponsiveContent extends StatelessWidget {
  const ResponsiveContent({
    super.key,
    required this.header,
    required this.content,
  });

  final Widget header;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    Widget body;
    if (width < mediumScreenWidth) {
      body = SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            const Divider(height: 50, thickness: 4),
            content,
          ],
        ),
      );
    } else if (width >= mediumScreenWidth && width <= largeScreenWidth) {
      body = Row(
        children: [
          Expanded(child: header),
          const VerticalDivider(width: 50),
          Expanded(child: SingleChildScrollView(child: content)),
        ],
      );
    } else {
      body = Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 3 / 4 * width,
          child: Row(
            children: [
              Expanded(child: header),
              const VerticalDivider(width: 50),
              Expanded(child: SingleChildScrollView(child: content)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(!kIsWeb ? 8 : 32),
          child: body,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveContent(
      header: _HomePageHeader(),
      content: _ProjectsList(),
    );
  }
}

class _HomePageHeader extends StatelessWidget {
  const _HomePageHeader();

  @override
  Widget build(BuildContext context) {
    int age = (DateTime.now().difference(birthday).inDays / 365).floor();

    return Column(
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
        const Text("aka david072"),
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
        const SizedBox(height: 8),
        InfoCard(
          color: Colors.deepPurple,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              UrlListTile(title: "GitHub", uri: github),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProjectsList extends StatelessWidget {
  const _ProjectsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              onTap: () => context.go("/fencing-tableau"),
            ),
            _ProjectCard(
              backgroundImage: "assets/funcially_thumbnail.png",
              name: "Funcially",
              onTap: () => context.go("/funcially"),
            ),
            _ProjectCard(
              backgroundImage: "assets/cofence_thumbnail.png",
              name: "Cofence",
              onTap: () => context.go("/cofence"),
            ),
          ],
        ),
      ],
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
