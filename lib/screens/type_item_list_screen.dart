import 'dart:convert';

import 'package:app_inventory/models/models.dart';
import 'package:app_inventory/services/constans.dart';
import 'package:app_inventory/services/dto/response/type_item_list_response.dart';
import 'package:app_inventory/services/external/api_call_service.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:app_inventory/widgets/custom_input_field.dart';
import 'package:app_inventory/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TypeItemListScreen extends StatefulWidget {
  const TypeItemListScreen({Key? key}) : super(key: key);

  @override
  State<TypeItemListScreen> createState() => _TypeItemListScreenState();
}

class _TypeItemListScreenState extends State<TypeItemListScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final Map<String, String> formValues = {
    'buscar': '',
  };

  @override
  Widget build(BuildContext context) {
    final ListScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ListScreenArguments;

    var size = MediaQuery.of(context).size;
    var width = size.width;

    return FutureBuilder(
        future: _getItemDetail(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Text("loading");
          }
          return _Scaffold(
              keydata: _key,
              args: args,
              width: width,
              formValues: formValues,
              listItemDetail: snapshot.data);
        });
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    Key? key,
    required GlobalKey<ScaffoldState> keydata,
    required this.args,
    required this.width,
    required this.formValues,
    required this.listItemDetail,
  })  : _key = keydata,
        super(key: key);

  final GlobalKey<ScaffoldState> _key;
  final ListScreenArguments args;
  final double width;
  final Map<String, String> formValues;
  final List<ItemDetail> listItemDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: const Drawer(),
      appBar: AppBar(
        title: Text(args.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 5),
                  width: width * 0.6,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    child: CustomInputField(
                      formProperty: 'Buscar',
                      formValues: formValues,
                      prefixIcon: Icons.search,
                      labelText: 'Buscar',
                      hintText: 'Buscar',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _key.currentState!.openEndDrawer();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 20),
                    width: width * 0.25,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      child: Text(
                        'Filtrar',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListItem(itemDetail: listItemDetail, screenNameRoute: 'form'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(
          Icons.add_outlined,
          size: 50,
        ),
      ),
    );
  }
}

Future<List<ItemDetail>> _getItemDetail() async {
  TypeItemListResponse? itemListResponse = await _getTypeItemsList("true");

  List<ItemDetail> itemDetailList = [];

  if (itemListResponse == null) {
    return itemDetailList;
  }

  for (var typeItem in itemListResponse.typeItemList) {
    String perishableData = "Perishable: ${typeItem.perishable}";
    List<String> details = [perishableData, "", ""];

    AdviseItemLIst advise = AdviseItemLIst("", Colors.white10);

    DateTime today = DateTime.now();
    if (typeItem.creationDate.difference(today).inDays < 1) {
      advise = AdviseItemLIst("Nuevo", Colors.green);
    }

    ItemDetail item = ItemDetail(typeItem.id, typeItem.name,
        "Id: ${typeItem.id.toString()}", details, advise);

    itemDetailList.add(item);
  }

  return itemDetailList;
}

Future<TypeItemListResponse?> _getTypeItemsList(String typeStatus) async {
  Map<String, dynamic> queryParameters = {"typeStatus": typeStatus};

  Uri uri =
      Uri.http(Constants.urlBase, Constants.urlTypeItemList, queryParameters);

  Response response = await ApiService.get(uri);

  if (response.statusCode != 200) {
    return null;
  }

  var decodeResponse = ApiService.decodeResponse(response);

  List<dynamic> decodeParsed = jsonDecode(decodeResponse) as List<dynamic>;

  List<Map<String, dynamic>> decodeParsed2 = [];

  for (var element in decodeParsed) {
    decodeParsed2.add(element as Map<String, dynamic>);
  }

  TypeItemListResponse typeItemListResponse =
      TypeItemListResponse.fromJson(decodeParsed2);

  return typeItemListResponse;
}
