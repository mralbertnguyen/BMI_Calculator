class ModelItemList {
  final String label;
  final String descLabel;
  final String value;

  ModelItemList.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        descLabel = json['desc'],
        value = json['value'];
}
