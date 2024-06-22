import 'package:FaunaRojaCu/components/settings_controller.dart';
import 'package:FaunaRojaCu/screens/especie/view/especie_screen.dart';
import 'package:FaunaRojaCu/screens/favorito/view/favorito_screen.dart';
import 'package:FaunaRojaCu/screens/programa/view/programa_screen.dart';
import 'package:flutter/material.dart';
import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/screens/home/view/appbar.dart';
import 'package:FaunaRojaCu/screens/menu/menu.dart';
import 'package:FaunaRojaCu/db/db_helper.dart';

class Home extends StatefulWidget {
  final SettingsController settingsController;
  const Home({super.key, required this.settingsController});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final _title = ['Especies', 'Programas', 'Favoritos'];
  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    widget.settingsController.loadSettings();
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
      //menu
      drawer: MenuApp(settingsController: widget.settingsController),
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
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
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

              const SizedBox(
                height: 30,
              ),

              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  ListaEspecie(settingsController: widget.settingsController),
                  ListaPrograma(settingsController: widget.settingsController),
                  ListaFavorito(settingsController: widget.settingsController),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
