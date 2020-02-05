import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  //2 stream controllers - password and email

  // final _emailCtrl = StreamController<String>.broadcast();
  // final _passwordCtrl = StreamController<String>.broadcast();

  final BehaviorSubject<String> _emailCtrl = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordCtrl = BehaviorSubject<String>();

  //create getters to simplify access
  Function(String) get addEmail => _emailCtrl.sink.add;
  Function(String) get addPassword => _passwordCtrl.sink.add;

  Stream<String> get email => _emailCtrl.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordCtrl.stream.transform(validatePassword);

  Stream<bool> get isFormValid => Rx.combineLatest2(email, password, (e, p) {
        return true;
      });

  //submit method- get values frim stream and save
  void submitForm() {
    final _goodEmail = _emailCtrl.value;
    final _goodPass = _passwordCtrl.value;

    print("email is : $_goodEmail and password is : $_goodPass");
  }

  dispose() {
    _emailCtrl.close();
    _passwordCtrl.close();
  }
}

// single global instance
//final bloc = Bloc();
