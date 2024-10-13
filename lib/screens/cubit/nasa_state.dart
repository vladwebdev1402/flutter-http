import 'package:laba_http/model/nasa.dart';

abstract class NasaState {}

class NasaLoadingState extends NasaState {}

class NasaErorState extends NasaState {
  String error;
  NasaErorState({required this.error});
}

class NasaLoadedState extends NasaState {
  Nasa data;
  NasaLoadedState({required this.data});
}
