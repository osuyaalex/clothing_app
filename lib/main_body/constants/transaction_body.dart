import 'package:clothing_app/main_body/constants/model.dart';
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
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: transactionData?.length,
          itemBuilder: (context, index){

            return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width*0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(transactionData?[index].metadata?.customFields?[3].value ?? '--',
                          style: GoogleFonts.tenorSans(
                            fontWeight: FontWeight.w600
                          ),
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          );
          }
      ),
    );
  }
}
