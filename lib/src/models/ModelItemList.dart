class ModelItemList {
   String label;
   String descLabel;
   double value;

  ModelItemList.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        descLabel = json['desc'],
        value = json['value'];
}
