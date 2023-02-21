import 'package:flutter/material.dart';
//import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollcontroller = PageController();
  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  int _currentIndex = 0;

  createScrollController(String routeName) {
    scrollcontroller = PageController(initialPage: getPageIndex(routeName));

    html.document.title = _pages[getPageIndex(routeName)].toUpperCase();

    scrollcontroller.addListener(() {
      final pageIndex = (scrollcontroller.page ?? 0).round();

      if (_currentIndex != pageIndex) {
        html.window.history.pushState(null, 'title', '#/${_pages[pageIndex]}');
        _currentIndex = pageIndex;
        html.document.title = _pages[pageIndex].toUpperCase();
      }
    });
  }

  int getPageIndex(String routName) {
    return !_pages.contains(routName) ? 0 : _pages.indexOf(routName);
  }

  goTo(int index) {
    // final routeName = _pages[index];

    // html.window.history.pushState(null, 'title', '#/${_pages[index]}');

    scrollcontroller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutSine,
    );
  }
}
