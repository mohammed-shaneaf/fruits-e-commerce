import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/generated/l10n.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
    this.onSaved,
  });

  final TextEditingController passwordController;
  final void Function(String)? onSaved;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  double getPasswordStrength(String password) {
    double strength = 0.0;
    if (password.length >= 8) strength += 0.3;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength += 0.3;
    if (RegExp(r'[0-9]').hasMatch(password)) strength += 0.2;
    if (RegExp(r'[@$!%*?&]').hasMatch(password)) strength += 0.2;
    return strength;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          obscureText: obscureText,
          controller: widget.passwordController,
          hintText: S.of(context).Password,
          textInputType: TextInputType.visiblePassword,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 31.w),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                child: Icon(
                  obscureText ? Icons.remove_red_eye : Icons.visibility_off,
                  key: ValueKey(obscureText),
                  color: Color(0xffC9CECF),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: widget.passwordController,
          builder: (context, value, child) {
            double strength = getPasswordStrength(value.text);
            return Column(
              children: [
                LinearProgressIndicator(
                  value: strength,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    strength < 0.5 ? Colors.red : Colors.green,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  strength < 0.5 ? 'كلمة المرور ضعيفة' : 'كلمة المرور قوية',
                  style: TextStyle(
                    color: strength < 0.5 ? Colors.red : Colors.green,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
