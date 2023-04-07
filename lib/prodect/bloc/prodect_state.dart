// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:formz/formz.dart';
import 'package:test1/prodect/model/prodect_model.dart';

class ProdectState {
  final bool? isLocationGranted;
  final List<ProdectModel>? prodect;
  final FormzSubmissionStatus formStatus;
  ProdectState({
    this.isLocationGranted,
    this.prodect,
    required this.formStatus,
  });

  ProdectState copyWith({
    bool? isLocationGranted,
    List<ProdectModel>? prodect,
    FormzSubmissionStatus? formStatus,
  }) {
    return ProdectState(
      isLocationGranted: isLocationGranted ?? this.isLocationGranted,
      prodect: prodect ?? this.prodect,
      formStatus: formStatus ?? FormzSubmissionStatus.initial,
    );
  }
}

// class ProdectInitial extends ProdectState {}
