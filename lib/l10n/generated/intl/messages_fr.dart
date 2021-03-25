// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  static m0(status, details) => "Status: ${status}; Details: ${details}";

  static m1(number) => "Tache ${number}";

  static m2(number) => "Description détaillée de la tâche ${number}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appTitle" : MessageLookupByLibrary.simpleMessage("La démonstration du client OAuth"),
    "authenticationFailed" : MessageLookupByLibrary.simpleMessage("L\'authentification a échoué"),
    "complete" : MessageLookupByLibrary.simpleMessage("Compléter: "),
    "dueDate" : MessageLookupByLibrary.simpleMessage("Date d\'échéance: "),
    "errorGettingTaskData" : MessageLookupByLibrary.simpleMessage("Impossible d\'obtenir les données de tâche du serveur"),
    "errorTaskStatus" : m0,
    "noAddTask" : MessageLookupByLibrary.simpleMessage("Impossible d\'ajouter une nouvelle tâche"),
    "noAuthUrl" : MessageLookupByLibrary.simpleMessage("Impossible de lancer l\'URL d\'authentification"),
    "noClientId" : MessageLookupByLibrary.simpleMessage("Erreur lors de l\'obtention de l\'ID client du serveur"),
    "noIdToken" : MessageLookupByLibrary.simpleMessage("Aucun jeton d\'identification reçu du serveur"),
    "noTasks" : MessageLookupByLibrary.simpleMessage("Aucune tâche"),
    "noTokenData" : MessageLookupByLibrary.simpleMessage("Erreur lors de l\'obtention des données de jeton"),
    "percent" : MessageLookupByLibrary.simpleMessage("%"),
    "priority" : MessageLookupByLibrary.simpleMessage("Priorité: "),
    "signinWithApple" : MessageLookupByLibrary.simpleMessage("Connectez-vous avec Apple"),
    "signinWithFacebook" : MessageLookupByLibrary.simpleMessage("Connectez-vous avec Facebook"),
    "signinWithGithub" : MessageLookupByLibrary.simpleMessage("Connectez-vous avec Github"),
    "signinWithGoogle" : MessageLookupByLibrary.simpleMessage("Connectez-vous avec Google"),
    "startDate" : MessageLookupByLibrary.simpleMessage("Date de début: "),
    "task" : m1,
    "taskDetail" : m2,
    "tasks" : MessageLookupByLibrary.simpleMessage("Tâches"),
    "timeoutAuthServer" : MessageLookupByLibrary.simpleMessage("Délai d\'attente de la tentative de connexion au serveur d\'authentification"),
    "timeoutTokenWait" : MessageLookupByLibrary.simpleMessage("Délai d\'attente de la tentative de connexion au serveur d\'authentification"),
    "unknownReason" : MessageLookupByLibrary.simpleMessage("Raison inconnue")
  };
}
