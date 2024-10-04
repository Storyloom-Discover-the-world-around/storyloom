import 'package:flutter/material.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({super.key});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  bool isMenuSelected = false;
  int selectedOption = 1;
  List<int> options = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(
                image: AssetImage("assets/images/storyloom.png"),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isMenuSelected = !isMenuSelected;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    !isMenuSelected ? "Menu" : "Close",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        // AnimatedOpacity for fade-in effect
        Expanded(
          child: AnimatedOpacity(
            opacity: isMenuSelected ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: isMenuSelected
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 30),
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: options.map((e) {
                        String title;
                        switch (e) {
                          case 1:
                            title = "Home";
                            break;
                          case 2:
                            title = "Stories";
                            break;
                          case 3:
                            title = "Genres";
                            break;
                          case 4:
                            title = "Folktales";
                            break;
                          case 5:
                            title = "Your Story";
                            break;
                          case 6:
                            title = "Contacts";
                            break;
                          default:
                            title = "Home";
                        }
                        bool isSelected = selectedOption == e;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption = e;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            child: Text(
                              title,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.grey,
                                fontSize: 38,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}
