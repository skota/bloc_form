import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.fromLTRB(
        10.0,
        5.0,
        10.0,
        0.0,
      ),
      child: Column(
        children: <Widget>[
          _emailField(bloc),
          _passwordField(bloc),
          _confirmPasswordField(),
          SizedBox(
            height: 20.0,
          ),
          _registerButton(bloc)
        ],
      ),
    );
  }

  Widget _emailField(Bloc bloc) {
    return StreamBuilder(
      //every time a new value comes from the stream
      // the widget builds itself again
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.addEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            //border: OutlineInputBorder(),
            labelText: 'Enter email',
            hintText: 'jdoe@gmail',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget _passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.addPassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Enter Password',
            errorText: snapshot.error,
          ),
          // hintText: 'jdoe@gmail'
        );
      },
    );
  }

  Widget _confirmPasswordField() {
    return TextField(
      // onChanged: (value) {
      //   bloc.addEmail(value);
      // },
      obscureText: true,
      // keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Enter password again',
        // hintText: 'jdoe@gmail'
      ),
    );
  }

  Widget _registerButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.isFormValid,
      //initialData: false,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: RaisedButton(
            color: Colors.blue,
            onPressed: snapshot.hasData ? bloc.submitForm : null,
            child: Text("Register"),
          ),
        );
      },
    );
  }
}
