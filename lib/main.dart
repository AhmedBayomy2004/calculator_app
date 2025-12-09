import 'package:calculatorgdg/screens/history_screen.dart';
import 'package:calculatorgdg/themes/themes.dart';
import 'package:calculatorgdg/widgets/buttons_layout.dart';
import 'package:calculatorgdg/widgets/expression_input.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final TextEditingController controller = TextEditingController();
  String result = '';
  List<String> history = [];
  final ValueNotifier<bool> isDark = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDark,
      builder: (context, darkMode, child) {
        return MaterialApp(
          theme: Themes.appLightTheme,
          darkTheme: Themes.appDarkTheme,
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => isDark.value = !isDark.value,
                icon: Icon(darkMode ? Icons.dark_mode : Icons.light_mode),
              ),
              actions: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => HistoryScreen(history: history),
                          ),
                        );
                      },
                      icon: Icon(Icons.history, size: 28),
                    );
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ExpressionInput(controller: controller),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(result, style: TextStyle(fontSize: 48)),
                  ),

                  ButtonsLayout(
                    controller: controller,
                    changeResult:
                        (String text) => setState(() {
                          result = text;
                          String newOperation = '${controller.text} = $text';
                          if (history.isNotEmpty &&
                              history.last == newOperation) {
                            return;
                          }
                          history.add(newOperation);
                        }),
                    clearResult:
                        () => setState(() {
                          result = '';
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
