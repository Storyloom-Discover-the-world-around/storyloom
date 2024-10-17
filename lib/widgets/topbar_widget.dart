import 'package:flutter/material.dart';

class TopBarWidget extends StatefulWidget {
  final Function(int) onMenuItemSelected;
  const TopBarWidget({
    super.key,
    required this.onMenuItemSelected,
  });

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  bool isMenuSelected = false;
  int selectedOption = 0;
  Color backgroundColor = Colors.transparent;

  void _toggleMenu() {
    setState(() {
      isMenuSelected = !isMenuSelected;
      backgroundColor = isMenuSelected ? Colors.black : Colors.transparent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Bar
        Container(
          color: backgroundColor, // Dynamically change color
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(
                image: AssetImage("assets/images/storyloom.png"),
              ),
              // Menu button
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
                onPressed: _toggleMenu,
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
        // Menu container
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMenuItem("Home", 0),
                        _buildMenuItem("Stories", 1),
                        _buildMenuItem("Genres", 2),
                        _buildMenuItem("Folktales", 3),
                        _buildMenuItem("Contribute", 4),
                        _buildMenuItem("Contact", 5),
                      ],
                    ),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String title, int index) {
    bool isSelected = selectedOption == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index;
          isMenuSelected = false;
          backgroundColor = Colors.transparent;
        });
        widget.onMenuItemSelected(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 38,
          ),
        ),
      ),
    );
  }
}
