import 'package:flutter/material.dart';
import '../states/custom_text_field_state.dart';
import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final CustomTextFieldState state;

  const CustomTextField({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth > 280 ? 280.0 : constraints.maxWidth;

        return ListenableBuilder(
          listenable: state.controller,
          builder: (context, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 4),
                  child: Text(
                    state.label,
                    style: const TextStyle(
                      color: AppColors.onTertiaryContainer,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: width,
                    maxHeight: 48.0,
                  ),
                  child: TextField(
                    controller: state.controller.textController,
                    keyboardType: state.keyboardType,
                    obscureText: state.controller.isObscured,
                    decoration: InputDecoration(
                      errorText: state.controller.errorText,
                      filled: true,
                      fillColor: AppColors.surfaceDim,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: state.controller.shouldShowIcon
                          ? IconButton(
                        icon: Icon(
                          state.controller.isObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: state.controller.toggleObscured,
                      )
                          : null,
                    ),
                    onChanged: (value) {
                      state.controller.setText(value);
                      state.onChanged?.call(value);
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}