import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/common_sizes.dart';

showErrorDialog({required BuildContext context, String? errorMessage}) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "OOPS",
            style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: CommonSizes.size25),
          ),
          content: Text(
            errorMessage ?? 'Somethings Occurs !!',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.redAccent, fontSize: CommonSizes.size15),
          ),
          icon: Image.asset("assets/error.png"),
        );
      });
}
