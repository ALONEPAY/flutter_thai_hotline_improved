import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/travel_hotline.dart';
import 'package:flutter_thai_hotline_app/widgets/hotline_page_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class SubAHomeUi extends StatefulWidget {
  const SubAHomeUi({super.key});
  @override
  State<SubAHomeUi> createState() => _SubAHomeUiState();
}

class _SubAHomeUiState extends State<SubAHomeUi> {
  Future<void> _call(String number) async =>
      await launchUrl(Uri(scheme: 'tel', path: number));

  final List<TravelHotline> items = [
    TravelHotline(name: 'กรมทางหลวงชนบท', hotline: '1146', image: 'assets/images/imgA1.png'),
    TravelHotline(name: 'ตำรวจท่องเที่ยว', hotline: '1155', image: 'assets/images/imgA2.png'),
    TravelHotline(name: 'ตำรวจทางหลวง', hotline: '1193', image: 'assets/images/imgA3.png'),
    TravelHotline(name: 'ข้อมูลการจราจร', hotline: '1197', image: 'assets/images/imgA4.png'),
    TravelHotline(name: 'ขสมก.', hotline: '1348', image: 'assets/images/imgA5.png'),
    TravelHotline(name: 'บขส.', hotline: '1490', image: 'assets/images/imgA6.png'),
    TravelHotline(name: 'เส้นทางบนทางด่วน', hotline: '1543', image: 'assets/images/imgA7.png'),
    TravelHotline(name: 'กรมทางหลวง', hotline: '1586', image: 'assets/images/imgA8.png'),
    TravelHotline(name: 'การรถไฟแห่งประเทศไทย', hotline: '1690', image: 'assets/images/imgA9.png'),
  ];

  @override
  Widget build(BuildContext context) => HotlinePageLayout(
    title: 'การเดินทาง',
    icon: 'assets/images/Travel.png',
    gradientColors: const [Color(0xFF005F80), Color(0xFF001520)],
    accentColor: const Color(0xFF00B8CC),
    itemCount: items.length,
    nameAt: (i) => items[i].name!,
    hotlineAt: (i) => items[i].hotline!,
    imageAt: (i) => items[i].image!,
    onCall: (i) => _call(items[i].hotline!),
  );
}
