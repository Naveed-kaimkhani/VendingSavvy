import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/views/authentication/bottombar.dart';
import 'package:vendingsavvy/views/authentication/bussiness/aboutus.dart';
import 'package:vendingsavvy/views/authentication/bussiness/addnewcard.dart';
import 'package:vendingsavvy/views/authentication/bussiness/bankcardconnection.dart';
import 'package:vendingsavvy/views/authentication/bussiness/bankcardmanagment.dart';
import 'package:vendingsavvy/views/authentication/bussiness/businesslogin.dart';
import 'package:vendingsavvy/views/authentication/bussiness/bussinesscommision.dart';
import 'package:vendingsavvy/views/authentication/bussiness/cardconnectedscreen.dart';
import 'package:vendingsavvy/views/authentication/bussiness/dataprivacy.dart'
    show DataPrivacy;
import 'package:vendingsavvy/views/authentication/bussiness/expensemanagement/addexpense.dart';
import 'package:vendingsavvy/views/authentication/bussiness/expensemanagement/categorysuccessfull.dart';
import 'package:vendingsavvy/views/authentication/bussiness/expensemanagement/expensehistory.dart';
import 'package:vendingsavvy/views/authentication/bussiness/expensemanagement/expensemanagment.dart';
import 'package:vendingsavvy/views/authentication/bussiness/expensemanagement/inventorycost.dart';
import 'package:vendingsavvy/views/authentication/bussiness/personalinformation.dart';
import 'package:vendingsavvy/views/authentication/bussiness/profilepage.dart';
import 'package:vendingsavvy/views/authentication/bussiness/reports/balancesheet.dart';
import 'package:vendingsavvy/views/authentication/bussiness/reports/breakevenreport.dart';
import 'package:vendingsavvy/views/authentication/bussiness/reports/cashflowreport.dart';
import 'package:vendingsavvy/views/authentication/bussiness/reports/profitlossreport.dart'
    hide Expensemanagment;
import 'package:vendingsavvy/views/authentication/bussiness/reports/reportsscreen.dart';
import 'package:vendingsavvy/views/authentication/bussiness/reports/withdrawhistorydetail.dart';
import 'package:vendingsavvy/views/authentication/bussiness/salesmanagement/sales.dart';
import 'package:vendingsavvy/views/authentication/bussiness/signupbusiness.dart';
import 'package:vendingsavvy/views/authentication/bussiness/successcreen.dart';
import 'package:vendingsavvy/views/authentication/bussiness/taxcalculator.dart';
import 'package:vendingsavvy/views/authentication/bussiness/termsconditions.dart';
import 'package:vendingsavvy/views/authentication/bussiness/verifybankcard.dart';
import 'package:vendingsavvy/views/authentication/bussiness/withdrawamountscreen.dart';
import 'package:vendingsavvy/views/authentication/bussiness/withdrawconfirmation.dart';
import 'package:vendingsavvy/views/authentication/bussiness/withdrawhistory.dart';
import 'package:vendingsavvy/views/authentication/homescreen.dart';
import 'package:vendingsavvy/views/authentication/onboardingscreen.dart';
import 'package:vendingsavvy/views/authentication/phoneverificationscreen.dart';
import 'package:vendingsavvy/views/authentication/signscreenconfirmation.dart';
import 'package:vendingsavvy/views/authentication/signupbusinformation.dart';
import 'package:vendingsavvy/views/authentication/signupbusinformation2.dart';
import 'package:vendingsavvy/views/authentication/splassscreen.dart';
import 'package:vendingsavvy/views/authentication/vedningconfirmationcommsion.dart';
import 'package:vendingsavvy/views/authentication/vendingcommision.dart';
import 'package:vendingsavvy/views/authentication/vendingsavingaddress.dart';
import 'package:vendingsavvy/views/authentication/vendingsavvyinformation.dart';
import 'package:vendingsavvy/views/authentication/verifyemailscreen.dart';

class AppRouters {
  static final List<GetPage> routes = [
    // ======================> Auth
    GetPage(
      name: RouteConstants.splashscreen,
      page: () => const SplashScreen(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: RouteConstants.onboardingscreen,
      page: () => const Onboardingscreen(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: RouteConstants.taxcalulator,
      page: () => const Taxcalculator(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.onboardingscreen,
      page: () => const Onboardingscreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.signinscreenconfirmation,
      page: () => const SigninConfirmation(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.bankcardmanagement,
      page: () => const Bankcardmanagment(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.bankconnectionpage,
      page: () => const BankCardConnection(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.profileinformation,
      page: () => const Personalinformation(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.addnewcard,
      page: () => const Addnewcard(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: RouteConstants.bankcardverify,
      page: () => const Verifybankcard(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.bankcardconnected,
      page: () => const Cardconnectedscreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.withdrawamount,
      page: () => const Withdrawamountscreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.successscreen,
      page: () => const Successcreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.withdrawconfirmation,
      page: () => const Withdrawconfirmation(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.widthdrawehistory,
      page: () => const Withdrawhistory(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.aboutus,
      page: () => const Aboutus(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.breakevenreport,
      page: () => const Breakevenreport(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.withdrawdetails,
      page: () => Withdrawhistorydetail(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.expensemanagemeent,
      page: () => Expensemanagment(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.balancesheet,
      page: () => Balancesheet(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.balancesheet,
      page: () => Balancesheet(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.categorysuccesfull,
      page: () => Categorysuccessfull(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.expensehistory,
      page: () => Expensehistory(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.addexpense,
      page: () => Addexpense(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.inventorycost,
      page: () => Inventorycost(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.reports,
      page: () => const Reportsscreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.profitlossreport,
      page: () => const Profitlossreport(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.cashflowreport,
      page: () => const Cashflowreport(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.termscondition,
      page: () => const Termsconditions(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.dataprivacy,
      page: () => const DataPrivacy(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.profilepage,
      page: () => const ProfilePage(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.signupscreen2,
      page: () => const Signup2businformation(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.salesmanagement,
      page: () => const Salesmanagement(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.vendinginformationscreen,
      page: () => const Vendingsavvyinformation(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.bussinesscommision,
      page: () => const Bussinesscommision(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.homescreen,
      page: () => const Homescreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.bussinesslogin,
      page: () => const Businesslogin(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: RouteConstants.bussinessinformation,
      page: () => const BussinessinformationScreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.vendingsavingaddress,
      page: () => const VendingsavingaddressScreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.vendingconfirmationcomission,
      page: () => const VendingConfirmationCommission(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: RouteConstants.phoneverification,
      page: () => const Phoneverificationscreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.verifyscreen,
      page: () => const Verifyemailscreen(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: RouteConstants.vendingcommision,
      page: () => const Vendingcommision(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: RouteConstants.signupscreen,
      page: () => const Signupbusinformation(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: RouteConstants.dashboard,
      page: () => const MainScreen(),
      curve: Curves.easeIn,
    ),
  ];
}
