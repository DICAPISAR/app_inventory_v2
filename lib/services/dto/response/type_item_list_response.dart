class TypeItemListResponse {
  final List<TypeItem> typeItemList;

  TypeItemListResponse({
    required this.typeItemList,
  });

  factory TypeItemListResponse.fromJson(List<Map<String, dynamic>> json) {
    List<TypeItem> typeItemList = [];

    for (var element in json) {
      typeItemList.add(TypeItem.fromJson(element));
    }

    return TypeItemListResponse(typeItemList: typeItemList);
  }
}

class TypeItem {
  final int id;
  final String name;
  final DateTime creationDate;
  final DateTime updateDate;
  final int creator;
  final int updater;
  final bool active;
  final bool perishable;

  TypeItem({
    required this.id,
    required this.name,
    required this.creationDate,
    required this.updateDate,
    required this.creator,
    required this.updater,
    required this.active,
    required this.perishable,
  });

  factory TypeItem.fromJson(Map<String, dynamic> json) {
    return TypeItem(
      id: json['id'],
      name: json['name'],
      creationDate: DateTime.parse(json['creationDate']),
      updateDate: DateTime.parse(json['updateDate']),
      creator: json['creator'],
      updater: json['updater'],
      active: json['active'],
      perishable: json['perishable'],
    );
  }
}
