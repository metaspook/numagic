import 'package:flutter/material.dart';
import 'package:numagic/widgets/custom_divider.dart';

void showDialogX(
    {String? title,
    String? image,
    String? name,
    required num size,
    required BuildContext context}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.black, width: 5),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child:
            AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                // elevation: 15,
                backgroundColor:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.75),
                title: Column(
                  children: [
                    Text(
                      title != null ? title : "",
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    CustomDivider(),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (image != null)
                      Image.asset(
                        image,
                        // fit: BoxFit.scaleDown,
                        // height: 150,
                        // width: 150,
                      ),
                    Text(
                      name != null ? name : "",
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                actions: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('OK', style: TextStyle(fontSize: 18)),
                ),
              ),
            ]
                // ),
                );
      });
}
