import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Technologies {
  static final flutterHomePage = Uri.parse("https://flutter.dev/");
  static final rustHomePage = Uri.parse("https://www.rust-lang.org/");
  static final sqliteHomePage = Uri.parse("https://www.sqlite.org/");
  static final firebaseHomePage = Uri.parse("https://firebase.google.com/");
  static final pwaInfoPage = Uri.parse(
      "https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps");
  static final wasmHomePage = Uri.parse("https://webassembly.org/");
  static final dartHomePage = Uri.parse("https://dart.dev/");
  static final googleCloudHomePage = Uri.parse("https://cloud.google.com/");
  static final webScrapingHomePage =
      Uri.parse("https://en.wikipedia.org/wiki/Web_scraping");

  static final flutter =
      ("Flutter", "Cross-Platform App Development Framework", flutterHomePage);
  static final dart = (
    "Dart",
    "Programming Language similar to Java; used on the backend",
    dartHomePage
  );
  static final rust =
      ("Rust", "General Purpose Programming Language", rustHomePage);

  static final googleCloud =
      ("Google Cloud", "Hosting the web scraper backend", googleCloudHomePage);
  static final firebase = (
    "Firebase",
    "Cloud Firestore, Authentication, Cloud Storage",
    firebaseHomePage
  );

  static final pwa = (
    "Progressive Web App",
    "Way to install web apps on a device for offline usage",
    pwaInfoPage
  );
  static final wasm = ("WASM", "Running Rust as a Website", wasmHomePage);
  static final sqlite =
      ("SQLite", "Database schema with 17 tables", sqliteHomePage);

  static final webScraping = (
    "Web Scraping",
    "Extracting information from the frontend of a service",
    webScrapingHomePage
  );
}

class ProjectPage extends StatelessWidget {
  const ProjectPage({
    super.key,
    required this.name,
    this.nameSize = 100,
    this.links = const [],
    required this.images,
    required this.summary,
    required this.features,
    required this.technologies,
  });

  final String name;
  final double nameSize;
  final List<(String, Uri)> links;
  final List<String> images;
  final String summary;
  final List<(String, String?)> features;
  final List<(String, String?, Uri?)> technologies;

  @override
  Widget build(BuildContext context) {
    return ResponsiveContent(
      header: _ProjectHeader(name: name, nameSize: nameSize, links: links),
      content: _ProjectInformation(
        images: images,
        summary: summary,
        features: features,
        technologies: technologies,
      ),
    );
  }
}

class _ProjectHeader extends StatelessWidget {
  const _ProjectHeader({
    required this.name,
    required this.nameSize,
    required this.links,
  });

  final String name;
  final double nameSize;
  final List<(String, Uri)> links;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackButton(),
        Text(
          name,
          style: TextStyle(
            fontSize: nameSize,
            fontWeight: FontWeight.w900,
            height: 1,
          ),
        ),
        if (links.isNotEmpty) ...[
          const SizedBox(height: 25),
          InfoCard(
            color: Colors.deepPurple,
            content: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: links.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(links[i].$1),
                onTap: () => launchUrl(links[i].$2),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ProjectInformation extends StatelessWidget {
  const _ProjectInformation({
    required this.images,
    required this.summary,
    required this.features,
    required this.technologies,
  });

  final List<String> images;
  final String summary;
  final List<(String, String?)> features;
  final List<(String, String?, Uri?)> technologies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 300),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (context, i) => const SizedBox(width: 8),
            itemBuilder: (context, i) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(images[i]),
            ),
          ),
        ),
        const SizedBox(height: 8),
        InfoCard(
          color: Colors.blue[800]!,
          title: "Summary",
          content: Text(summary),
        ),
        const SizedBox(height: 8),
        InfoCard(
          color: Colors.green[800]!,
          title: "Features",
          content: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: features.length,
            itemBuilder: (context, i) {
              var (title, subtitle) = features[i];
              return ListTile(
                title: Text(title),
                subtitle: subtitle != null ? Text(subtitle) : null,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        InfoCard(
          color: Colors.red[800]!,
          title: "Technologies Used",
          content: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: technologies.length,
            itemBuilder: (context, i) {
              var (title, subtitle, uri) = technologies[i];
              return ListTile(
                title: Text(title),
                subtitle: subtitle != null ? Text(subtitle) : null,
                onTap: uri != null ? () => launchUrl(uri) : null,
              );
            },
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.color,
    this.title,
    required this.content,
  });

  final Color color;
  final String? title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          content,
        ],
      ),
    );
  }
}
