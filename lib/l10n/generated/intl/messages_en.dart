// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(status, details) => "Status: ${status}; Details: ${details}";

  static m1(number) => "Task ${number}";

  static m2(number) => "Task detailed description ${number}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appTitle" : MessageLookupByLibrary.simpleMessage("This is the OAuth Client Demo"),
    "authenticationFailed" : MessageLookupByLibrary.simpleMessage("Authentication Failed"),
    "complete" : MessageLookupByLibrary.simpleMessage("Complete: "),
    "dueDate" : MessageLookupByLibrary.simpleMessage("Due Date: "),
    "errorGettingTaskData" : MessageLookupByLibrary.simpleMessage("Unable to get taks data from server"),
    "errorTaskStatus" : m0,
    "noAddTask" : MessageLookupByLibrary.simpleMessage("Unable to add new task"),
    "noAuthUrl" : MessageLookupByLibrary.simpleMessage("Unable to launch authentication url"),
    "noClientId" : MessageLookupByLibrary.simpleMessage("Error getting client ID from host"),
    "noIdToken" : MessageLookupByLibrary.simpleMessage("No ID Token received from host"),
    "noTasks" : MessageLookupByLibrary.simpleMessage("No Tasks"),
    "noTokenData" : MessageLookupByLibrary.simpleMessage("Error getting token data"),
    "percent" : MessageLookupByLibrary.simpleMessage("%"),
    "priority" : MessageLookupByLibrary.simpleMessage("Priority: "),
    "signinWithApple" : MessageLookupByLibrary.simpleMessage("Signin with Apple"),
    "signinWithFacebook" : MessageLookupByLibrary.simpleMessage("Signin with Facebook"),
    "signinWithGithub" : MessageLookupByLibrary.simpleMessage("Signin with Github"),
    "signinWithGoogle" : MessageLookupByLibrary.simpleMessage("Signin with Google"),
    "startDate" : MessageLookupByLibrary.simpleMessage("Start Date: "),
    "task" : m1,
    "taskDetail" : m2,
    "tasks" : MessageLookupByLibrary.simpleMessage("Tasks"),
    "timeoutAuthServer" : MessageLookupByLibrary.simpleMessage("Timeout attempting to connect to authentication server"),
    "timeoutTokenWait" : MessageLookupByLibrary.simpleMessage("Timeout waiting for token"),
    "unknownReason" : MessageLookupByLibrary.simpleMessage("Unknown reason")
  };
}
