import 'package:flutter/material.dart';
import '../states/custom_checkbox_state.dart';
import '../theme/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final CustomCheckboxState state;

  const CustomCheckbox({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: state.controller,
      builder: (context, _) {
        return Padding(
          padding: state.padding ?? EdgeInsets.zero,
          child: Row(
            mainAxisSize: state.mainAxisSize,
            crossAxisAlignment: state.crossAxisAlignment,
            children: [
              Checkbox(
                value: state.controller.isChecked,
                checkColor: Colors.white,
                activeColor: state.activeColor ?? AppColors.checkedBox,
                onChanged: (_) => state.controller.toggleCheckbox(),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: state.controller.toggleCheckbox,
                  child: Text(
                    state.text,
                    style: state.textStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.outline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
