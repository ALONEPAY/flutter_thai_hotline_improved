import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/utilities_hotline.dart';
import 'package:flutter_thai_hotline_app/widgets/hotline_page_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class SubDHomeUi extends StatefulWidget {
  const SubDHomeUi({super.key});
  @override
  State<SubDHomeUi> createState() => _SubDHomeUiState();
}

class _SubDHomeUiState extends State<SubDHomeUi> {
  Future<void> _call(String number) async =>
      await launchUrl(Uri(scheme: 'tel', path: number));

  final List<UtilitiesHotline> items = [
    UtilitiesHotline(name: 'การไฟฟ้านครหลวง', hotline: '1130', image: 'assets/images/imgD1.png'),
    UtilitiesHotline(name: 'การไฟฟ้าส่วนภูมิภาค', hotline: '1129', image: 'assets/images/imgD2.png'),
    UtilitiesHotline(name: 'การไฟฟ้าฝ่ายผลิต', hotline: '1416', image: 'assets/images/imgD3.png'),
    UtilitiesHotline(name: 'การประปานครหลวง', hotline: '1125', image: 'assets/images/imgD4.png'),
    UtilitiesHotline(name: 'การประปาส่วนภูมิภาค', hotline: '1662', image: 'assets/images/imgD5.png'),
    UtilitiesHotline(name: 'True', hotline: '1242', image: 'assets/images/imgD6.png'),
    UtilitiesHotline(name: 'Dtac', hotline: '1678', image: 'assets/images/imgD7.png'),
    UtilitiesHotline(name: 'AIS', hotline: '1175', image: 'assets/images/imgD8.png'),
    UtilitiesHotline(name: 'TOT', hotline: '1100', image: 'assets/images/imgD9.png'),
  ];

  @override
  Widget build(BuildContext context) => HotlinePageLayout(
    title: 'สาธารณูปโภค',
    icon: 'assets/images/Utilities.png',
    gradientColors: const [Color(0xFF005C00), Color(0xFF001500)],
    accentColor: const Color(0xFF44DD44),
    itemCount: items.length,
    nameAt: (i) => items[i].name!,
    hotlineAt: (i) => items[i].hotline!,
    imageAt: (i) => items[i].image!,
    onCall: (i) => _call(items[i].hotline!),
  );
}
