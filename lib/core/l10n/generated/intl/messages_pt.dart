// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  static String m0(language) =>
      "Tem certeza que deseja alterar o idioma para ${language}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addToList": MessageLookupByLibrary.simpleMessage("Adicionar à lista"),
        "author": MessageLookupByLibrary.simpleMessage("Autor"),
        "comment":
            MessageLookupByLibrary.simpleMessage("Número de comentários"),
        "delete": MessageLookupByLibrary.simpleMessage("Deletar"),
        "edid": MessageLookupByLibrary.simpleMessage("Editar"),
        "editing": MessageLookupByLibrary.simpleMessage("Edição"),
        "english": MessageLookupByLibrary.simpleMessage("Inglês"),
        "error": MessageLookupByLibrary.simpleMessage("Erro"),
        "home": MessageLookupByLibrary.simpleMessage("Início"),
        "no": MessageLookupByLibrary.simpleMessage("Não"),
        "options": MessageLookupByLibrary.simpleMessage("Opções"),
        "portuguese": MessageLookupByLibrary.simpleMessage("Português"),
        "selectYourLanguage":
            MessageLookupByLibrary.simpleMessage("Selecione seu idioma"),
        "setLanguageConfimation": m0,
        "settings": MessageLookupByLibrary.simpleMessage("Configurações"),
        "takePicture": MessageLookupByLibrary.simpleMessage("Tirar foto"),
        "title": MessageLookupByLibrary.simpleMessage("Título"),
        "ups": MessageLookupByLibrary.simpleMessage("Número de ups"),
        "yes": MessageLookupByLibrary.simpleMessage("Sim"),
        "yourFeed": MessageLookupByLibrary.simpleMessage("Sua lista")
      };
}
