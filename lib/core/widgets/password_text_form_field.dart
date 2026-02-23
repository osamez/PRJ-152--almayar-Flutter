import 'package:almeyar/core/utils/exports.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.title,
    required this.isRequired,
    required this.validator,
  });
  final String hintText;
  final TextEditingController? controller;
  final String? title;
  final bool isRequired;
  final dynamic Function(String?) validator;
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.controller,
      title: widget.title,
      isRequired: widget.isRequired,
      hintText: widget.hintText,
      keyboardType: TextInputType.emailAddress,
      validator: widget.validator,
      isObscureText: isObscure,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        icon: Icon(
          isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AppColors.deepViolet,
        ),
      ),
    );
  }
}
