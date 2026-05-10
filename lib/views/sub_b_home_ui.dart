import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/emergency_hotline.dart';
import 'package:flutter_thai_hotline_app/widgets/hotline_page_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBHomeUi extends StatefulWidget {
  const SubBHomeUi({super.key});
  @override
  State<SubBHomeUi> createState() => _SubBHomeUiState();
}

class _SubBHomeUiState extends State<SubBHomeUi> {
  Future<void> _call(String number) async =>
      await launchUrl(Uri(scheme: 'tel', path: number));

  final List<EmergencyHotline> items = [
    EmergencyHotline(name: 'เหตุด่วน เหตุร้าย', hotline: '191', image: 'assets/images/imgB1.png'),
    EmergencyHotline(name: 'แจ้งไฟไหม้ สัตว์เข้าบ้าน', hotline: '199', image: 'assets/images/imgB2.png'),
    EmergencyHotline(name: 'สายด่วนรถหาย', hotline: '1192', image: 'assets/images/imgB3.png'),
    EmergencyHotline(name: 'อุบัติเหตุทางน้ำ', hotline: '1196', image: 'assets/images/imgB4.png'),
    EmergencyHotline(name: 'แจ้งคนหาย', hotline: '1300', image: 'assets/images/imgB5.png'),
    EmergencyHotline(name: 'ศูนย์ปลอดภัยคมนาคม', hotline: '1356', image: 'assets/images/imgB6.png'),
    EmergencyHotline(name: 'หน่วยแพทย์กู้ชีพ', hotline: '1554', image: 'assets/images/imgB7.png'),
    EmergencyHotline(name: 'ศูนย์เอราวัณ', hotline: '1646', image: 'assets/images/imgB8.png'),
    EmergencyHotline(name: 'เจ็บป่วยฉุกเฉิน', hotline: '1669', image: 'assets/images/imgB9.png'),
  ];

  @override
  Widget build(BuildContext context) => HotlinePageLayout(
    title: 'เหตุฉุกเฉิน',
    icon: 'assets/images/Emergency.png',
    gradientColors: const [Color(0xFF8B1A00), Color(0xFF150500)],
    accentColor: const Color(0xFFFF4D2B),
    itemCount: items.length,
    nameAt: (i) => items[i].name!,
    hotlineAt: (i) => items[i].hotline!,
    imageAt: (i) => items[i].image!,
    onCall: (i) => _call(items[i].hotline!),
  );
}
