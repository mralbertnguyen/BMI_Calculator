class ModelItemDiary {
  String day;
  String dateAndMonth;
  double weightValue;
  String unit;
  int indexIc;
  String descNumber;

  ModelItemDiary(
      {this.day,
      this.dateAndMonth,
      this.weightValue,
      this.unit,
      this.indexIc,
      this.descNumber});

  factory ModelItemDiary.fromJson(Map<String, dynamic> json) {
    return ModelItemDiary(
      day: json['day'],
      dateAndMonth: json['dateAndMonth'],
      weightValue: json['weightValue'],
      unit: json['unit'],
      indexIc: json['indexIc'],
      descNumber: json['descNumber'],
    );
  }
}