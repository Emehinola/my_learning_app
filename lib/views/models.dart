class User {
  int index;
  String name;

  User({this.index, this.name});

  User.copy(User newUser)
      : this.index = newUser.index,
        this.name = newUser.name;
}
