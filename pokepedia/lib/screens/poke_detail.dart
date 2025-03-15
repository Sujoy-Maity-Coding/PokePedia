import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokeDetail extends StatefulWidget {
  final tag;
  final pokeDetails;
  final Color color;
  const PokeDetail({super.key, required this.tag, required this.pokeDetails, required this.color});

  @override
  State<PokeDetail> createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
          top: 30,
          left: 10,
          child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.white,))),
          Positioned(
              top: 120,
              right: -30,
              child: Image.asset('assets/images/pokeball.png', height: 250,fit: BoxFit.fill,color: Colors.grey[100],)),
          Positioned(
            top: 90,
            left: (width/2)-100,
            child: CachedNetworkImage(
              imageUrl: widget.pokeDetails['img'],
              height: 200,
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  CircularProgressIndicator(),
            ),
          ),
          Positioned(
            top: 70,
            left: 10,
            child: Text(
              widget.pokeDetails['name'],
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white30
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.pokeDetails['type'].join(', '),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: width,
          height: height*0.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(width: width*0.3,child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),)),
                      Text(widget.pokeDetails['name'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),)
                    ],
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(width: width*0.3,child: Text("Height", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),)),
                        Text(widget.pokeDetails['height'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(width: width*0.3,child: Text("Weight", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),)),
                        Text(widget.pokeDetails['weight'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(width: width*0.3,child: Text("Spawn Time", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),)),
                        Text(widget.pokeDetails['spawn_time'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(width: width*0.3,child: Text("weakness", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),)),
                        Text(widget.pokeDetails['weaknesses'].join(', '), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),)
                      ],
                    ),
                  )],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
