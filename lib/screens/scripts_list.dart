import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:my_botc_notes/providers/index.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show Layout, ScriptItem, ScriptItemSkeleton, ScriptsListAppBar;

const kScriptsPerPage = 10;
const kScriptsPlaceholderNumber = 5;

class ScriptsListScreen extends ConsumerStatefulWidget {
  const ScriptsListScreen({
    super.key,
  });

  @override
  ConsumerState<ScriptsListScreen> createState() {
    return _ScriptsListScreenState();
  }
}

class _ScriptsListScreenState extends ConsumerState<ScriptsListScreen>
    with AutomaticKeepAliveClientMixin {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  bool _isLoading = false;
  bool _showOnlyFavorites = true;

  @override
  bool get wantKeepAlive => true;

  List<Script> get _filteredFavoriteScripts {
    final favoriteScripts = ref.watch(favoriteScriptsProvider);
    return favoriteScripts
        .where((script) => script.name
            .toLowerCase()
            .contains(_searchController.text.trim().toLowerCase()))
        .toList();
  }

  List<Script> _fetchedScripts = [];
  String? _error;
  int _currentPage = 1;
  int _totalPages = 1;

  void toggleShowOnlyFavorites() {
    setState(() {
      _showOnlyFavorites = !_showOnlyFavorites;
      _error = null;

      if (!_showOnlyFavorites) {
        if (_fetchedScripts.isNotEmpty) {
          setState(() {});
          return;
        }

        _isLoading = true;
        _fetchScripts('');
      }
    });
  }

  void _fetchScripts(String inputValue, [bool? isScrolling = false]) async {
    final url = Uri.https(kScriptsDatabaseUrl, 'api/scripts', {
      'search': _searchController.text,
      'page': 1.toString(),
      'per_page': 20
          .toString() // not working; we need to change api  https://github.com/AdmiralGT/botc-scripts/blob/main/botc/settings.py
    });
    final settings = ref.watch(settingsProvider);
    AppLocalizations t = await AppLocalizations.delegate.load(settings.locale);

    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        _error = t.generalError;
      }

      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      _totalPages = ((listData['count'] as int) / kScriptsPerPage).ceil();

      final results =
          (listData['results'] as List).cast<Map<String, dynamic>>();

      final loadedScripts = mapInfoToScripts(results);

      setState(() {
        _isLoading = false;
        if (isScrolling!) {
          _fetchedScripts.addAll(loadedScripts);
        } else {
          _fetchedScripts = loadedScripts;
        }
      });
    } catch (error) {
      setState(() {
        _error = t.generalError;
        _isLoading = false;
      });
    }
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      if (!_showOnlyFavorites) {
        _isLoading = true;
        _fetchScripts('');
      } else {
        _fetchedScripts = [];
      }
    });
  }

  Future<void> _handleRefresh() async {
    try {
      setState(() {
        _isLoading = true;
        _fetchedScripts = [];
      });
      _fetchScripts('');
    } catch (error) {
      final settings = ref.watch(settingsProvider);

      AppLocalizations t =
          await AppLocalizations.delegate.load(settings.locale);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.generalError),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_currentPage < _totalPages) {
          _currentPage += 1;
          _fetchScripts('', true);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    Widget content = SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text(
          _showOnlyFavorites && _searchController.text.isEmpty
              ? t.noFavoriteScripts
              : t.searchNoResults(t.scripts.toLowerCase()),
        ),
      ),
    );

    if (_showOnlyFavorites && _filteredFavoriteScripts.isNotEmpty) {
      content = SliverList.builder(
        itemCount: _filteredFavoriteScripts.length,
        itemBuilder: (ctx, index) => ScriptItem(
          key: ValueKey(_filteredFavoriteScripts[index].id),
          script: _filteredFavoriteScripts[index],
        ),
      );

      if (isScreenBiggerThanX(width, ScreenSize.md)) {
        content = SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            childAspectRatio: isScreenBiggerThanX(width, ScreenSize.l) ? 7 : 5,
          ),
          itemCount: _filteredFavoriteScripts.length,
          itemBuilder: (ctx, index) => ScriptItem(
            key: ValueKey(_filteredFavoriteScripts[index].id),
            script: _filteredFavoriteScripts[index],
          ),
        );
      }
    }

    if (!_showOnlyFavorites) {
      content = SliverList.builder(
        itemCount:
            _isLoading ? kScriptsPlaceholderNumber : _fetchedScripts.length + 1,
        itemBuilder: (ctx, index) {
          if (!_isLoading && index == _fetchedScripts.length) {
            return Visibility(
              visible: _currentPage != _totalPages,
              child: ScriptItemSkeleton(
                key: ValueKey(index),
              ),
            );
          }
          return _isLoading
              ? ScriptItemSkeleton(
                  key: ValueKey(index),
                )
              : ScriptItem(
                  key: ValueKey(_fetchedScripts[index].id),
                  script: _fetchedScripts[index],
                  isLoading: _isLoading,
                );
        },
      );

      if (isScreenBiggerThanX(width, ScreenSize.md)) {
        content = SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            childAspectRatio: isScreenBiggerThanX(width, ScreenSize.l) ? 5 : 7,
          ),
          itemCount: _isLoading
              ? kScriptsPlaceholderNumber + 1
              : _fetchedScripts.length + 2,
          itemBuilder: (ctx, index) {
            if (!_isLoading && index >= _fetchedScripts.length) {
              return Visibility(
                visible: _currentPage != _totalPages,
                child: ScriptItemSkeleton(
                  key: ValueKey(index),
                ),
              );
            }
            return _isLoading
                ? ScriptItemSkeleton(
                    key: ValueKey(index),
                  )
                : ScriptItem(
                    key: ValueKey(_fetchedScripts[index].id),
                    script: _fetchedScripts[index],
                    isLoading: _isLoading,
                  );
          },
        );
      }
    }

    if (_error != null) {
      content = SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: Text(_error!)),
      );
    }

    return Layout(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          color: theme.colorScheme.surface,
          backgroundColor: theme.colorScheme.primary,
          child: CustomScrollView(
            controller: _showOnlyFavorites ? null : _scrollController,
            slivers: [
              ScriptsListAppBar(
                showOnlyFavorites: _showOnlyFavorites,
                searchController: _searchController,
                toggleShowOnlyFavorites: toggleShowOnlyFavorites,
                onChange: _showOnlyFavorites
                    ? (input) => setState(() {})
                    : _fetchScripts,
                clearSearch: _clearSearch,
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 16),
                sliver: content,
              )
            ],
          ),
        ),
      ),
    );
  }
}
