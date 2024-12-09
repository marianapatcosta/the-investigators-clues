import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show Layout, ScriptDetailsContent;

class ScriptDetailsScreen extends StatelessWidget {
  const ScriptDetailsScreen({
    super.key,
    required this.script,
  });

  final Script script;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
/*     SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
    ); */

    return Layout(
      child: Scaffold(
        body: /*  SafeArea(
          child: */
            CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading:
                  isScreenSmallerThanX(width, ScreenSize.l),
              title: Hero(
                tag: script.id,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    script.name,
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ),
              ),
              centerTitle: false,
              floating: true,
            ),
            ScriptDetailsContent(script: script),
          ],
        ),
        // ),
      ),
    );
  }
}
