import '../upgrader.dart';

class MyCustomMessages extends UpgraderMessages {
  MyCustomMessages({
    required this.langcode,
    this.customMessage = const {},
  });

  final String langcode;
  final Map<String, dynamic> customMessage;

  /// Override the message function to provide custom language localization.
  @override
  String? message(UpgraderMessage messageKey) {
    if (customMessage.isNotEmpty) {
      switch (messageKey) {
        case UpgraderMessage.body:
          return customMessage[langcode]['body'];
        case UpgraderMessage.buttonTitleIgnore:
          return customMessage[langcode]['button_title_ignore'];
        case UpgraderMessage.buttonTitleLater:
          return customMessage[langcode]['button_title_later'];
        case UpgraderMessage.buttonTitleUpdate:
          return customMessage[langcode]['button_title_update'];
        case UpgraderMessage.prompt:
          return customMessage[langcode]['prompt'];
        case UpgraderMessage.title:
          return customMessage[langcode]['title'];
        case UpgraderMessage.releaseNotes:
          return '';
      }
    }
    return super.message(messageKey);
  }
}
