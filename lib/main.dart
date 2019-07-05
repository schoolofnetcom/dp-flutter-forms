import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  var _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  icon: Icon(Icons.label)
                ),
                onSaved: (value) {
                  _formData['name'] = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nome é obrigatório';
                  }
                },
              ),
              TextFormField(
                // obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email)
                ),
                onSaved: (value) {
                  _formData['email'] = value;
                },
              ),
              RaisedButton(
                child: Text('Enviar', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print(_formData);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
