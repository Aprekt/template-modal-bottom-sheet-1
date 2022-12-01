import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  // DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    setState(() {
      _titleController.clear();
      _amountController.clear();
    });

    // final enterredTitle = _titleController.text;
    // final enterredAmount = double.parse(_amountController.text);

    // if (enterredTitle.isEmpty || enterredAmount <= 0 
    // // || _selectedDate == null
    //     ) {
    //   return;
    // }

    // widget.addTx(
    //   enterredTitle,
    //   enterredAmount,
    //   // _selectedDate,
    // );

    // Navigator.of(context).pop();
  }

  // void _presentDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime.now(),
  //   ).then((pickedDate) {
  //     if (pickedDate == null) {
  //       return;
  //     }
  //     // setState(() {
  //     //   _selectedDate = pickedDate;
  //     // });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      elevation: 5,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)),
          gradient: LinearGradient(
              colors: [
                Color(0xff005b7f),
                Color(0xFF3366FF),
                // Color(0xFF00CCFF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              stops: [
                0.4,
                1.0,
              ],
              tileMode: TileMode.clamp),
        ),
        padding: EdgeInsets.only(
          top:  20,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              color: Colors.black45,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Title',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData,
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Amount',
                fillColor: Colors.black45,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
              // onChanged: (val) => amountInput = val,
            ),
            const SizedBox(height: 10),
            // SizedBox(
            //   height: 70,
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //           child: Text(
            //             style: const TextStyle(color: Colors.white),
            //         _selectedDate == null
            //             ? 'No Date Chosen!'
            //             : 'Picked date: ${DateFormat.yMMMMd().format(_selectedDate!)}',
            //       )),
            //       OutlinedButton(
            //         onPressed: _presentDatePicker,
            //         child: const Text(
            //           'Choose Date',
            //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            ElevatedButton(
              child: const Text('Add Transaction'),
              onPressed: () => _submitData(),
            )
          ],
        ),
      ),
    );
  }
}
