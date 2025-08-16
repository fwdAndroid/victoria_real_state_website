import 'package:flutter/material.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _HeaderState extends State<Header> {
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScrollableState? scrollableState = Scrollable.of(context);
      scrollableState?.position.addListener(_scrollListener);
    });
  }

  void _scrollListener() {
    setState(() {
      _scrollOffset = Scrollable.of(context).position.pixels ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    // Shrink height and adjust opacity based on scroll
    double appBarHeight = 70 - (_scrollOffset / 15);
    appBarHeight = appBarHeight.clamp(50, 70);
    double bgOpacity = (_scrollOffset / 150).clamp(0, 1);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: appBarHeight,
      color: Colors.white.withOpacity(bgOpacity),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: bgOpacity > 0.2 ? 4 : 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png', height: 50),
        ),
        title: null, // no title, navigation moves to actions
        actions: isMobile
            ? [
                IconButton(
                  icon: const Icon(Icons.menu, color: Color(0xFF00843D)),
                  onPressed: () {
                    _showMobileMenu(context);
                  },
                ),
              ]
            : [
                _navButton(context, "Home", '/'),
                const SizedBox(width: 40),

                _navButton(context, "Privacy Policy", '/privacy'),
                const SizedBox(width: 40),
                _navButton(context, "FAQ", '/about'),
                const SizedBox(width: 40),
                _navButton(context, "Contact Us", '/contactUs'),
                const SizedBox(width: 40),
              ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () {
        if (ModalRoute.of(context)?.settings.name != route) {
          Navigator.pushNamed(context, route);
        }
      },
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF00843D),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      child: Text(title),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text("FAQ"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: const Text("Privacy Policy"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/privacy');
              },
            ),
            ListTile(
              title: const Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contactUs');
              },
            ),
          ],
        ),
      ),
    );
  }
}
