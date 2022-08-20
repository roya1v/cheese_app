import 'package:cheese_app/model/guild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class GuildsRepository {
  Future<List<Guild>> getGuilds() async {
    var guildList = await FirebaseFirestore.instance.collection('guilds').get();
    List<Guild> guilds = [];
    // List<Guild> guilds = guildList.docs.map((dict) {
    //   final String? iconName = dict.get('icon');
    //   if (iconName != null) {
    //     var url = FirebaseStorage.instance.refFromURL(iconName);
    //     var urlS = await url.getDownloadURL();
    //     return Guild(
    //         id: dict.id,
    //         name: dict.data()['name'],
    //         icon: Image.network(url.getDownloadURL()));
    //   }
    //   return Guild(id: dict.id, name: dict.data()['name']);
    // }).toList();
    for (final doc in guildList.docs) {
      try {
        final String? iconName = doc.get('icon');
        if (iconName != null) {
          print(iconName);
          var url = await FirebaseStorage.instance
              .refFromURL(iconName)
              .getDownloadURL();
          guilds.add(Guild(
              id: doc.id, name: doc.data()['name'], icon: Image.network(url)));
        }
      } catch (e) {
        guilds.add(Guild(id: doc.id, name: doc.data()['name']));
        continue;
      }
    }
    return guilds;
  }
}
