import 'package:flutter/material.dart';

// CustomRoundedButton widget definition
class CustomRoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isPrimary;

  const CustomRoundedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: 48,
        width: 120, // Adjust width as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: isPrimary
              ? Theme.of(context).primaryColor
              : const Color(0xFF664BFB),
          border: !isPrimary
              ? Border.all(color: Theme.of(context).primaryColor)
              : null,
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isPrimary ? Colors.white : Theme.of(context).primaryColor,
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: isPrimary
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}

class InterestsModal extends StatefulWidget {
  const InterestsModal({Key? key}) : super(key: key);

  @override
  _InterestsModalState createState() => _InterestsModalState();
}

class _InterestsModalState extends State<InterestsModal> {
  final List<String> interests = [
    'Investing',
    'Technology & Innovation',
    'Payments & Commerce',
    'Privacy & Security',
    'Economics & Global Finance',
    'Wealth Building',
    'Learning & Curiosity',
    'Community & Culture'
  ];

  final Map<String, bool> selectedInterests = {};

  @override
  void initState() {
    super.initState();
    for (var interest in interests) {
      selectedInterests[interest] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Color(0xFF241C3B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40), // Add space for the close icon
              const Text(
                'What aspects of Bitcoin interest you the most?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                '(Select all that apply)',
                style: TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: interests.map((interest) {
                  return ChoiceChip(
                    label: Text(interest),
                    selected: selectedInterests[interest]!,
                    selectedColor: const Color(0xFF664BFB), // Selected color
                    backgroundColor:
                        const Color(0xFF2E2755), // Unselected color
                    labelStyle: TextStyle(
                      color: selectedInterests[interest]!
                          ? Colors.white
                          : Colors.white70,
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedInterests[interest] = selected;
                      });
                    },
                  );
                }).toList(),
              ),
              const Spacer(), // Use Spacer to push the buttons to the bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomRoundedButton(
                    title: 'Skip',
                    onPressed: () {
                      Navigator.pop(context);
                      // Handle skip action
                    },
                    isPrimary: true,
                  ),
                  CustomRoundedButton(
                    title: 'Continue',
                    onPressed: () {
                      Navigator.pop(context);
                      // Handle continue action
                    },
                    isPrimary: false,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
