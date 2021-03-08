import 'package:flutter/material.dart';
import 'package:flutter_context_dtx/flutter_context_dtx.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Form(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (text) {
                    if (text?.isEmpty ?? false) return 'Text cannot be empty';
                    return null;
                  },
                ),
                _ValidateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ValidateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => context.form.validate(),
      child: const Text('Validate'),
    );
  }
}
