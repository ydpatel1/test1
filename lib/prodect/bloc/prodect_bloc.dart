import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:formz/formz.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test1/prodect/bloc/prodect_event.dart';
import 'package:test1/prodect/bloc/prodect_state.dart';
import 'package:test1/prodect/api/prodect_api.dart';
import 'package:test1/prodect/model/prodect_model.dart';

class ProdectBloc extends Bloc<ProdectEvent, ProdectState> {
  ProdectApi prodectApi = ProdectApi();
  Future<bool> getLocation() async {
    if (await Permission.location.request().isGranted) {
      return true;
    } else {
      if (await Permission.location.request().isGranted) {
        return true;
      } else {
        if (await Permission.location.request().isPermanentlyDenied) {
          await openAppSettings();
          bool isGranted = await Permission.location.isGranted;
          return isGranted;
        } else {
          return false;
        }
      }
    }
  }

  Future<bool> chackInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  ProdectBloc()
      : super(ProdectState(
          formStatus: FormzSubmissionStatus.initial,
        )) {
    on<GetLocationPermision>((event, emit) async {
      emit(state.copyWith(formStatus: FormzSubmissionStatus.inProgress));
      bool isGranted = await getLocation();
      if (isGranted) {
        add(GetProdectEvent());
      } else {
        emit(state.copyWith(
            isLocationGranted: isGranted,
            formStatus: FormzSubmissionStatus.initial));
      }
    });
    on<GetProdectEvent>((event, emit) async {
      try {
        bool isInterneton = await chackInternet();
        if (isInterneton) {
          String? json = await prodectApi.getProdect();
          if (json != null) {
            List<ProdectModel> prodects = prodectModelFromJson(json);

            emit(state.copyWith(
                formStatus: FormzSubmissionStatus.success,
                prodect: prodects,
                isLocationGranted: true));
          } else {}
        } else {
          print("yashp");
        }
      } catch (e, s) {
        print(e);
        print(s);
      }
    });
  }
}
