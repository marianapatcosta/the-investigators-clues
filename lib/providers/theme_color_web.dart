import 'dart:html';

void updateThemeColor(String color) {
  final meta = document.querySelector('meta[name="theme-color"]');

  if (meta != null) {
    meta.setAttribute('content', color);
  }
}
