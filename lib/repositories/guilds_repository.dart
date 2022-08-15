import 'package:cheese_app/model/guild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GuildsRepository {
  Future<List<Guild>> getGuilds() async {
    var guildList = await FirebaseFirestore.instance.collection('guilds').get();
    List<Guild> guilds = guildList.docs.map((dict) {
      return Guild(id: dict.id, name: dict.data()['name']);
    }).toList();
    return guilds;
  }
}
