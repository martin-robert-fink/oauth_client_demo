// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static m0(status, details) => "${details} تفاصيل: ${status} حالة:";

  static m1(number) => "${number} مهمة";

  static m2(number) => "${number} وصف تفصيلي للمهمة";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appTitle" : MessageLookupByLibrary.simpleMessage("هذا عرض تجريبي لعميل OAuth"),
    "authenticationFailed" : MessageLookupByLibrary.simpleMessage("المصادقة فشلت"),
    "complete" : MessageLookupByLibrary.simpleMessage("לְהַשְׁלִים: "),
    "dueDate" : MessageLookupByLibrary.simpleMessage("תאריך להגשה: "),
    "errorGettingTaskData" : MessageLookupByLibrary.simpleMessage("تعذر الحصول على بيانات المهمة من الخادم"),
    "errorTaskStatus" : m0,
    "noAddTask" : MessageLookupByLibrary.simpleMessage("غير قادر على إضافة مهمة جديدة"),
    "noAuthUrl" : MessageLookupByLibrary.simpleMessage("غير قادر على إطلاق رابط التوثيق"),
    "noClientId" : MessageLookupByLibrary.simpleMessage("خطأ في الحصول على معرّف العميل من المضيف"),
    "noIdToken" : MessageLookupByLibrary.simpleMessage("لم يتم استلام رمز معرف من المضيف"),
    "noTasks" : MessageLookupByLibrary.simpleMessage("لا توجد مهام"),
    "noTokenData" : MessageLookupByLibrary.simpleMessage("خطأ في الحصول على بيانات الرمز المميز"),
    "percent" : MessageLookupByLibrary.simpleMessage("%"),
    "priority" : MessageLookupByLibrary.simpleMessage("עדיפות: "),
    "signinWithApple" : MessageLookupByLibrary.simpleMessage("تسجيل الدخول مع أبل"),
    "signinWithFacebook" : MessageLookupByLibrary.simpleMessage("قم بتسجيل الدخول باستخدام الفيسبوك"),
    "signinWithGithub" : MessageLookupByLibrary.simpleMessage("تسجيل الدخول مع جيثب"),
    "signinWithGoogle" : MessageLookupByLibrary.simpleMessage("تسجيل الدخول مع جوجل"),
    "startDate" : MessageLookupByLibrary.simpleMessage("תאריך התחלה: "),
    "task" : m1,
    "taskDetail" : m2,
    "tasks" : MessageLookupByLibrary.simpleMessage("مهام"),
    "timeoutAuthServer" : MessageLookupByLibrary.simpleMessage("مهلة محاولة الاتصال بخادم المصادقة"),
    "timeoutTokenWait" : MessageLookupByLibrary.simpleMessage("مهلة انتظار الرمز المميز"),
    "unknownReason" : MessageLookupByLibrary.simpleMessage("سبب غير معلوم")
  };
}
