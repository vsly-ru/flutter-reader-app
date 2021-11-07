class Work {
  String? title;
  String? category;
  String? genre;
  String? desctiption;
  String? file;
  String? time;
  String? date;

  Work(
      {this.title,
      this.category,
      this.genre,
      this.desctiption,
      this.file,
      this.time,
      this.date});

  Work.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    genre = json['genre'];
    desctiption = json['desctiption'];
    file = json['file'];
    time = json['time'];
    date = json['date'];
  }

  Work.test() {
    title = 'Берегись дерева гинкго';
    category = 'Рассказы';
    genre = 'Проза';
    desctiption =
        'Работа на дому, бредовые сны, странные письма на почте от незнакомца. Такая вот жизнь за границей.';
    file = 'ginkgo.txt';
    time = '15 минут';
    date = '07/11/2021';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['category'] = category;
    data['genre'] = genre;
    data['desctiption'] = desctiption;
    data['file'] = file;
    data['time'] = time;
    data['date'] = date;
    return data;
  }
}
