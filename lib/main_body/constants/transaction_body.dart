
import 'package:clothing_app/main_body/constants/models/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class TransactionBody extends StatelessWidget {
  final AsyncSnapshot<Transaction> snapshot;
  const TransactionBody({Key? key, required this.snapshot}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<Data>? transactionData = snapshot.data!.data;



    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.7,
        child: ListView.builder(
          itemCount: transactionData?.length,
            itemBuilder: (context, index){

              return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width*0.75,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.white,
                    Colors.orange

                  ]),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(transactionData?[index].paidAt??'',
                            style: GoogleFonts.redHatDisplay(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400
                            ),
                          ),
                          Text(transactionData?[index].channel??'',
                            style: GoogleFonts.redHatDisplay(
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(transactionData?[index].customer?.email ??'',
                            style: GoogleFonts.redHatDisplay(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),
                          )
                        ],
                      ),
                    ),
                   Padding(
                     padding: const EdgeInsets.only(left: 14.0, top: 45, right: 14),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         transactionData?[index].status == 'success'?Text(transactionData?[index].status ??'',
                           style: GoogleFonts.tenorSans(
                               fontWeight: FontWeight.w600,
                               color: Colors.orange
                           ),
                         ):Text(transactionData?[index].status ??'',
                           style: GoogleFonts.tenorSans(
                               fontWeight: FontWeight.w600,
                               color: Colors.red
                           ),
                         ),
                         Row(
                           children: [
                             Text('Amount ${transactionData?[index].currency??''}:',
                               style: GoogleFonts.redHatDisplay(
                                 fontSize: 17,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.white
                               ),
                             ),
                             const SizedBox(
                               width: 12,
                             ),
                             Text(transactionData?[index].amount.toString() ??'',
                               style: GoogleFonts.redHatDisplay(
                                 fontSize: 16,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.white
                               ),
                             )
                           ],
                         )
                       ],
                     ),
                   ),
                  ],
                ),
              ),
            );
            }
        ),
      ),
    );
  }
}
