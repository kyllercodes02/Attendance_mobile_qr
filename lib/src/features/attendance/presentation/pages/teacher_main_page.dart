import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'teacher_dashboard_page.dart';

class TeacherMainPage extends StatefulWidget {
  const TeacherMainPage({super.key});

  @override
  State<TeacherMainPage> createState() => _TeacherMainPageState();
}

class _TeacherMainPageState extends State<TeacherMainPage> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const TeacherDashboardPage(),
      const _PlaceholderPage(title: 'Students Page'),
      const _PlaceholderPage(title: 'Attendance Page'),
      const _PlaceholderPage(title: 'Settings Page'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _TeacherBottomNav(
        currentIndex: _currentIndex,
        onTabTapped: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}

class _TeacherBottomNav extends StatelessWidget {
  const _TeacherBottomNav({
    required this.currentIndex,
    required this.onTabTapped,
  });

  final int currentIndex;
  final ValueChanged<int> onTabTapped;

  @override
  Widget build(BuildContext context) {
    final double bottomSafeArea = MediaQuery.of(context).padding.bottom;
    // Elevate slightly on devices with no safe area to match previous floating position
    final double paddingBottom = bottomSafeArea > 0 ? bottomSafeArea : 16.0;
    final double baseHeight = 65.0;
    final double navHeight = baseHeight + paddingBottom;

    return SizedBox(
      height: navHeight + 40, // 40px for the scanner button bump overlap
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, navHeight),
            painter: _BottomNavPainter(),
          ),
          Container(
            height: navHeight,
            padding: EdgeInsets.only(bottom: paddingBottom),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: _NavBarItem(
                    icon: Icons.home_outlined,
                    label: 'Dashboard',
                    isActive: currentIndex == 0,
                    onTap: () => onTabTapped(0),
                  ),
                ),
                Expanded(
                  child: _NavBarItem(
                    icon: Icons.person_outline,
                    label: 'Students',
                    isActive: currentIndex == 1,
                    onTap: () => onTabTapped(1),
                  ),
                ),
                const SizedBox(width: 85), // Center spacing for larger bump
                Expanded(
                  child: _NavBarItem(
                    icon: Icons.assignment_outlined,
                    label: 'Attendance',
                    isActive: currentIndex == 2,
                    onTap: () => onTabTapped(2),
                  ),
                ),
                Expanded(
                  child: _NavBarItem(
                    icon: Icons.settings_outlined,
                    label: 'Settings',
                    isActive: currentIndex == 3,
                    onTap: () => onTabTapped(3),
                  ),
                ),
              ],
            ),
          ),
          // Center floating scanner button
          Positioned(
            top: 2, // Adjusted to perfectly center over the nav height
            child: Container(
              height: 76, // Increased size to 76px
              width: 76,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1D4ED8),
                border: Border.all(color: Colors.white, width: 6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                shape: const CircleBorder(),
                elevation: 0,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => context.push('/teacher/scanner'),
                  child: const Center(
                    child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 32),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? const Color(0xFF1D4ED8) : const Color(0xFF64748B);

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.08)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final path = Path();
    path.moveTo(0, 0);

    final center = size.width / 2;
    // Fluid swooping bump matching the slightly larger scanner button
    path.lineTo(center - 62, 0);

    path.cubicTo(
      center - 32, 0,
      center - 40, -38,
      center, -38,
    );

    path.cubicTo(
      center + 40, -38,
      center + 32, 0,
      center + 62, 0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Draw shadow path
    final shadowPath = path.shift(const Offset(0, -2));
    canvas.drawPath(shadowPath, shadowPaint);

    // Draw solid bar background
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
