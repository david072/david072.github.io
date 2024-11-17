import 'package:flutter/material.dart';
import 'package:portfolio/pages/project_page.dart';

class FunciallyPage extends StatelessWidget {
  const FunciallyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProjectPage(
      name: "Funcially",
      nameSize: 84,
      links: [
        ("Live Version", Uri.parse("https://david072.github.io/funcially/")),
        ("Repository", Uri.parse("https://github.com/david072/funcially")),
      ],
      images: const ["assets/funcially.png"],
      summary:
          "Funcially is a scientific calculator using purely text inputs. This means to calculate things, "
          "you type your equations into the calculator, which then evaluates it and gives you the result. "
          "With Funcially, I first experimented with lexers, parsers and interpreters, and how to turn a "
          "given source string into an AST to evaluate it. It is fully open-source, but I haven't worked on "
          "it in a while and it has a lot of bugs and flaws. The code is also not very optimal, as I didn't "
          "know how parsers, etc. exactly worked when starting the project. For example, the AST isn't actually "
          "a tree data structure and the parser could be structured in a better way.",
      features: const [
        (
          "Basic and Advanced Operators",
          "e.g. bitwise, factorial, percentages, inferred multiplication",
        ),
        ("\"Objects\"", "Encapsulate more complex data like dates"),
        (
          "Functions",
          "Standard functions (sin, cos, sqrt, ...), custom functions using a user-given term"
        ),
        (
          "Variables",
          "Constants (pi, ...), \"ans\" giving the previous result, user-defined variables"
        ),
        ("Equality Checks", null),
        (
          "Equation Solving",
          "Basic linear equation solving for a single variable"
        ),
        ("Units", "Currencies, SI units, unit prefixes"),
        ("Unit Conversion", "Dynamically converting units and their prefixes"),
        (
          "GUI (desktop & web) and TUI applications",
          "e.g. plotting functions in the GUI"
        ),
      ],
      technologies: [
        Technologies.rust,
        Technologies.wasm,
        Technologies.pwa,
        Technologies.gitAndGitHub,
        Technologies.githubActions,
      ],
    );
  }
}
