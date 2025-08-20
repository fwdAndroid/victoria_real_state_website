import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _HeaderState extends State<Header> {
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScrollableState? scrollableState = Scrollable.of(context);
      scrollableState.position.addListener(_scrollListener);
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
    double appBarHeight = 80 - (_scrollOffset / 20);
    appBarHeight = appBarHeight.clamp(60, 80);
    double bgOpacity = (_scrollOffset / 200).clamp(0.3, 1);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: appBarHeight,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(bgOpacity),
              boxShadow: [
                if (bgOpacity > 0.4)
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Image.asset('assets/logo.png', height: 50),
                  const Spacer(),
                  if (!isMobile)
                    Row(
                      children: [
                        _navButton(context, "Home", '/'),
                        //// _navButton(context, "Privacy Policy", '/privacy'),
                        _navButton(context, "FAQ", '/about'),
                        _navButton(context, "How To Use", '/howto'),

                        _navButton(context, "Contact Us", '/contactUs'),
                      ],
                    ),
                  if (isMobile)
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Color(0xFF00843D),
                        size: 28,
                      ),
                      onPressed: () => _showMobileMenu(context),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _HoverUnderlineButton(
        title: title,
        route: route,
        color: const Color(0xFF00843D),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _mobileMenuTile("Home", '/'),
            _mobileMenuTile("FAQ", '/about'),
            _mobileMenuTile("Privacy Policy", '/privacy'),
            _mobileMenuTile("Contact Us", '/contactUs'),
            _mobileMenuTile("How To Use", '/howto'),
          ],
        ),
      ),
    );
  }

  Widget _mobileMenuTile(String title, String route) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}

// Hover underline button for desktop navigation
class _HoverUnderlineButton extends StatefulWidget {
  final String title;
  final String route;
  final Color color;

  const _HoverUnderlineButton({
    required this.title,
    required this.route,
    required this.color,
  });

  @override
  State<_HoverUnderlineButton> createState() => _HoverUnderlineButtonState();
}

class _HoverUnderlineButtonState extends State<_HoverUnderlineButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () {
          if (ModalRoute.of(context)?.settings.name != widget.route) {
            Navigator.pushNamed(context, widget.route);
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: widget.color,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: _isHovering ? 30 : 0,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
