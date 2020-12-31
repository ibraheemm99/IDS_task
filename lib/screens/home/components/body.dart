import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ids_task/models/deal.dart';
import 'package:ids_task/models/good_type.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<GoodTypes> typesList;
  List<Deal> dealsList;

  @override
  void initState() {
    super.initState();
    typesList = [];
    dealsList = [];
    getTypes();
    getDeals();
  }

  void getTypes() {
    typesList.clear();
    typesList.add(GoodTypes('Frozen',
        'https://image.freepik.com/free-photo/delicious-ice-cream_144627-19516.jpg'));
    typesList.add(GoodTypes('Grocery',
        'https://www.rachaelraymag.com/.image/t_share/MTYzOTY0NTAxODQwODk3NzYx/global-grocery-items-counter-ad0653ad.jpg'));
    typesList.add(GoodTypes('Fruit & Vegetable',
        'https://image.freepik.com/free-photo/fruits-vegetables_1112-314.jpg'));
    typesList.add(GoodTypes('Cheese & Delicatessen',
        'https://image.freepik.com/free-photo/flat-lay-mix-gourmet-cheese-grapes-cutting-board-with-honey_23-2148376124.jpg'));
    typesList.add(GoodTypes('Juices',
        'https://image.freepik.com/free-vector/various-drinks-metallic-cans-plastic-bottles_74855-7909.jpg'));
  }

  void getDeals() {
    dealsList.clear();
    dealsList.add(Deal(
        'Camira Canon EOS 2000D',
        'https://image.freepik.com/free-photo/chocolate-ice-cream-dessert_144627-8363.jpg',
        649.95,
        599,
        3.5,
        2000,
        40));
    dealsList.add(Deal(
        'Banana',
        'https://image.freepik.com/free-vector/vector-ripe-yellow-banana-bunch-isolated-white-background_1284-45456.jpg',
        3,
        2.49,
        4.2,
        100,
        50));
    dealsList.add(Deal(
        'Apples red fresh',
        'https://image.freepik.com/free-photo/apples-red-fresh-mellow-juicy-perfect-whole-white-desk_179666-271.jpg',
        4,
        1.99,
        4.0,
        100,
        90));
    dealsList.add(Deal(
        'Natural Orange juice',
        'https://image.freepik.com/free-vector/natural-juice-ad_52683-8496.jpg',
        10,
        8.49,
        4.5,
        100,
        20));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        mainPicture(context, size),
        SizedBox(
          height: 10,
        ),
        seeAllTypesButton(context),
        SizedBox(
          height: 8,
        ),
        goodsMainTypesList(context, size),
        SizedBox(
          height: 10,
        ),
        dealsWithSeeAll(context),
        SizedBox(
          height: 4,
        ),
        gridOfDeals(context, size),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget mainPicture(context, Size size) {
    return Card(
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: getImageNetwork(
        context,
        false,
        size.width,
        'https://image.freepik.com/free-vector/banner-online-offline-system_107791-2042.jpg',
      ),
    );
  }

  Widget seeAllTypesButton(context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "SEE ALL",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.purple),
        ),
      ),
    );
  }

  Widget goodsMainTypesList(context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 122,
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          // physics: ClampingScrollPhysics(),
          itemCount: typesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: getImageNetwork(
                      context, true, 80, typesList[index].imageUrl),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  typesList[index].name,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 20,
            );
          },
        ),
      ),
    );
  }

  Widget dealsWithSeeAll(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Deals',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.blue[900]),
          ),
          Text(
            "SEE ALL",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.purple),
          )
        ],
      ),
    );
  }

  Widget gridOfDeals(context, Size size) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      crossAxisCount: 2,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: dealsList.length,
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 8,
                shadowColor: Colors.black45,
                color: Colors.white,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                margin: EdgeInsets.zero,
                child: Container(
                  height: size.height * 0.3,
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      getImageNetwork(
                          context, true, size.width, dealsList[index].imageUrl),
                      Positioned(
                        top: 0,
                        left: 20,
                        child: Container(
                          height: 40,
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              Image.asset('assets/images/offer.png'),
                              Positioned(
                                  top: 2,
                                  right: 0,
                                  left: 0,
                                  child: Text(
                                    'OFF\n%' +
                                        dealsList[index].discount.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 10),
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${dealsList[index].name}',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${dealsList[index].prevPrice % dealsList[index].prevPrice.toInt() != 0 ? dealsList[index].prevPrice : dealsList[index].prevPrice.toInt()} Jd',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w800,
                                decorationThickness: 3,
                                color: Colors.blue[900],
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w800),
                                  children: [
                                    TextSpan(
                                        text:
                                            '${dealsList[index].newPrice % dealsList[index].newPrice.toInt() != 0 ? dealsList[index].newPrice : dealsList[index].newPrice.toInt()}',
                                        style: TextStyle(fontSize: 18)),
                                    TextSpan(
                                      text: ' Jd / ....',
                                    ),
                                  ]),
                            ),
                            Text(
                              '${dealsList[index].soldCount} Sold',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.menu_rounded,
                              color: Colors.blue[900],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${dealsList[index].rate}',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.grey[600],
                                  size: 16,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: OutlineButton(
                  padding: EdgeInsets.all(8),
                  borderSide: BorderSide(
                      color: Colors.red, width: 2, style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 4,
              )
            ],
          ),
        );
      },
    );
  }
}

Widget getImageNetwork(context, bool t, double width, String url) {
  return Image.network(
    url,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      return loadingProgress == null
          ? child
          : Center(
              child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircularProgressIndicator(),
            ));
    },
    width: width,
    height: t ? width : null,
    errorBuilder: (context, error, stackTrace) {
      return Image.asset(
        'assets/images/error.jpg',
        fit: BoxFit.cover,
        width: width,
        height: t ? width : null,
      );
    },
  );
}
