import 'package:app_wisata/classes/data_wisata.dart';
import 'package:app_wisata/classes/hero_type.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final DataWisata dataWisata;

  const Detail({Key key, this .dataWisata}):super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  DataWisata _dataWisata;
  double _screenwidth;

  @override
  void initState() {
    _dataWisata = widget.dataWisata;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _screenwidth = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_dataWisata.title),
        backgroundColor: _dataWisata.materialColor,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'bg' + _dataWisata.title,
              child: Container(
                color: _dataWisata.materialColor,
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Hero(
                tag: 'img' + _dataWisata.title,
                child: Image.asset(_dataWisata.image,
                  fit: BoxFit.fitWidth,
                  height: 230,
                ),
              ),
            ),
            Positioned(
              top: 260,
              left: 32,
              width: _screenwidth - 64.0,
              child: Hero(
                tag: 'title' + _dataWisata.title,
                child: Material(
                  color: Colors.transparent,
                  child: Text(_dataWisata.title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 280,
              left: 32,
              width: _screenwidth - 64.0,
              child: Hero(
                tag: 'subtitle' + _dataWisata.subtitle,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                      _dataWisata.subtitle),
                ),
              ),
            )
          ],
        ),),
    );
  }
}
