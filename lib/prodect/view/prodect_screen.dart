import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:test1/prodect/bloc/prodect_event.dart';
import 'package:test1/prodect/bloc/prodect_state.dart';
import 'package:test1/prodect/widget/first_row.dart';
import 'package:test1/prodect/widget/mybutton.dart';
import 'package:test1/prodect/widget/prodect_card.dart';
import '../bloc/prodect_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ProdectScreen extends StatefulWidget {
  const ProdectScreen({super.key});

  @override
  State<ProdectScreen> createState() => _ProdectScreenState();
}

class _ProdectScreenState extends State<ProdectScreen> {
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    // subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.none) {
    //     print("none");
    //   } else {
    //     print("net");
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    // subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProdectBloc()..add(GetLocationPermision()),
      child: Scaffold(
        backgroundColor: const Color(0xfff6f6f6),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "Deals of the Week",
            style: TextStyle(color: Colors.white),
          ),
          leading: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        body: BlocBuilder<ProdectBloc, ProdectState>(
          builder: (context, state) {
            return state.formStatus.isInProgress
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : (state.isLocationGranted ?? false)
                    ? Column(
                        children: [
                          FirstRow(
                            items: state.prodect?.length ?? 0,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: state.prodect?.length ?? 0,
                                itemBuilder: ((context, index) {
                                  return Row(
                                    children: [
                                      ProdectCard(
                                          prodect: state.prodect![index]),
                                      if ((index + 1) < state.prodect!.length)
                                        ProdectCard(
                                            prodect: state.prodect![index + 1])
                                    ],
                                  );
                                })),
                          )
                        ],
                      )
                    : Center(
                        child: MyButton(
                          title: 'Give Location Permission',
                          ontap: () {
                            BlocProvider.of<ProdectBloc>(context)
                                .add(GetLocationPermision());
                          },
                        ),
                      );
          },
        ),
      ),
    );
  }
}
