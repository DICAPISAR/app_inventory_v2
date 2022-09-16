
import 'models.dart';

class ItemDetail {
  final int id;
  final String title;
  final String subTitle;
  final List<String> details;
  final AdviseItemLIst advise;

  ItemDetail(
    this.id,
    this.title,
    this.subTitle,
    this.details,
    this.advise,
  );
}

class ItemListDetail {
  final String label;

  ItemListDetail(this.label);
}
