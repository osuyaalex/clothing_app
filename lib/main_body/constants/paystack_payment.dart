import 'dart:io';

import 'package:clothing_app/controller/snackbar_controller.dart';
import 'package:clothing_app/main_body/constants/key.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
class MakePayment{
  BuildContext context;
   double price;
   String email;
   String firstName;
   String lastName;
   int phoneNo;
   DateTime currentTime;
   String productName;
  MakePayment(this.context, this.price, this.email, this.firstName, this.lastName, this.phoneNo, this.currentTime, this.productName);

  PaystackPlugin _paystackPlugin = PaystackPlugin();

  initializePlugin()async{
    await _paystackPlugin.initialize(publicKey: ConstantKey.payStackKey);
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardUi(){
    return PaymentCard(number: '4084084084084081', cvc: '408', expiryMonth: 03, expiryYear: 24);
  }


  // method for charging card
 chargeCardAndMakePayment()async{
     initializePlugin().then((_)async{
       Charge charge = Charge()
            ..amount = (price*100).toInt()// because paystack uses kobo. so you multiply the value by 100 to get value in naira
           ..email = email
           ..reference = _getReference()
           ..card = _getCardUi()
           ..putCustomField('first_name', firstName)
           ..putCustomField('last_Name', lastName)
           ..putCustomField('Phone', phoneNo.toString())
           ..putCustomField('currentTime', currentTime.toString())
           ..putCustomField('productName', productName);

       CheckoutResponse response = await _paystackPlugin.checkout(
           context,
           charge: charge,
         method: CheckoutMethod.card,
         fullscreen: false
       );

       if(response.status == true){
         snackBar('Transaction Successful', context);
       }else{
         snackBar('Transaction Failed', context);
       }
     });
 }
}
