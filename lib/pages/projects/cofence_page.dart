import 'package:flutter/material.dart';
import 'package:portfolio/pages/project_page.dart';

class CofencePage extends StatelessWidget {
  const CofencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProjectPage(
      name: "Cofence",
      nameSize: 93,
      links: [
        ("Instagram", Uri.parse("https://www.instagram.com/cofence.app/")),
      ],
      images: const [
        "assets/cofence1.png",
        "assets/cofence2.png",
        "assets/cofence3.png",
      ],
      summary:
          "There are basically two companies providing the software to run a fencing tournament (FencingWorldWide and d'Artagnan). "
          "They provide a webinterface to see the progress of the tournaments, when you have to fight next, etc. When you are fighting "
          "in a tournament yourself, you have to know which service they use, and then continuously check the corresponding website. On "
          "the website, you have to filter through all fights to find the ones that actually are interesting to you. If there are more than "
          "100 fencers in a tournament, that gets annoying quickly.\n"
          "So, I had the idea to make an app, that filters fights for you, thus only showing the necessary information for you to participate "
          "in the tournament efficiently. I asked FencingWorldWide for an API, however they refused. So, I built an app, that scrapes the website "
          "for the tournament information and gives you a way to filter, a cleaner overview of the relevant fights and rounds as well as "
          "(somewhat working) notification support, for when you have to fight again (since sometimes the tournament organizers provide a time for "
          "every fight).\n"
          "I have since stopped fencing and maintaining the app, however while I was maintaining it, it was available on the app store to buy for a "
          "small price.",
      features: const [
        (
          "Data sourced from FencingWorldWide and d'Artagnan",
          "i.e. the two major tournament software providers"
        ),
        (
          "Filtering",
          "Filtering for individual fencers as well as multiple at a time (useful for trainers)"
        ),
        ("Clean overview of rounds and direct eliminiation fights", null),
        ("Notifications for upcoming fights", null),
        ("Viewing live and archived tournaments", null),
        ("Was available on the app store", "(while I was maintaining it)"),
      ],
      technologies: [
        Technologies.flutter,
        Technologies.dart,
        Technologies.googleCloud,
        Technologies.webScraping,
      ],
    );
  }
}
