import 'package:flutter/material.dart';

class HotlinePageLayout extends StatelessWidget {
  final String title;
  final String icon;
  final List<Color> gradientColors;
  final Color accentColor;
  final int itemCount;
  final String Function(int) nameAt;
  final String Function(int) hotlineAt;
  final String Function(int) imageAt;
  final void Function(int) onCall;

  const HotlinePageLayout({
    super.key,
    required this.title,
    required this.icon,
    required this.gradientColors,
    required this.accentColor,
    required this.itemCount,
    required this.nameAt,
    required this.hotlineAt,
    required this.imageAt,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: gradientColors,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'สายด่วน',
                        style: TextStyle(
                          color: accentColor.withOpacity(0.85),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(icon, width: 88, height: 88),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: Colors.white.withOpacity(0.12), height: 1),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 100),
              itemCount: itemCount,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: HotlineCard(
                  name: nameAt(i),
                  hotline: hotlineAt(i),
                  image: imageAt(i),
                  accentColor: accentColor,
                  onCall: () => onCall(i),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotlineCard extends StatelessWidget {
  final String name;
  final String hotline;
  final String image;
  final Color accentColor;
  final VoidCallback onCall;

  const HotlineCard({
    super.key,
    required this.name,
    required this.hotline,
    required this.image,
    required this.accentColor,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: accentColor.withOpacity(0.45), width: 1.5),
              ),
              child: ClipOval(child: Image.asset(image, fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.phone, size: 12, color: accentColor.withOpacity(0.75)),
                    const SizedBox(width: 4),
                    Text(
                      hotline,
                      style: TextStyle(
                        color: accentColor.withOpacity(0.9),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: onCall,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.18),
                  shape: BoxShape.circle,
                  border: Border.all(color: accentColor.withOpacity(0.5), width: 1.5),
                ),
                child: Icon(Icons.call_rounded, color: accentColor, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
