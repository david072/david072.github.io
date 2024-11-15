import 'package:flutter/material.dart';
import 'package:portfolio/pages/project_page.dart';

class FencingTableauPage extends StatelessWidget {
  const FencingTableauPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProjectPage(
      name: "Fencing Tableau",
      nameSize: 95,
      images: const ["assets/fencing_tableau.png"],
      summary:
          "I (used to) do fencing in a local club. There, we recorded the results of our fights on a little whileboard, "
          "to at the end of a season award a price to whoever fought the most fights. However, this was annoying at times, "
          "especially when having fought against someone multiple times or when fighting in a different mode (i.e. not just "
          "everyone against everyone else).\n"
          "As a solution, I developed the Fencing Tableau. The club bought a cheap Android tablet to run this app. The app "
          "allows for recording fights in a similar \"tableau\" style way, as well as different modes, like a direct elimination, "
          "a tournament (tableau and direct elimination by seeding based on the tableau) and team fights. In addition, you can "
          "upload the fight data to the cloud to analyse the data further, which could in the future improve finding out who did "
          "the \"best\" during the season.",
      features: const [
        ("Tableaux and Tableau Ranking", null),
        ("Direct Eliminations", null),
        (
          "Tournaments",
          "Direct elimination seeded based on preceeding tableau"
        ),
        ("Synchronizing data from multiple devices", null),
      ],
      technologies: [
        Technologies.flutter,
        Technologies.sqlite,
        Technologies.firebase,
        Technologies.gitAndGitHub,
      ],
    );
  }
}
