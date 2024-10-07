import 'package:flutter/material.dart';
import 'package:storyloom/widgets/footer_widget.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  int selectedLanguage = 0;

  void changeLanguage(int value) {
    setState(() {
      selectedLanguage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            'assets/images/thriller.jpg',
            width: 375,
            height: 192,
          ),
          const SizedBox(height: 40),
          const Text(
            "The Shadows of Moscow",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Thriller",
            style: TextStyle(
              color: Colors.white24,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      changeLanguage(0);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: selectedLanguage == 0
                            ? Colors.white24
                            : Colors.black,
                      ),
                      child: const Text(
                        "en",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeLanguage(1);
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: selectedLanguage == 1
                              ? Colors.white24
                              : Colors.black,
                        ),
                        child: const Text(
                          "ru",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeLanguage(2);
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: selectedLanguage == 2
                              ? Colors.white24
                              : Colors.black,
                        ),
                        child: const Text(
                          "de",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  ),
                ],
              ),
              const Icon(
                Icons.launch,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
              "In the heart of Moscow, Andrei moved swiftly through the bustling streets, clutching a worn leather briefcase. The city’s freezing winds bit at his face, but the real danger lurked in the shadows. Inside that briefcase were secrets—secrets that could bring down men in power, expose corrupt empires, and shift the balance of an entire nation. Andrei wasn’t just running from the cold tonight; he was being hunted. He could feel the weight of unseen eyes tracking him as he crossed Red Square, blending into the late-night crowd. Trust was a rare commodity in his line of work, and tonight, he had none. His only ally, Ivan, had arranged a meeting at an abandoned warehouse by the Moskva River. But Andrei knew it could be a trap. His instincts had saved him before, and tonight, they were sharper than ever. The warehouse loomed ahead, its windows shattered and the door creaking in the wind. Andrei’s heart pounded as he stepped inside, the faint glow of streetlights barely illuminating the cold, concrete interior. Every step echoed ominously. He wasn’t alone. A sudden click behind him made Andrei freeze. From the shadows, a tall figure emerged, gun in hand. The man’s voice was cold and steady, 'You’ve been a thorn in our side for far too long, Andrei. Did you really think you could run forever?' Andrei’s mind raced. He recognized the voice—Sergei, a ruthless enforcer sent by the very people Andrei sought to expose. But he wasn’t ready to give up just yet. Slowly, Andrei reached into his coat pocket, his fingers brushing the cold steel of his own gun. It was a deadly dance they had played before, but this time, Andrei knew it would end in blood. The question was whose.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.6,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 25),
          Container(
            height: 40,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(96, 165, 250, 1),
                  Color.fromRGBO(59, 130, 246, 1),
                ])),
            child: TextButton(
              style: TextButton.styleFrom(
                  fixedSize: const Size(70, 40),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {},
              child: const Text("Back"),
            ),
          ),
          const FooterWidget(),
        ],
      ),
    ));
  }
}
