import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContributePage extends StatefulWidget {
  const ContributePage({Key? key}) : super(key: key);

  @override
  _ContributePageState createState() => _ContributePageState();
}

class _ContributePageState extends State<ContributePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();

  String _statusMessage = '';
  bool _isSubmitting = false;

  Future<void> _handleSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isSubmitting = true;
        _statusMessage = '';
      });

      try {
        var response = await http.post(
          Uri.parse('YOUR_EMAILJS_OR_API_ENDPOINT'),
          body: {
            'name': _nameController.text,
            'email': _emailController.text,
            'title': _titleController.text,
            'genre': _genreController.text,
            'imageUrl': _imageUrlController.text,
            'story': _storyController.text,
          },
        );

        if (response.statusCode == 200) {
          setState(() {
            _statusMessage = 'Your story has been submitted!';
            _clearForm();
          });
        } else {
          setState(() {
            _statusMessage = 'Something went wrong. Please try again.';
          });
        }
      } catch (e) {
        setState(() {
          _statusMessage = 'An error occurred. Please try again.';
        });
      } finally {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _titleController.clear();
    _genreController.clear();
    _imageUrlController.clear();
    _storyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.125),
            const Text(
              'Contribute Your Story',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'We believe in the power of storytelling. Your contributions can spark imaginations.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(
                      _nameController, 'Your Name', 'Please enter your name'),
                  const SizedBox(height: 20),
                  _buildTextField(_emailController, 'Your Email',
                      'Please enter a valid email'),
                  const SizedBox(height: 20),
                  _buildTextField(
                      _titleController, 'Story Title', 'Please enter a title'),
                  const SizedBox(height: 20),
                  _buildTextField(
                      _genreController, 'Genre', 'Please select a genre'),
                  const SizedBox(height: 20),
                  _buildTextField(_imageUrlController, 'Image URL',
                      'Please enter an image URL'),
                  const SizedBox(height: 20),
                  _buildTextField(_storyController, 'Story Text',
                      'Please enter your story'),
                  const SizedBox(height: 20),
                  if (_statusMessage.isNotEmpty)
                    Text(
                      _statusMessage,
                      style: const TextStyle(color: Colors.greenAccent),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width:
                        screenWidth * 0.8, // Button width based on screen size
                    child: ElevatedButton(
                      onPressed: _isSubmitting ? null : _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        _isSubmitting ? 'Submitting...' : 'Submit Story',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a styled text field
  Widget _buildTextField(TextEditingController controller, String label,
      [String? validatorMessage,
      bool emailValidation = false,
      int maxLines = 1]) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorMessage;
        }
        if (emailValidation && !value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}
