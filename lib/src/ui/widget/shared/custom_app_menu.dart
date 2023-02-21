import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/src/core/providers/page_provider.dart';
import 'package:vertical_landing_page/src/ui/widget/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController aniController;

  @override
  void initState() {
    super.initState();
    aniController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(
      context,
      listen: false,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            aniController.reverse();
          } else {
            aniController.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitule(isOpen: isOpen, aniController: aniController),
              if (isOpen) ...[
                CustomMenuItem(
                    delay: 0,
                    text: 'Home',
                    onPresed: () => pageProvider.goTo(0)),
                CustomMenuItem(
                    delay: 30,
                    text: 'About',
                    onPresed: () => pageProvider.goTo(1)),
                CustomMenuItem(
                    delay: 60,
                    text: 'Pricing',
                    onPresed: () => pageProvider.goTo(2)),
                CustomMenuItem(
                    delay: 90,
                    text: 'Contact',
                    onPresed: () => pageProvider.goTo(3)),
                CustomMenuItem(
                    delay: 120,
                    text: 'Location',
                    onPresed: () => pageProvider.goTo(4)),
                const SizedBox(height: 8)
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitule extends StatelessWidget {
  const _MenuTitule({
    super.key,
    required this.isOpen,
    required this.aniController,
  });

  final bool isOpen;
  final AnimationController aniController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(microseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text(
            'Menú',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: aniController,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
