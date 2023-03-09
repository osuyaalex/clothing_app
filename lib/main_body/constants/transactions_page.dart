import 'package:clothing_app/main_body/constants/networks/network.dart';
import 'package:clothing_app/main_body/constants/transaction_body.dart';
import 'package:clothing_app/main_body/constants/transaction_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import 'models/model.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  late Future<Transaction> _allTransactions;
  
  @override
  void initState() {
    // TODO: implement initState
    _allTransactions = Network().getTransactions();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7EAEF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 20),
          child: Row(
            children: [
              SvgPicture.asset('assets/iconImages/Logo.svg'),
              const SizedBox(
                width: 40,
              ),

                 Text('Transaction Receipt',
                  style: GoogleFonts.redHatDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _allTransactions,
                builder: (context, snapshot){
                if(!snapshot.hasData){
                  return Container();
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator(color: Colors.black,);
                }
                if(snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                }
                if(snapshot.hasData){
                  return TransactionBody(snapshot:snapshot);
                }else{
                  return CircularProgressIndicator(color: Colors.black,);
                }
                }
            ),
            TransactionTotals()
          ],
        ),
      ),
    );
  }
}
