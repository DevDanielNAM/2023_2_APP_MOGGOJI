import 'package:flutter/material.dart';

import '../common/bottom_navi_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOGGOJI"),
        // 뒤로가기 버튼 없애기 -> 로그인 구현 후 적용할 예정
        // automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Text("HOME PAGE"),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
