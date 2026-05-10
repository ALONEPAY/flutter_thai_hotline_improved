// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUi extends StatelessWidget {
  const AboutUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'เกี่ยวกับ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
            ),
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image with overlay
          Image.asset('assets/images/bg_ab.png', fit: BoxFit.cover),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x88000000), Color(0xEE00607E)],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // Header
                  Text(
                    'ผู้จัดทำ',
                    style: GoogleFonts.mitr(
                      color: Colors.white60,
                      fontSize: 14,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // University logo card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/images/SAU.png', width: 120, height: 120),
                        const SizedBox(height: 10),
                        Text(
                          'มหาวิทยาลัยเอเชียอาคเนย์',
                          style: GoogleFonts.mitr(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Profile card
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.09),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withOpacity(0.18), width: 1),
                    ),
                    child: Column(
                      children: [
                        // Avatar
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF00B8CC), width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00B8CC).withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/me.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                color: const Color(0xFF005F80),
                                child: const Icon(Icons.person, size: 50, color: Colors.white54),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Info rows
                        _InfoRow(icon: Icons.badge_outlined, label: 'รหัสนักศึกษา', value: '6852D10015'),
                        const SizedBox(height: 10),
                        _InfoRow(icon: Icons.person_outline_rounded, label: 'ชื่อ-นามสกุล', value: 'นาย ระพีพัฒน์ เทียมผล'),
                        const SizedBox(height: 10),
                        _InfoRow(icon: Icons.email_outlined, label: 'E-mail', value: 'rapeepat.tk003@gmail.com'),
                        const SizedBox(height: 10),
                        _InfoRow(icon: Icons.school_outlined, label: 'สาขาวิชา', value: 'เทคโนโลยีดิจิทัลและนวัตกรรม'),
                        const SizedBox(height: 10),
                        _InfoRow(icon: Icons.apartment_outlined, label: 'คณะ', value: 'ศิลปศาสตร์และวิทยาศาสตร์'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Logo
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset('assets/images/logo_sau.png', width: 80, height: 80,
                      errorBuilder: (_, __, ___) => const SizedBox.shrink()),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00B8CC), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.mitr(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
