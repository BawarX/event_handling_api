class UserModel{
  int id;
  String title;

  UserModel({required this.id, required this.title});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], title: json['title'],);
  
}
}