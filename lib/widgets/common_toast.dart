import 'package:fluttertoast/fluttertoast.dart';

/// A function we can call to easily trigger the same style of toast.
void commonToast(message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: 2,
  );
}
