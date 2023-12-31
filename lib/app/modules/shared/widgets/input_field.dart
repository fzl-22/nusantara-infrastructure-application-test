import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.validator,
  }) : isPassword = false;

  const InputField.password({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.validator,
  }) : isPassword = true;

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isVisible = false;

  void _onToggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && !_isVisible,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
      maxLength: 64,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.inversePrimary,
        contentPadding: const EdgeInsets.all(12),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
            ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _onToggleVisibility,
                child: Icon(
                  _isVisible ? IconlyLight.show : IconlyLight.hide,
                ),
              )
            : null,
        suffixIconColor: Theme.of(context).colorScheme.primary,
        counter: const SizedBox.shrink(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
      ),
    );
  }
}
