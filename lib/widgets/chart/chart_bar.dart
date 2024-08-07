import 'package:flutter/material.dart';

// Define a stateless widget called ChartBar
class ChartBar extends StatelessWidget {
  // Constructor for ChartBar
  const ChartBar({
    super.key, // Calls the superclass constructor and passes the key
    required this.fill, // Required parameter to specify the fill level of the chart bar
  });

  // Property to store the fill level of the chart bar
  final double fill;

  @override
  Widget build(BuildContext context) {
    // Determine if the app is in dark mode
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Build and return the widget tree
    return Expanded(
      // Use Padding to add horizontal padding around the child widget
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        // Use FractionallySizedBox to set the height of the child as a fraction of its parent's height
        child: FractionallySizedBox(
          heightFactor: fill, // Set the height factor to the fill level
          // Use DecoratedBox to decorate the child widget
          child: DecoratedBox(
            // Define the decoration for the box
            decoration: BoxDecoration(
              shape:
                  BoxShape.rectangle, // Set the shape of the box to a rectangle
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8)), // Set the top border radius
              color: isDarkMode
                  ? Theme.of(context)
                      .colorScheme
                      .secondary // Use secondary color in dark mode
                  : Theme.of(context).colorScheme.primary.withOpacity(
                      0.65), // Use primary color with opacity in light mode
            ),
          ),
        ),
      ),
    );
  }
}
