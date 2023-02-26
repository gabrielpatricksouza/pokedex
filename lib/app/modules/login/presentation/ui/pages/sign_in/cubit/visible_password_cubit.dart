import 'package:bloc/bloc.dart';

class VisiblePasswordCubit extends Cubit<bool> {
  VisiblePasswordCubit() : super(false);

  void toggleBoolValue() {
    emit(!state);
  }
}