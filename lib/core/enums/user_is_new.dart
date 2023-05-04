enum UserAccountType {
  newuser('newuser'),
  returninguser('returninguser'),
  erroroccoured('error');

  final String type;
  const UserAccountType(this.type);
}
