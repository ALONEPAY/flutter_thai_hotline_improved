// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/about_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_a_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_b_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_c_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_d_home_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  // Tab config: label, icon, gradient colors, accent color
  final List<_TabConfig> tabs = [
    _TabConfig(
      label: 'การเดินทาง',
      icon: Icons.directions_car_rounded,
      gradientColors: [Color(0xFF005F80), Color(0xFF001F2E)],
      accentColor: Color(0xFF00B8CC),
      bgImage: 'assets/images/bgA.png',
    ),
    _TabConfig(
      label: 'เหตุฉุกเฉิน',
      icon: Icons.warning_amber_rounded,
      gradientColors: [Color(0xFF8B1A00), Color(0xFF1A0000)],
      accentColor: Color(0xFFFF4D2B),
      bgImage: 'assets/images/bgB.png',
    ),
    _TabConfig(
      label: 'ธนาคาร',
      icon: Icons.account_balance_rounded,
      gradientColors: [Color(0xFF7A6000), Color(0xFF1A1500)],
      accentColor: Color(0xFFFFCC00),
      bgImage: 'assets/images/bgC.png',
    ),
    _TabConfig(
      label: 'สาธารณูปโภค',
      icon: Icons.bolt_rounded,
      gradientColors: [Color(0xFF005C00), Color(0xFF001500)],
      accentColor: Color(0xFF44DD44),
      bgImage: 'assets/images/bgD.png',
    ),
  ];

  final List<Widget> subpages = [
    SubAHomeUi(),
    SubBHomeUi(),
    SubCHomeUi(),
    SubDHomeUi(),
  ];

  @override
  Widget build(BuildContext context) {
    final tab = tabs[selectedIndex];

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(tab.bgImage, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
            ),
          ],
        ),
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.info_outline_rounded),
              color: Colors.white70,
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutUi()),
                );
              },
            ),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: KeyedSubtree(
          key: ValueKey(selectedIndex),
          child: subpages[selectedIndex],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0D0D0D),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 20,
                offset: const Offset(0, -4))
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(tabs.length, (i) {
                final isSelected = i == selectedIndex;
                final t = tabs[i];
                return GestureDetector(
                  onTap: () => setState(() => selectedIndex = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    padding: EdgeInsets.symmetric(
                        horizontal: isSelected ? 18 : 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? t.accentColor.withOpacity(0.15)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: isSelected
                          ? Border.all(
                              color: t.accentColor.withOpacity(0.4), width: 1)
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          t.icon,
                          color: isSelected ? t.accentColor : Colors.white38,
                          size: 22,
                        ),
                        if (isSelected) ...[
                          const SizedBox(width: 7),
                          Text(
                            t.label,
                            style: TextStyle(
                              color: t.accentColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _TabConfig {
  final String label;
  final IconData icon;
  final List<Color> gradientColors;
  final Color accentColor;
  final String bgImage;

  const _TabConfig({
    required this.label,
    required this.icon,
    required this.gradientColors,
    required this.accentColor,
    required this.bgImage,
  });
}
