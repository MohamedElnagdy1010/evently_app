// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.titleText,
    this.prefixIconPath,
    this.isPassword = false,
    this.maxLines = 1,
  
    this.controller,
    this.validator,
  }) : super(key: key);
  final String hintText;
  final String? titleText;
  final String? prefixIconPath;
  final bool isPassword;
  final int? maxLines;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isSvg(String path) => path.contains(".svg");
  late bool isObscured = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (widget.titleText != null)
          Text(widget.titleText ?? '', style: theme.textTheme.titleMedium),
        TextFormField(
          style: theme.textTheme.labelMedium,
          controller: widget.controller,
          obscureText: isObscured,
          enableSuggestions: !widget.isPassword,
          autocorrect: !widget.isPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          maxLines: widget.maxLines,
          onTapUpOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
        

            hintText: widget.hintText,
            filled: true,
            fillColor: theme.cardColor,
            prefixIcon: widget.prefixIconPath == null
                ? null
                : Padding(
                    padding: EdgeInsetsGeometry.only(
                      left: 16,
                      top: 12,
                      bottom: 12,
                      right: 8,
                    ),
                    child: _isSvg(widget.prefixIconPath!)
                        ? SvgPicture.asset(
                            widget.prefixIconPath!,
                            colorFilter: ColorFilter.mode(
                              theme.disabledColor,
                              BlendMode.srcIn,
                            ),
                          )
                        : Image.asset(
                            widget.prefixIconPath!,
                            color: theme.disabledColor,
                          ),
                  ),

            hintStyle: theme.textTheme.labelSmall!.copyWith(
              color: theme.hintColor,
            ),
            border: _generateBorderStyle(theme),
            enabledBorder: _generateBorderStyle(theme),
            focusedBorder: _generateBorderStyle(
              theme,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  _generateBorderStyle(ThemeData theme, {Color? color}) => OutlineInputBorder(
    borderSide: BorderSide(color: color ?? theme.dividerColor),
    borderRadius: BorderRadius.circular(16),
  );
}
