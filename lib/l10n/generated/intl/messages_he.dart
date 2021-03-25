// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a he locale. All the
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
  String get localeName => 'he';

  static m0(status, details) => "${details} פרטים: ;${status} סטָטוּס:";

  static m1(number) => "${number} מְשִׁימָה";

  static m2(number) => "${number} תיאור מפורט של המשימה";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appTitle" : MessageLookupByLibrary.simpleMessage("זו הדגמת לקוח של OAuth"),
    "authenticationFailed" : MessageLookupByLibrary.simpleMessage("אימות נכשל"),
    "complete" : MessageLookupByLibrary.simpleMessage("לְהַשְׁלִים: "),
    "dueDate" : MessageLookupByLibrary.simpleMessage("תאריך להגשה: "),
    "errorGettingTaskData" : MessageLookupByLibrary.simpleMessage("אין משימות"),
    "errorTaskStatus" : m0,
    "noAddTask" : MessageLookupByLibrary.simpleMessage("לא ניתן להוסיף משימה חדשה"),
    "noAuthUrl" : MessageLookupByLibrary.simpleMessage("לא ניתן להפעיל את כתובת האתר לאימות"),
    "noClientId" : MessageLookupByLibrary.simpleMessage("שגיאה בקבלת מזהה הלקוח מהמארח"),
    "noIdToken" : MessageLookupByLibrary.simpleMessage("לא התקבל אסימון מזהה מהמארח"),
    "noTasks" : MessageLookupByLibrary.simpleMessage("אין משימות"),
    "noTokenData" : MessageLookupByLibrary.simpleMessage("שגיאה בקבלת נתוני אסימון"),
    "percent" : MessageLookupByLibrary.simpleMessage("%"),
    "priority" : MessageLookupByLibrary.simpleMessage("עדיפות: "),
    "signinWithApple" : MessageLookupByLibrary.simpleMessage("היכנס עם אפל"),
    "signinWithFacebook" : MessageLookupByLibrary.simpleMessage("היכנס באמצעות פייסבוק"),
    "signinWithGithub" : MessageLookupByLibrary.simpleMessage("היכנס באמצעות Github"),
    "signinWithGoogle" : MessageLookupByLibrary.simpleMessage("היכנס באמצעות Google"),
    "startDate" : MessageLookupByLibrary.simpleMessage("תאריך התחלה: "),
    "task" : m1,
    "taskDetail" : m2,
    "tasks" : MessageLookupByLibrary.simpleMessage("משימות"),
    "timeoutAuthServer" : MessageLookupByLibrary.simpleMessage("פסק זמן מנסה להתחבר לשרת אימות"),
    "timeoutTokenWait" : MessageLookupByLibrary.simpleMessage("פסק זמן מחכה לאסימון"),
    "unknownReason" : MessageLookupByLibrary.simpleMessage("סיבה לא ידועה")
  };
}
