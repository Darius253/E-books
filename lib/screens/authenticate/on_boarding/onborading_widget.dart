import 'package:flutter/material.dart';
import '../../../shared/exports.dart';

Widget onboarding(
  BuildContext context,
  String title,
  String subtitle,
  String image,
  Color color,
  Color textColor,
  Color nextColor,
  Color titleColor,
  Function()? onTap,
  Function()? skip,
  bool? lastIndex,
) {
  return Container(
    color: color,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32)),
          ),
          child: Center(
            child: SvgPicture.asset(
              image,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: textColor,
                ),
                // textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              lastIndex == true
                  ? GetStartedButton(
                      onPressed: () => Get.to(() => const SelectSignUp()))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: skip,
                          child: Container(
                            width: 150,
                            height: 65,
                            decoration: BoxDecoration(
                              color: color,
                              border: Border.all(color: textColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: onTap,
                          child: Container(
                            width: 150,
                            height: 65,
                            decoration: BoxDecoration(
                              color: textColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  color: nextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ],
    ),
  );
}
