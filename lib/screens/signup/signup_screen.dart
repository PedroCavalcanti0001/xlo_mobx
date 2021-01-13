import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/signup/components/field_title.dart';
import 'package:xlo_mobx/stores/signup_store.dart';

class SignupScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cadastre-se"),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 8,
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTitle('Apelido', 'Como aparecerá em seus anúncios'),
                    Observer(
                      builder: (_) => TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: Joao s',
                            isDense: true,
                            errorText: signupStore.nameError),
                        onChanged: signupStore.setName,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle('E-mail', 'Envaremos um email de confirmação'),
                    Observer(
                      builder: (_) => TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: joao@gmail.com',
                          isDense: true,
                          errorText: signupStore.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: signupStore.setEmail,
                        autocorrect: false,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle('Celular', 'proteja sua conta'),
                    Observer(
                      builder: (_) => TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: (99) 99999-9999',
                          isDense: true,
                          errorText: signupStore.phoneError,
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: signupStore.setPhone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                        'Senha', 'Use letras, números e caracteres especiais'),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle('Confirmar Senha', 'Repita a senha'),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.only(top: 20, bottom: 12),
                      child: RaisedButton(
                        color: Colors.orange,
                        child: Text("CADASTRAR"),
                        textColor: Colors.white,
                        elevation: 0,
                        onPressed: () {
                          print("store ${signupStore}");
                          print("store ${signupStore != null}");
                          print("store ${signupStore.nameError}");
                          print("store ${signupStore.nameError != null}");
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text(
                            "Já tem uma conta? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Entrar",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.purple,
                                  fontSize: 16,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
