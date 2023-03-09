import 'package:clothing_app/main_body/constants/networks/transaction_total_network.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/transaction_total_model.dart';

class TransactionTotals extends StatefulWidget {
  const TransactionTotals({Key? key}) : super(key: key);

  @override
  State<TransactionTotals> createState() => _TransactionTotalsState();
}

class _TransactionTotalsState extends State<TransactionTotals> {
  late Future<TransactionTotal> _totalTransaction;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _totalTransaction = Networks().getTransactionTotal();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _totalTransaction,
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
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Total Transactions:',
                            style: GoogleFonts.redHatDisplay(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                                color: Colors.grey.shade600

                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(snapshot.data?.data?.totalTransactions.toString()??'',
                            style: GoogleFonts.redHatDisplay(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text('Total Sale ${snapshot.data?.data?.totalVolumeByCurrency?[0].currency??''}:',
                            style: GoogleFonts.redHatDisplay(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade600

                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(snapshot.data?.data?.totalVolumeByCurrency?[0].amount.toString()??'',
                            style: GoogleFonts.redHatDisplay(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade600
                            ),
                          )
                        ],
                      ),
                    ]
                  ),
                ],
              ),
            );
          }else{
            return CircularProgressIndicator(color: Colors.black,);
          }
        }
    );
  }
}

