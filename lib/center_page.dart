import 'package:flutter/material.dart';

import 'cart.dart';
import 'dish_page.dart';
import 'package:foodie_app/constants.dart';

class CenterPage extends StatefulWidget {
  CenterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CenterPageState createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  List<Dish> _dishes = List<Dish>();

  List<Dish> _cartList = List<Dish>();

  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Foodie',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                  ),
                ),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                title: Text(
                  'Orders',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.login_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: kSecondaryColor,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 36.0,
                    ),
                    if (_cartList.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            _cartList.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  if (_cartList.isNotEmpty)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Cart(_cartList),
                      ),
                    );
                },
              ),
            )
          ],
        ),
        body: _buildGridView(),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: _dishes.length,
      itemBuilder: (context, index) {
        var item = _dishes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          child: Card(
            elevation: 4.0,
            child: ListTile(
              leading: Icon(
                item.icon,
                color: item.color,
              ),
              title: Text(item.name),
              trailing: GestureDetector(
                child: (!_cartList.contains(item))
                    ? Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                onTap: () {
                  setState(() {
                    if (!_cartList.contains(item))
                      _cartList.add(item);
                    else
                      _cartList.remove(item);
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          var item = _dishes[index];
          return Card(
              elevation: 4.0,
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        color: (_cartList.contains(item))
                            ? Colors.grey
                            : item.color,
                        size: 100.0,
                      ),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subhead,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: (!_cartList.contains(item))
                            ? Icon(
                                Icons.add_circle,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                        onTap: () {
                          setState(() {
                            if (!_cartList.contains(item))
                              _cartList.add(item);
                            else
                              _cartList.remove(item);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  void _populateDishes() {
    var list = <Dish>[
      Dish(
        name: 'Chicken Zinger',
        icon: Icons.fastfood,
        color: Colors.amber,
      ),
      Dish(
        name: 'Chicken Zinger without chicken',
        icon: Icons.print,
        color: Colors.deepOrange,
      ),
      Dish(
        name: 'Rice',
        icon: Icons.child_care,
        color: Colors.brown,
      ),
      Dish(
        name: 'Beef burger without beef',
        icon: Icons.whatshot,
        color: Colors.green,
      ),
    ];

    setState(() {
      _dishes = list;
    });
  }
}
