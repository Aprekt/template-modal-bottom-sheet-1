//* @aprekt.dev
//* Complete code on github
//* link in bio

import 'package:flutter/material.dart';
import 'package:template_modal_bottom_sheet_1/models/transaction.dart';
import 'package:template_modal_bottom_sheet_1/widgets/new_transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Modal Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff005b7f),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const ModalBottomSheet(),
      ),
    );
  }
}

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New Earphone', amount: 1499, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'New smartphone', amount: 17999, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: txDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff005b7f),
            Color(0xFF3366FF),
            // Color(0xFF00CCFF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          stops: [0.4, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          // const AppBarlayout(),
          Flexible(
            fit: FlexFit.loose,
            child: Center(
              child: ElevatedButton(
                child: const Text('Open BottomSheet'),
                onPressed: () {
                  openModalSheet(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> openModalSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(20.0),
      // ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }
}
