import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/feature/chatbot_feature.dart';
import '../screen/feature/translator_feature.dart';

enum HomeType { aiChatBot, aiTranslator }

extension MyHomeType on HomeType {
  // title
  String get title {
    if (this == HomeType.aiChatBot) {
      return 'Nerd AI';
    } else if (this == HomeType.aiTranslator) {
      return 'Language Translator';
    } else {
      return '';
    }
  }

  // lottie
  String get lottie {
    if (this == HomeType.aiChatBot) {
      return 'ai_hand_waving.json';
    } else if (this == HomeType.aiTranslator) {
      return 'ai_ask_me.json';
    } else {
      return '';
    }
  }

  // for alignment
  bool get leftAlign {
    if (this == HomeType.aiChatBot) {
      return true;
    } else if (this == HomeType.aiTranslator) {
      return true;
    } else {
      return false;
    }
  }

  // for padding
  EdgeInsets get padding {
    if (this == HomeType.aiChatBot) {
      return EdgeInsets.zero;
    } else if (this == HomeType.aiTranslator) {
      return EdgeInsets.zero;
    } else {
      return EdgeInsets.zero;
    }
  }

  // for navigation
  VoidCallback get onTap {
    if (this == HomeType.aiChatBot) {
      return () => Get.to(() => const ChatBotFeature());
    } else if (this == HomeType.aiTranslator) {
      return () => Get.to(() => const TranslatorFeature());
    } else {
      return () {};
    }
  }
}
