import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show CharacterImage, CustomSafeArea, Layout;
import 'package:my_botc_notes/utils.dart';

class CharacterDetailsScreen extends StatefulWidget {
  const CharacterDetailsScreen({
    super.key,
    required this.character,
  });

  final Character character;

  String get url {
    return character.characterInfoUrl ?? '$botcWikiUrl/${character.name}';
  }

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  final _webViewController = WebViewController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(onPageFinished: (String url) {
          _webViewController.runJavaScript('''
            const body = document.querySelector('body');

            if (body) {
              body.style.backgroundColor = 'transparent';
            }

            const header = document.querySelector('.tab-bar');
            if (header) {
              header.style.display = 'none';
            }
            const title = document.querySelector('#content .title');
            if (title) {
              title.style.display = 'none';
            }

            const sideBar = document.querySelector('.side-nav');
         
            if (sideBar) {
              sideBar.style.display = 'none';
            }

            const content = document.querySelector('#p-cactions');
            if (content) {
              content.style.float = 'initial';
              content.style.margin = 'auto';
            }

            const menuIcon = document.querySelector('#p-cactions a');
            if (menuIcon) {
              menuIcon.style.display = 'none';
            }

            const characterDetails = document.querySelector('.small-12.large-3.large-push-9.columns');
            if (characterDetails) {
              characterDetails.style.display = 'none';
            }

            const categories = document.querySelector('#categories');
            if (categories) {
              categories.style.display = 'none';
            }

            const footer = document.querySelector('footer');
            if (footer) {
              footer.style.display = 'none';
            }
    
            if (${widget.character.characterInfoUrl}) {
              const anchorElement = document.querySelector('#${widget.character.characterInfoUrl?.split('#')[0]}');

              if (anchorElement) {
                document.getElementById(anchorElement).scrollIntoView();
              }
            }

        ''');

          _isLoading = false;
          setState(() {});
        }),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<void> _handleRefresh() async {
    _webViewController.reload();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
    );
    return Layout(
      child: Scaffold(
        body: /* SafeArea(
        child: */
            RefreshIndicator(
          onRefresh: _handleRefresh,
          child: CustomSafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading:
                      isScreenSmallerThanX(width, ScreenSize.l),
                  title: Hero(
                    tag: widget.character.id,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: CharacterImage(
                            name: widget.character.name,
                            image: widget.character.image,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Material(
                          type: MaterialType.transparency,
                          child: Text(
                            widget.character.name,
                            style: theme.appBarTheme.titleTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  floating: true,
                  centerTitle: false,
                ),
                SliverFillRemaining(
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: WebViewWidget(
                            controller: _webViewController,
                            gestureRecognizers: {
                              Factory<VerticalDragGestureRecognizer>(
                                () => VerticalDragGestureRecognizer(),
                              ),
                            },
                          ),
                        ),
                )
              ],
              //),
            ),
          ),
        ),
      ),
    );
  }
}
