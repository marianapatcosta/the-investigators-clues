import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';

class GhostVoteToken extends StatelessWidget {
  const GhostVoteToken({
    super.key,
    this.size = kGhostVoteTokenSizeSmall,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 57, 36, 69),
            ),
            BoxShadow(
              color: Color.fromARGB(255, 69, 47, 82),
              spreadRadius: -3.0,
              blurRadius: 7.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset("assets/images/clockface.png",
              color: Colors.amber[100]),
        ));
  }
}
