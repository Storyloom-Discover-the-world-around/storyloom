import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaWidget extends StatelessWidget {
  final Map<String, String> socials;

  const SocialMediaWidget({super.key, required this.socials});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socials.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            icon: _getSocialIcon(entry.key),
            onPressed: () => _launchURL(entry.value),
          ),
        );
      }).toList(),
    );
  }

  Icon _getSocialIcon(String social) {
    switch (social) {
      case 'instagram':
        return Icon(FontAwesomeIcons.instagram, color: Colors.white);
      case 'twitter':
        return Icon(FontAwesomeIcons.twitter, color: Colors.white);
      case 'github':
        return Icon(FontAwesomeIcons.github, color: Colors.white);
      default:
        return Icon(FontAwesomeIcons.globe,
            color: Colors.white); // Fallback icon
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
