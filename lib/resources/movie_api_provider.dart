import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:teve/Home/models/channel_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'your_api_key';

  Uri getUri(String endpoint, {bool isDb = false}) {
    String fronteir = "https://iptv-org.github.io/api/channels.json";
    return Uri.parse(fronteir);
  }

  Future<List<ChannelModel>> fetchMovieList() async {
    print("entered");
    Uri uri = getUri("as");
    final response = await client.get(uri);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<ChannelModel> channelList = [];

      List<dynamic> jsonList = json.decode(response.body);
      for (var json in jsonList) {
        ChannelModel channel = ChannelModel.fromJson(json);
        channelList.add(channel);
      }

      return channelList;

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

}