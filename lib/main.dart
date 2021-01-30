import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;
  bool isDownPressed = false;
  int counter = 999;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/iteso.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "El ITESO, Universidad Jesuita de Guadalajara",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("San Pedro Tlaquepaque"),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_up,
                      color: isPressed ? Colors.blue : Colors.black,
                    ),
                    onPressed: () {
                      isPressed = !isPressed;
                      if (isDownPressed) isDownPressed = false;
                      counter++;

                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_down,
                      color: isDownPressed ? Colors.red : Colors.black,
                    ),
                    onPressed: () {
                      isDownPressed = !isDownPressed;
                      if (isPressed) isPressed = false;
                      counter--;

                      setState(() {});
                    },
                  ),
                  Text("$counter"),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 64,
                        icon: Icon(
                          Icons.email,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text("Enviando correo..."),
                              ),
                            );
                          setState(() {});
                        },
                      ),
                      Text(
                        "Correo",
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 64,
                        icon: Icon(
                          Icons.add_ic_call,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text("Llamando..."),
                              ),
                            );
                          setState(() {});
                        },
                      ),
                      Text(
                        "Llamada",
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 64,
                        icon: Icon(
                          Icons.directions,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text("Abriendo Google Maps..."),
                              ),
                            );
                          setState(() {});
                        },
                      ),
                      Text(
                        "Ruta",
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Text(
                "El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: FloatingActionButton(
                  onPressed: () {
                    if (counter & 1 == 1) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: Text("Fecha: "),
                            content: Text(formatDate(
                                new DateTime.now().toLocal(),
                                [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn])),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Salir"))
                            ]),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("El contador de likes es par"),
                          content: Text("Puede salir :)"),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Salir"))
                          ],
                        ),
                      );
                    }
                  },
                  backgroundColor: Colors.green,
                  // child: Icon(Icons.eco),
                  child: Icon(
                    Icons.online_prediction,
                    size: 30,
                  ),
                ),
              ),
            ),

            // IconButton(icon: Icon(Icons.add), onPressed: null)
          ],
        ),
      ),
    );
  }
}
