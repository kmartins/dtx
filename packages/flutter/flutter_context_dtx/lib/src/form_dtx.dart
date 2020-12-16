import 'package:flutter/material.dart';

class _Form {
  _Form(this._context);

  final BuildContext _context;

  FormState get _formState => Form.of(_context);

  bool validate() => _formState.validate();

  void reset() => _formState.reset();

  void save() => _formState.save();
}

///
/// Contains extensions for easier access to [Form] using [BuildContext]
///
extension FormDtx on BuildContext {
  _Form get form => _Form(this);
}
