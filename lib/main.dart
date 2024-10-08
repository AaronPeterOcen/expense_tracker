import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) => {
  runApp(const MyApp());
  // });
}

var lColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 27, 237, 111));

var dColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 34, 132, 159),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: dColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: dColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: dColorScheme.primaryContainer,
            foregroundColor: dColorScheme.onPrimaryContainer,
            textStyle: const TextStyle(
              fontSize: 15,
            ),
            elevation: 5,
            // shadowColor: Colors.black.withOpacity(0.5)),
          ),
        ),
        iconTheme: const IconThemeData().copyWith(
          color: const Color.fromRGBO(170, 27, 1, 0.976),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bodyMedium: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(27, 126, 35, 1),
                ),
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: lColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: lColorScheme.onPrimaryContainer,
          foregroundColor: lColorScheme.onPrimary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: lColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          // shadowColor: const Color.fromRGBO(1, 36, 72, 0.996),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lColorScheme.primaryContainer,
            textStyle: const TextStyle(
              fontSize: 15,
            ),
            elevation: 5,
            shadowColor: Colors.black.withOpacity(0.5),
          ),
        ),
        iconTheme: const IconThemeData().copyWith(
          color: const Color.fromRGBO(170, 27, 1, 0.976),
        ),

        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bodyMedium: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(27, 126, 35, 1),
                ),
              ),
            ),
        // cardColor: lColorScheme.onPrimary,
      ),
      home: const Expenses(),
    );
  }
}
