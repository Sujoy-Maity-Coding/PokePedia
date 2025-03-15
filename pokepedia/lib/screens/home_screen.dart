import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokepedia/screens/poke_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pokepedia = [];
  var pokepediaApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark theme for contrast
      appBar: AppBar(
        title: Text("Poke`pedia", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.redAccent, // Pokémon red
      ),
      body: Column(
        children: [
          Expanded(
            child: pokepedia.isNotEmpty
                ? GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: pokepedia.length,
              itemBuilder: (context, index) {
                var pokemon = pokepedia[index];
                var type = pokemon['type'][0]; // Fixed Type Access

                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => PokeDetail(tag: index, pokeDetails: pokepedia[index],
                        color: type=='Grass'?Colors.greenAccent:
                        type=='Fire'?Colors.redAccent:
                        type=='Poison'?Colors.blueAccent:
                        type=='Water'?Colors.lightBlueAccent:
                        type=='Flying'?Colors.yellowAccent:
                        type=='Bug'?Colors.orangeAccent:
                        type=='Normal'?Colors.pinkAccent:
                        type=='Ground'?Colors.tealAccent:
                        Colors.grey)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: type=='Grass'?Colors.greenAccent:
                      type=='Fire'?Colors.redAccent:
                      type=='Poison'?Colors.blueAccent:
                      type=='Water'?Colors.lightBlueAccent:
                      type=='Flying'?Colors.yellowAccent:
                      type=='Bug'?Colors.orangeAccent:
                      type=='Normal'?Colors.pinkAccent:
                      type=='Ground'?Colors.tealAccent:
                          Colors.grey
                      ,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                        bottom: -5,
                        right: -5,
                        child: Image.asset('assets/images/pokeball.png', height: 100,fit: BoxFit.fill,color: Colors.grey[100],)),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: CachedNetworkImage(
                            imageUrl: pokemon['img'],
                            height: 80,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          left: 10,
                          child: Text(
                            pokemon['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white30
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                type,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  void fetchData() async {
    var url = Uri.parse(pokepediaApi);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      setState(() {
        pokepedia = decodeData["pokemon"];
      });
    }
  }
}
