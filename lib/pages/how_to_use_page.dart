import 'package:flutter/material.dart';
import 'package:victoria_real_state_website/components/header.dart';

class HowToUsePage extends StatefulWidget {
  const HowToUsePage({super.key});

  @override
  State<HowToUsePage> createState() => _HowToUsePageState();
}

class _HowToUsePageState extends State<HowToUsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: Header());
  }
}
