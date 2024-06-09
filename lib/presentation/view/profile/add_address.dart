import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddAddress extends ConsumerStatefulWidget {
  const AddAddress({super.key});

  @override
  ConsumerState createState() => _AddAddressState();
}

class _AddAddressState extends ConsumerState<AddAddress> {
  String? countryValue = '';
  String? stateValue = '';
  String? cityValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
        ],
      ),
    );
  }
}
