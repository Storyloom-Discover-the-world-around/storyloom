import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key, required this.socials});

  final List<String> socials;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Follow Us",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.2,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            ...socials.map((el) => Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(
                    'assets/images/Logos/$el.svg',
                    width: 32,
                    height: 32,
                    // Says this is deprecated, but this is all that works atm...
                    color: el == 'x' ? Colors.white : Colors.orangeAccent,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
