import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laba_http/screens/api/get_nasa_photos.dart';
import 'package:laba_http/screens/cubit/nasa_state.dart';
import 'package:laba_http/model/nasa.dart';

class NasaCubit extends Cubit<NasaState> {
  NasaCubit() : super(NasaLoadingState());

  Future<void> getData() async {
    try {
      emit(NasaLoadingState());
      final response = await getNasaPhotos();
      Nasa data = Nasa.fromJson(response);
      emit(NasaLoadedState(data: data));
    } catch (e) {
      emit(NasaErorState(error: e.toString()));
    }
  }
}
