import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ListRow extends StatelessWidget {
  final City;
  final adresse;
  final Phone;
  final Url;
  const ListRow({super.key,
    required this.City,
    required this.adresse,
    required this.Phone,
    required this.Url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
                                        child: Material(
                                          elevation: 10,
                                          color: Colors.transparent,
                                          child: Container(
                                            height: 120,
                                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              color: Colors.white,
                                              
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                
                                                SizedBox(
                                                  width: 230,
                                                  child: Column(
                                                    
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      //nom sav
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5.0),
                                                        child: Text(City,
                                                        textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            
                                                                                                      
                                                          ),
                                                        ),
                                                      ),
                                                      //adresse SAV
                                                      Text(adresse,
                                                      overflow: TextOverflow.ellipsis,
                                                      softWrap: true,
                                                      maxLines: 2,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                
                                                        ),
                                                      ),
                                                      //phone
                                                      Text(Phone,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                
                                                        ),
                                                      ),
                                                
                                                    ],
                                                  ),
                                                ),

                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(onPressed:  ()=>{
                                                      launch('tel://$Phone')
                                                    }, icon: Icon(CupertinoIcons.phone)),
                                                    IconButton(onPressed:  ()=>{
                                                      MapsLauncher.launchQuery(Url)
                                                    }, icon: Icon(CupertinoIcons.location))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
  }
}