// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:prueba/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import '../services/firebase_servide.dart';

void initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      List usuarios = await getUsuarios2(_email, _password);

      if (usuarios.isNotEmpty) {
        // Usuario autenticado
        var Future() = Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        // Usuario no autenticado
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text('Error de inicio de secion!'),
              content: const Text('Los datos son incorrectos!'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu contraseña';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _login(),
                child: const Text('Iniciar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
