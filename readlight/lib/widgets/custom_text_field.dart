import 'package:flutter/material.dart';
import '../states/custom_text_field_state.dart';

class CustomTextField extends StatelessWidget {
  final CustomTextFieldState state;

  const CustomTextField({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: state.controller,
      builder: (context, _) {
        return TextField(
          controller: state.controller.textController,
          keyboardType: state.keyboardType,
          obscureText: state.controller.isObscured,
          decoration: InputDecoration(
            labelText: state.label,
            errorText: state.controller.errorText,
            suffixIcon: IconButton(
              icon: Icon(
                state.controller.isObscured
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
              onPressed: state.controller.toggleObscured,
            ),
          ),
          onChanged: (value) {
            state.controller.setText(value);
            state.onChanged?.call(value);
          },
        );
      },
    );
  }
}