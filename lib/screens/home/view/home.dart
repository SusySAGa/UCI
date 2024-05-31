import 'package:FaunaRojaCu/screens/especie/view/especie_screen.dart';
import 'package:FaunaRojaCu/screens/favorito/view/favorito_screen.dart';
import 'package:FaunaRojaCu/screens/programa/view/programa_screen.dart';
import 'package:flutter/material.dart';
import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/screens/home/view/appbar.dart';
import 'package:FaunaRojaCu/screens/home/view/searchbar.dart';
import 'package:FaunaRojaCu/screens/menu/menu.dart';
import 'package:FaunaRojaCu/db/db_helper.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _title = ['Especies', 'Programas', 'Favoritos'];
  DbHelper dbHelper = new DbHelper();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //menu
      drawer: const MenuApp(),
      //appbar
      appBar: Appbar(
        newtitle: _title[_tabController.index],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            children: [
              //tabBar
              TabBar(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                controller: _tabController,
                tabs: const [
                  Tab(
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    icon: Icon(Icons.edit_document),
                  ),
                  Tab(
                    icon: Icon(Icons.favorite),
                  ),
                ],
                unselectedLabelColor: selectedColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedColor,
                ),
                labelColor: unselectedColor,
                indicatorColor: selectedColor,
              ),

              //barra de busqueda
              const SearchBarApp(),

              SizedBox(
                height: 30,
              ),

              Expanded(
                child: TabBarView(controller: _tabController, children: const [
                  ListaEspecie(),
                  ListaPrograma(),
                  ListaFavorito(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
