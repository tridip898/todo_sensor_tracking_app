import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_style.dart';
import '../../core/constants/config.dart';
import '../../core/constants/regex_config.dart';
import '../widgets/app_widgets.dart';

class AppEditText extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final RegExp? regex;
  final String title;
  final String? hintText,
      helperText,
      validatorMSG,
      dynamicKeyName,
      passwordForConfirm,
      errorMsg,
      minLengthMsg,
      invalidEmailMsg,
      invalidMobileNumber,
      conformPasswordDoesNotMatchMsg,
      secondaryTitle;
  final bool isEmail,
      isGmail,
      enabled,
      isDense,
      isBangla,
      isReadonly,
      showCursor,
      isRequired,
      isPassword,
      needCapital,
      isTitleBlack,
      needTopSpace,
      isFilePicker,
      needToShowEye,
      doNeedToSaveUsernameOnGoogle,
      doNeedToSavePasswordOnGoogle,
      capitalLetter,
      isMobileNumber,
      isNumberKeyboard,
      isSignedNumberKeyboard,
      showValidatorMSG,
      isTitlePrimaryColor,
      isBackgroundTransparent,
      isCancelIconRed,
      isNeedSubtitle;

  final Pattern? regXValue;
  final void Function(String)? onChanged;
  final int maxLine, maxLength, minLine;
  final int? validLength, minLength;

  final double textFieldBorderRadius, topBottomPadding;
  final double? height,
      topLeftRadius,
      topRightRadius,
      bottomLeftRadius,
      bottomRightRadius;
  final IconData? prefixIcon, suffixIcon;
  final Color? borderColor,
      errorBorderColor,
      enabledBorderColor,
      disabledBorderColor,
      focusedBorderColor,
      hoverColor;
  final Widget? prefixWidget;
  final Function()? suffixIconClick;
  final FocusNode? focusNode, nextFocus;
  final TextStyle? titleStyle, subTitleStyle;
  dynamic inputFormatter, clickListener, selectedItem, eyeClick, fieldKey;

  AppEditText({
    Key? key,
    required this.title,
    required this.controller,
    this.regex,
    this.fieldKey,
    this.hintText,
    this.eyeClick,
    this.errorMsg,
    this.focusNode,
    this.nextFocus,
    this.minLength,
    this.onChanged,
    this.regXValue,
    this.helperText,
    this.titleStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.hoverColor,
    this.validLength,
    this.minLengthMsg,
    this.invalidEmailMsg,
    this.prefixWidget,
    this.invalidMobileNumber,
    this.clickListener,
    this.inputFormatter,
    this.dynamicKeyName,
    this.focusedBorderColor,
    this.passwordForConfirm,
    this.conformPasswordDoesNotMatchMsg,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.height,
    this.minLine = 1,
    this.maxLine = 1,
    this.maxLength = 250,
    this.validatorMSG = "",
    this.topBottomPadding = 16,
    this.enabled = true,
    this.isDense = false,
    this.isEmail = false,
    this.isGmail = false,
    this.isBangla = false,
    this.showCursor = true,
    this.isRequired = true,
    this.isReadonly = false,
    this.isPassword = false,
    this.needCapital = false,
    this.needTopSpace = true,
    this.isTitleBlack = true,
    this.isFilePicker = false,
    this.capitalLetter = false,
    this.needToShowEye = false,
    this.isMobileNumber = false,
    this.isNumberKeyboard = false,
    this.isCancelIconRed = false,
    this.doNeedToSaveUsernameOnGoogle = false,
    this.doNeedToSavePasswordOnGoogle = false,
    this.isSignedNumberKeyboard = false,
    this.showValidatorMSG = false,
    this.isTitlePrimaryColor = false,
    this.isBackgroundTransparent = false,
    this.borderColor,
    this.errorBorderColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.textInputType,
    this.textFieldBorderRadius = 8,
    this.suffixIconClick,
    this.secondaryTitle,
    this.subTitleStyle,
    this.isNeedSubtitle = false,
  }) : super(key: key);

  bool isVisible = false;

  bool isError = false;

  @override
  Widget build(BuildContext context) {
    if (textInputType == const TextInputType.numberWithOptions(signed: true) ||
        isMobileNumber ||
        isSignedNumberKeyboard) {
      inputFormatter = [
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ];
    }
    RegExp phoneNumberRegex = RegExp(r'^01\d{9}$');
    RegExp banglaRegex = RegExp(r'[ঀ-৿]+');
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: needTopSpace,
          child: gapH8,
        ),
        Visibility(
          visible: title != "",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                      text: title,
                      style: titleStyle ??

                          text16Style(
                            color: isTitleBlack
                                ? AppColors.black
                                : isTitlePrimaryColor
                                ? AppColors.primaryColor
                                : AppColors.white,
                          ),
                      children: [
                        TextSpan(
                            text: isRequired ? ' *' : "",
                            style: const TextStyle(
                              color: Colors.red,
                            )),
                      ]),
                ),
              ),
              Visibility(
                visible: isNeedSubtitle == true,
                child: gapW30,
              ),
              Visibility(
                visible: isNeedSubtitle == true,
                child: Flexible(
                  child: Text(
                    secondaryTitle ?? "",
                    style: subTitleStyle ?? text16Style(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: title != "",
          child: gapH8,
        ),
        TextFormField(
          key: fieldKey,
          autofillHints: doNeedToSaveUsernameOnGoogle
              ? const [AutofillHints.newUsername]
              : (doNeedToSavePasswordOnGoogle
              ? const [AutofillHints.password]
              : null),
          onTap: () {
            clickListener != null
                ? isFilePicker
                ? clickListener(controller, dynamicKeyName)
                : clickListener()
                : null;
          },
          textCapitalization: needCapital
              ? TextCapitalization.characters
              : TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          readOnly: isFilePicker || isReadonly,
          showCursor: !isReadonly && !isFilePicker && showCursor,
          obscureText: isPassword ? (isVisible ? false : true) : false,
          maxLines: maxLine,
          minLines: minLine,
          maxLength: isMobileNumber ? 11 : maxLength,
          inputFormatters: inputFormatter,
          scrollPadding: EdgeInsets.zero,
          onChanged: onChanged,
          focusNode: focusNode,
          style: text14Style(),
          onFieldSubmitted: (_) {
            focusNode?.unfocus();
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            }
          },
          keyboardType: textInputType ??
              (isMobileNumber
                  ? TextInputType.phone
                  : isNumberKeyboard || isSignedNumberKeyboard
                  ? TextInputType.number
                  : isEmail
                  ? TextInputType.emailAddress
                  : TextInputType.text),
          validator: (value) {
            if (!isRequired) {
              if (value != "" &&
                  dynamicKeyName != null &&
                  regexConfig[dynamicKeyName] != null) {
                if (!(regexConfig[dynamicKeyName]?.hasMatch(value ?? "  ") ??
                    true)) {
                  return "Input is not valid";
                }
              }
              return null;
            }
            if (value == null || value == "") {
              return isFilePicker
                  ? "Pick a valid Image"
                  : errorMsg ??
                  "Enter a value";
            } else if (dynamicKeyName != null &&
                regexConfig[dynamicKeyName] != null) {
              if (!(regexConfig[dynamicKeyName]?.hasMatch(value) ?? true)) {
                return "Input is not valid";
              }
            } else if (regex != null) {
              if (!(regex?.hasMatch(value) ?? true)) {
                return "Input is not valid";
              }
            } else if (isGmail) {
              if (!RegExp(gmailREGX.toString()).hasMatch(value)) {
                return validatorMSG;
              }
            } else if (capitalLetter) {
              if (!RegExp(capitalLetterREGX.toString()).hasMatch(value)) {
                return validatorMSG;
              }
            } else if (isMobileNumber) {
              if (!phoneNumberRegex.hasMatch(value)) {
                return invalidMobileNumber ??
                    "Invalid Mobile Number";
              }
            } else if (validLength != null && validLength != value.length) {
              return validatorMSG;
            } else if (showValidatorMSG) {
              if (validatorMSG != "") {
                return validatorMSG;
              }
            } else if (passwordForConfirm != null) {
              if (passwordForConfirm != value) {
                return conformPasswordDoesNotMatchMsg ??
                    "Password doesn't match";
              }
            } else if (isEmail) {
              if (!emailRegex.hasMatch(value)) {
                return invalidEmailMsg ??
                    "Invalid Email Address";
              }
            } else if (isBangla) {
              if (!banglaRegex.hasMatch(value)) {
                return "দয়া করে বাংলায় লিখুন";
              }
            } else if (isPassword && minLength != null) {
              if (value.length < (minLength ?? 999)) {
                return minLengthMsg ??
                    "Password must be $minLength digits";
              }
            } else if (minLength != null) {
              if (value.length < (minLength ?? 999)) {
                return minLengthMsg ??
                    "Field must be at least $minLength ${isMobileNumber ||
                        isNumberKeyboard ? 'Digits' : 'characters'}";
              }
            }

            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 0,
              right: 16.w,
              top: topBottomPadding.h,
              bottom: topBottomPadding.h,
            ),
            counterText: "",
            enabled: enabled,
            hintText: hintText ?? title,
            hintStyle: hintStyle,
            helperText: helperText,
            helperStyle: const TextStyle(
              color: AppColors.red,
            ),
            filled: true,
            isDense: isDense,
            fillColor:
            isBackgroundTransparent
                ? Colors.transparent
                : enabled
                ? AppColors.white
                : AppColors.disableColor,
            prefix: prefixWidget ??
                Padding(
                    padding: EdgeInsets.only(
                        left: 16.w)),
            prefixIcon: isFilePicker
                ? chooseFileDesign()
                : (prefixIcon == null ? null : Icon(prefixIcon)),
            suffixIcon: needToShowEye
                ? InkWell(
              onTap: () {
                eyeClick();
              },
              child: Icon(
                isPassword ? Icons.visibility : Icons.visibility_off,
                color: AppColors.primaryColor,
              ),
            )
                : (suffixIcon == null
                ? null
                : InkWell(
              onTap: suffixIconClick,
              child: Icon(
                suffixIcon,
                color: isCancelIconRed
                    ? Colors.redAccent
                    : AppColors.primaryColor,
              ),
            )),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (disabledBorderColor ?? AppColors.disableColor),
                width: 1.0,
              ),
              borderRadius: borderRadius(),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                AppColors.grey,
                width: 1.0,
              ),
              borderRadius: borderRadius(),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                AppColors.primaryColor,
                width: 1.0,
              ),
              borderRadius: borderRadius(),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius(),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (errorBorderColor ?? AppColors.red), width: 1.0),
              borderRadius: borderRadius(),
            ),
            hoverColor: hoverColor ?? AppColors.primaryColor,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? AppColors.red,
                width: 1.0,
              ),
              borderRadius: borderRadius(),
            ),
          ),
        ),
      ],
    );
  }

  borderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeftRadius ?? textFieldBorderRadius),
      topRight: Radius.circular(topRightRadius ?? textFieldBorderRadius),
      bottomLeft: Radius.circular(bottomLeftRadius ?? textFieldBorderRadius),
      bottomRight: Radius.circular(bottomRightRadius ?? textFieldBorderRadius),
    );
    return BorderRadius.circular(textFieldBorderRadius);
  }

  chooseFileDesign() {
    return Container(
      width: 120.w,
      height: 58.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8 - 1),
          bottomLeft: Radius.circular(8 - 1),
        ),
      ),
      child: Center(
          child: Text(
            "Choose File",
            style: text14Style(color: AppColors.white),
          )),
    );
  }
}