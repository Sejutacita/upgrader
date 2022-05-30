import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class MyUpgradeAlert extends StatelessWidget {
  const MyUpgradeAlert({
    Key? key,
    required this.langCode,
    this.child,
    this.customMessageData,
    this.onUpdate,
  }) : super(key: key);

  final String langCode;
  final Widget? child;
  final Map<String, dynamic>? customMessageData;
  final bool Function()? onUpdate;

  @override
  Widget build(BuildContext context) {
    const appcastURL =
        'https://raw.githubusercontent.com/Sejutacita/versioning-app/main/version.xml';

    final cfg = AppcastConfiguration(
      url: appcastURL,
      supportedOS: ['android', 'ios'],
    );

    return UpgradeAlert(
      upgrader: Upgrader(
        appcastConfig: cfg,
        debugLogging: true,
        onUpdate: onUpdate,
        messages: customMessageData != null
            ? MyCustomMessages(
                langcode: langCode,
                customMessage: customMessageData!,
              )
            : null,
      ),
      child: child,
    );
  }
}
