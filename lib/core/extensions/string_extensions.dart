extension StringExt on String {
  String get obscureEmail {
    // split the email into username and domain
    // final split = this.split('@'); //optional for developer
    final index = indexOf('@');
    var username = substring(0, index);
    final domain = substring(index + 1);

    // return the email with the username and domain obscured
    username = '${username[0]}*****${username.substring(username.length - 1)}';
    return '$username@$domain';
  }
}