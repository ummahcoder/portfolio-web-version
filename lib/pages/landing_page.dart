import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void _launchFlutterSite() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchGolangrSite() async {
    final Uri url = Uri.parse('https://go.dev/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchLinkedinProfile() async {
    final Uri url =
        Uri.parse('https://www.linkedin.com/in/feruza-urinbaeva-6a25a6273/');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }

  void _launchGithubProfile() async {
    final Uri url = Uri.parse("https://www.github.com/urinbayeeva/");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }

  void _launchInstagramProfile() async {
    final Uri url = Uri.parse("https://www.instagram.com/ummahcoder/");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090E16),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTabText("Contacts", _launchLinkedinProfile),
                const SizedBox(width: 20),
                _buildTabText("Linkedin", _launchLinkedinProfile),
                const SizedBox(width: 20),
                _buildTabText("GitHub", _launchGithubProfile),
                const SizedBox(width: 20),
                _buildTabText("Instagram", _launchInstagramProfile),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Hello 👋",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    const Text(
                        "I'm Feruza\nUrinbaeva\nand I can build\n your apps or your\nwebsites using:",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 30),
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero),
                        foregroundColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Colors.pink;
                          }
                          return Colors.grey;
                        }),
                      ),
                      onPressed: _launchFlutterSite,
                      child: const Text(
                        "Flutter",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero),
                        foregroundColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Colors.pink;
                          }
                          return Colors.grey;
                        }),
                      ),
                      onPressed: _launchGolangrSite,
                      child: const Text(
                        "Golang",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ClipOval(
                  child: Image.asset(
                    "assets/images/my_picture.jpg",
                    width: 400.0,
                    height: 400.0,
                    fit: BoxFit.cover,
                  ),
                ),
                OutlinedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Download CV",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold)),
                    ))
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildTabText(String text, VoidCallback onTap) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.pink;
          }
          return Colors.grey;
        }),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
