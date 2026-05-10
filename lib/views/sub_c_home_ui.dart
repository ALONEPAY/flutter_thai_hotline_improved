import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/bank_hotline.dart';
import 'package:flutter_thai_hotline_app/widgets/hotline_page_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCHomeUi extends StatefulWidget {
  const SubCHomeUi({super.key});
  @override
  State<SubCHomeUi> createState() => _SubCHomeUiState();
}

class _SubCHomeUiState extends State<SubCHomeUi> {
  Future<void> _call(String number) async =>
      await launchUrl(Uri(scheme: 'tel', path: number));

  final List<BankHotline> items = [
    BankHotline(name: 'กรุงเทพ', hotline: '1333', image: 'assets/images/imgC1.png'),
    BankHotline(name: 'ออมสิน', hotline: '1115', image: 'assets/images/imgC2.png'),
    BankHotline(name: 'กสิกรไทย', hotline: '028888888', image: 'assets/images/imgC3.png'),
    BankHotline(name: 'กรุงไทย', hotline: '021111111', image: 'assets/images/imgC4.png'),
    BankHotline(name: 'กรุงศรี', hotline: '1572', image: 'assets/images/imgC5.png'),
    BankHotline(name: 'ทีเอ็มบีธนชาต', hotline: '1428', image: 'assets/images/imgC6.png'),
    BankHotline(name: 'Citibank', hotline: '1588', image: 'assets/images/imgC7.png'),
    BankHotline(name: 'LH Bank', hotline: '1327', image: 'assets/images/imgC8.png'),
    BankHotline(name: 'ธนาคารอาคารสงเคราะห์', hotline: '026459000', image: 'assets/images/imgC9.png'),
    BankHotline(name: 'ไทยพาณิชย์', hotline: '027777777', image: 'assets/images/imgC10.png'),
    BankHotline(name: 'ธนาคารเกียรตินาคินภัทร', hotline: '021655555', image: 'assets/images/imgC11.png'),
    BankHotline(name: 'ไทยเครดิต', hotline: '026975454', image: 'assets/images/imgC12.png'),
    BankHotline(name: 'UOB', hotline: '022851555', image: 'assets/images/imgC13.png'),
    BankHotline(name: 'TISCO', hotline: '026336000', image: 'assets/images/imgC14.png'),
    BankHotline(name: 'ธนาคารอิสลาม', hotline: '022042766', image: 'assets/images/imgC15.png'),
    BankHotline(name: 'CIMB Thai', hotline: '026267777', image: 'assets/images/imgC16.png'),
  ];

  @override
  Widget build(BuildContext context) => HotlinePageLayout(
    title: 'ธนาคาร',
    icon: 'assets/images/Bank.png',
    gradientColors: const [Color(0xFF7A6000), Color(0xFF150F00)],
    accentColor: const Color(0xFFFFCC00),
    itemCount: items.length,
    nameAt: (i) => items[i].name!,
    hotlineAt: (i) => items[i].hotline!,
    imageAt: (i) => items[i].image!,
    onCall: (i) => _call(items[i].hotline!),
  );
}
