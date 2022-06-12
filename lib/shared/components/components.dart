import 'package:fitness_app/shared/styles/colors.dart';
import 'package:fitness_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget onBoardingScreenItem(
  BuildContext context,
  String title,
  String description,
  String image,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Image.asset(
        image,
        fit: BoxFit.fill,
        height: 443,
      ),
      const SizedBox(
        height: 64,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: h2TextStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              description,
              style: mediumTextStyle.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget customTextFormField(
    {@required TextEditingController? controller,
    @required TextInputType? type,
    // Function onSubmit,
    // Function onChange,
    Function()? onTap,
    @required String? Function(String?)? validate,
    @required String? placeHolder,
    @required String? prefixIcon,
    double? verticalPadding,
    Icon? suffixIcon,
    Function()? suffixIconPressed,
    bool readOnly = false,
    bool isClickable = true,
    bool isPassword = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: verticalPadding ?? 15,
    ),
    child: TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: placeHolder,
        hintStyle: hintTextStyle.copyWith(fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14),
        ),
        fillColor: borderColor,
        filled: true,
        prefixIcon: Image.asset(prefixIcon ?? ''),
        suffixIcon: suffixIcon == null
            ? null
            : InkWell(
                child: suffixIcon,
                onTap: suffixIconPressed,
              ),
      ),
    ),
  );
}

Widget customTextButton(
    {@required String? text, TextStyle? textStyle, HexColor? backgroundColor, LinearGradient? gradientColor, @required Function()? onPressed}) {
  return Ink(
    decoration: gradientColor == null
        ? null
        : BoxDecoration(
            gradient: gradientColor,
            borderRadius: BorderRadius.circular(99),
          ),
    child: TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 18,
          ),
        ),
        backgroundColor: gradientColor == null ? MaterialStateProperty.all(backgroundColor ?? Colors.blue[400]) : null,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
            side: BorderSide(color: whiteColor),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text ?? '',
        style: textStyle ?? const TextStyle(),
      ),
    ),
  );
}

Widget customSocialMediaButton({@required String? icon, @required Function()? onTap}) {
  return InkWell(
    onTap: onTap ?? () {},
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: gray_3),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Image.asset(
        icon ?? '',
      ),
    ),
  );
}
