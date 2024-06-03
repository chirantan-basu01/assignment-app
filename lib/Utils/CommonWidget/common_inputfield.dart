import 'package:assignment_product_list/Utils/Helper/dominos_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Helper/app_colors.dart';
import '../Helper/app_decoration.dart';
import '../Helper/screen_utils.dart';

class CommonTextFormField extends StatefulWidget {
  late TextEditingController? controller;
  final String? suffixIcon;
  final TextInputAction textInputAction;
  final String hintText;
  final String? labelText;
  final TextInputType textInputType;
  final Color fillColors;
  final TextAlign textAlign;
  final Function(String)? onValueChanged;
  final Function(String?)? onValidator;
  final Function()? onSuffixClick;
  final Function? onSuffixClickWithValue;
  final bool? isProgressSuffix;
  final bool? obscureText;
  final bool readOnly;
  final bool? isEnable;
  List<TextInputFormatter>? inputFormatters;
  final Function(String? value)? onSave;
  final Function()? onTap;
  final String? initialValue;
  final InputDecoration? decoration;
  final int maxLine;
  final int? maxLength;
  final FocusNode? focusNode;

  CommonTextFormField(
      {this.controller,
      super.key,
      this.labelText,
      this.hintText = "",
      this.readOnly = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.fillColors = Colors.transparent,
      this.suffixIcon,
      this.textAlign = TextAlign.start,
      this.onValueChanged,
      this.onTap,
      this.onValidator,
      this.decoration,
      this.maxLine = 1,
      this.isProgressSuffix,
      this.onSuffixClick,
      this.onSave,
      this.isEnable,
      this.initialValue,
      this.focusNode,
      this.maxLength,
      this.inputFormatters,
      this.onSuffixClickWithValue});

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  String? textValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtils().screenWidth(context),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: const TextStyle(color: AppColors.black),
              onTap: widget.onTap,
              cursorColor: AppColors.primaryButtonColor,
              obscureText: widget.obscureText!,
              readOnly: widget.readOnly,
              enabled: widget.isEnable,
              maxLength: widget.maxLength,
              initialValue: widget.initialValue,
              controller: widget.controller,
              textAlign: widget.textAlign,
              maxLines: widget.maxLine,
              focusNode: widget.focusNode,
              inputFormatters: widget.inputFormatters,
              onSaved: (value) {
                if (widget.onSave != null) {
                  widget.onSave!(value);
                }
              },
              textCapitalization: TextCapitalization.sentences,
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
              textAlignVertical: TextAlignVertical.center,
              decoration: widget.decoration ??
                  AppDecoration.sFormField.copyWith(
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primaryButtonColor, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primaryButtonColor, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: widget.fillColors,
                      labelText: widget.labelText,
                      hintText: widget.hintText,
                      labelStyle:
                          const TextStyle(color: AppColors.colorSecondaryText2),
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      isDense: true,
                      counterText: '',
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 2,
                        minHeight: 2,
                      ),
                      suffixIcon: widget.suffixIcon != null
                          ? InkWell(
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                if (widget.onSuffixClick != null) {
                                  widget.onSuffixClick!();
                                }
                                if (widget.onSuffixClickWithValue != null) {
                                  widget.onSuffixClickWithValue!(textValue);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: DominosIcon(
                                  iconName: widget.suffixIcon,
                                  width: 23,
                                  height: 23,
                                ),
                              ),
                            )
                          : null),
              onChanged: (value) {
                textValue = value;
                widget.onValueChanged != null
                    ? widget.onValueChanged!(value)
                    : null;
              },
              validator: (value) => widget.onValidator != null
                  ? widget.onValidator!(value)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
