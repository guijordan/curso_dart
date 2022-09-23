class Posts {
  String? title;
  String? body;
  int? userId;

  Posts({this.title, this.body, this.userId});

  Posts.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['userId'] = this.userId;
    return data;
  }
}
