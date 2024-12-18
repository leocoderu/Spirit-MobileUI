// Packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
//import 'package:hive_flutter/hive_flutter.dart';

// Layers
import 'package:model_layer/model_layer.dart';

abstract class AppState {}

class EnableLocalAuth extends AppState {
  final switchState? local_auth;

  EnableLocalAuth({this.local_auth});

  //AppStateModel _appStateModel = AppStateModel();
  //final _shoppingBox = Hive.box<AppStateModel>('spirit_box').put('local_auth', _appStateModel.local_auth);
  //_shoppingBox.put(itemKey, item);
}

class AppStateBloc extends Bloc<AppState, AppStateModel>{
  AppStateBloc() : super(AppStateModel(local_auth: switchState.off))  {
     on<EnableLocalAuth>((event, emit) => emit(state.copyWith(local_auth: event.local_auth)));
  }
}