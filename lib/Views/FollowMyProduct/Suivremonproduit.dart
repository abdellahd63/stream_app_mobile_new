import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stream_app_mobile_new/APIs.dart';

class Suivremonproduit extends StatelessWidget {
  final Map<String, dynamic> PanneData;
  Suivremonproduit({super.key, required this.PanneData});
  String progression = '';
  String Progression(val)  {
    if(val == 0) {
      progression = "Produit en attente de depot";
    }else if(val == 1) {
      progression = "Produit a été déposée";
    }else if(val == 2) {
      progression = "Produit en reparation au centre";
    }else if(val == 3) {
      progression = "Produit réparée";
    }else if(val == 4) {
      progression = "Produit en attente de pickup";
    }else if(val == 5) {
      progression = "Produit livrée";
    }
    return progression;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        shadowColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 90,
        title:  //Title
                  Text('Suivre mon produit',
                  textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Color(0xffD4171b),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                  ),
       leading:  Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.close,color: Color(0xffD4171b),),
            onPressed: () { Navigator.of(context).pop();},
        );
    },
  ),
      ),
       backgroundColor: Color.fromARGB(255, 238, 238, 238),
       body: Center(
         child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                    CircularPercentIndicator(
                      radius: 100.0,
                      lineWidth: 15.0,
                      percent: PanneData['Progres']*2/10,
                      header: Padding(
                        padding: const EdgeInsets.symmetric(vertical:10.0),
                          child: new Text("Progression",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      center: new Icon(
                        Icons.settings,
                        size: 50.0,
                        color: Color(0xffd4171b),
                      ),
                      backgroundColor: Color.fromARGB(255, 226, 164, 165),
                      progressColor: Color.fromARGB(255, 56, 187, 0),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text('${Progression(PanneData['Progres'])}',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                        color: Color(0xffD4171b),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical:20.0),
                          child: new Text("Mon Produit ",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                    Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                      2: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Center(
                                child: Text(
                                  'Nom Complet :',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child:Center(
                                  child: Text(
                                  '${PanneData['Nom']+" "+PanneData['Prenom']}',
                                  style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                    ]
                  ),
                  TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Center(
                                child: Text(
                                  'Numero telephone :',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child:Center(
                                  child: Text(
                                  '${PanneData['Telephone']}',
                                  style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
       
                    ]
                  ),
                   TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Center(
                                child: Text(
                                  'Referance :',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child:Center(
                                  child: Text(
                                
                                  '${PanneData['ReferanceProduit']}',
                                  style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                    ]
                  ),
                  TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Center(
                                child: Text(
                                  'Type de panne :',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child:Center(
                                  child: Text(
                                  '${PanneData['TypePanne']}',
                                  style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                    ]
                  ),
                  TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Center(
                                child: Text(
                                  'Date de depot :',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child:Center(
                                  child: Text(
                                  '${APIs.formatDate(PanneData['DateDepot'].toString())}',                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                              ),
                            ),
                          ),
                    ]
                  ),
                  TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Center(
                                child: Text(
                                  'Centre de depot :',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child:Center(
                                  child: Text(
                                  '${"SAV "+PanneData['CentreDepot']}',
                                  style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
       
                    ]
                  )],
                  ),
              ],
            ),
            ),
         ),
       ),
    );
  }
}