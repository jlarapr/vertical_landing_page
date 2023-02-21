import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/src/core/providers/page_provider.dart';
import 'package:vertical_landing_page/src/ui/views/about_view.dart';
import 'package:vertical_landing_page/src/ui/views/contact_view.dart';
import 'package:vertical_landing_page/src/ui/views/home_view.dart';
import 'package:vertical_landing_page/src/ui/views/location_view.dart';
import 'package:vertical_landing_page/src/ui/views/pricing_view.dart';
import 'package:vertical_landing_page/src/ui/widget/shared/custom_app_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: const [
            _HomeBody(),
            Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu(),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.pink,
          Colors.deepPurple,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5, 0.5],
      ));
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(
      context,
      listen: false,
    );
    return PageView(
      controller: pageProvider.scrollcontroller,
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}
