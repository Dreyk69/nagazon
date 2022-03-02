import 'package:flutter/material.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}
enum SingingCharacter { free, onerub, tworub, treerub }
class _MyApp extends State<MyApp> {
  
  SingingCharacter? _character = SingingCharacter.free;
  bool _value = true;
  String tikalki = ('');
  List zapis = [];
   

  @override
  void initState() {
    super.initState();
    
    zapis.addAll(['puk', 'ko', 'go']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      Text(
                  'Отчет по FC',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, color:  Colors.blue[900] )
                  ),
                  Icon(
                    Icons.note_add,
                    color: Colors.blue[900],
                    ),
                   ]
                 ),
               ),
             ]
           ),
           Expanded(
             child: ListView.builder(
               shrinkWrap: true,
               itemCount: zapis.length,
               itemBuilder: (BuildContext context, int index) {
                 return Dismissible(
                   key: Key(zapis[index]),
                   child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                           ListTile(
                             title: Container(
                          child: Text(''),
                        ),
                          leading: Text(
                          '7ee092ce-76f0-4899-8861-deef0924gc54',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal,  color: Colors.black)
                          ),
                           ),
                           Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                   Text (tikalki)
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Дата: 02.03.2022',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal,  color: Colors.black)),
                                  SizedBox(width: 15),
                                  Text('Время: 19:08',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal,  color: Colors.black))
                                ],
                              )
                            ],
                          ),
                        )
                        ],
                      ),
                   ),
                   onDismissed: (direction) {
                     if(direction == DismissDirection.startToEnd){
                  setState(() {
                    zapis.removeAt(index);
                  });
                }
                else if (direction == DismissDirection.endToStart){
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text('пук'),
                    );
                  });
                }
                   },
                 );
               }
             )
           )
         ]
       
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: _showDialog, 
         backgroundColor: Colors.blue[900],
        child: Icon(Icons.add),
        ),
       
      );
  }
  void _showDialog() {
    showDialog(
      
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(29),
          title: new Text("Добавить операцию  с пропуском"),
          content: Column (
            mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'нал',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal )
                ),
              Switch(
                value: _value,
                onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              activeColor: Colors.blue[900],
              activeTrackColor: Colors.blue[800],
              inactiveTrackColor: Colors.blue[900],
              inactiveThumbColor: Colors.blue[800], 
              ),
              Text(
                'безнал',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal )
                ),
            ]
          ),
         
           Row( 
             children: [
            
               Column(
      children: [
         
      Row(
      children: <Widget>[
        SizedBox(
          height: 100,
          width: 150,
          child:
        ListTile(
          
          title: const Text('free'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.free,
            groupValue: _character,
            onChanged: (SingingCharacter? value1) {
             
                _character = value1;
                tikalki = ('free');
           
            },
            activeColor: Colors.blue[900],
          ),
        ),
        ),
      SizedBox(
          height: 100,
          width: 150,
          child:
        ListTile(
          title: const Text('400руб'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.onerub,
            groupValue: _character,
            onChanged: (SingingCharacter? value2) {
              
                _character = value2;
                tikalki = ('400руб');
            
            },
            activeColor: Colors.blue[900],
          ),
        ),
        )
      ],
      
    ),
    
    Row(
      children: <Widget>[
        SizedBox(
          height: 100,
          width: 155,
          child:
        ListTile(
          title: const Text('900руб'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.tworub,
            groupValue: _character,
            onChanged: (SingingCharacter? value3) {
              
                _character = value3;
                tikalki = ('900руб');
              
            },
            activeColor: Colors.blue[900],
          ),
        ),
        ),
        SizedBox(
          height: 100,
          width: 140,
          child:
        ListTile(
          title: const Text('1500руб'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.treerub,
            groupValue: _character,
            onChanged: (SingingCharacter? value4) {
              
                _character = value4;
                tikalki = ('1500руб');
              
            },
            activeColor: Colors.blue[900],
          ),
        ),
        )
      ]
      ),
         
      ]
         
    )
             
          ]
        
           )
           
        ]
          ),
         
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
          actions: [
            ElevatedButton(
              child: new Text("Отмена"),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.grey[600],
                primary: Colors.white,
              )
            ),
            ElevatedButton(
              child: new Text("Подтвердить"),
              onPressed: () {
                setState(() {
                  zapis.add(tikalki);
                });
               Navigator.of(context).pop();
              }, //0000000000000000000000000000000000000000000000000000000000000
              style: ElevatedButton.styleFrom(
              primary: Colors.blue[900],
              )
            ),
          ],
        );
        
      },
    );
  }
}
