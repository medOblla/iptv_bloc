import 'package:teve/Home/models/categories_model.dart';
import 'package:teve/Home/models/countries_model.dart';
import 'package:teve/Home/models/languages_model.dart';
import 'package:teve/Home/models/tvg_model.dart';

import 'dart:convert';

class ChannelModel {
  String? _name;
  String? _logo;
  String? _url;
  String? _country;
  List<String>? _categories;
  List<String>? _languages;
  //Tvg? _tvg;
  //
  // ChannelModel(
  //     {this.name,
  //     this.logo,
  //     this.url,
  //     this.categories,
  //     this.countries,
  //     this.languages,
  //     this.tvg});

  ChannelModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _logo = json['logo'];
    _url = json['url'];

    _categories = List<String>.from(jsonDecode(jsonEncode(json['categories'])));
    _languages = List<String>.from(jsonDecode(jsonEncode(json['languages'])));
    _country = json['country'];

    //_tvg = json['tvg'] != null ? Tvg.fromJson(json['tvg']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "stream_link": _url,
      "category": _categories![0],
      "channel_name": _name
    };
  }

  String? get name => _name;
  String? get logo => _logo;
  String? get url => _url;
  List<String>? get categories => _categories;
  List<String>? get languages => _languages;
  String? get country => _country;
//Tvg? get tvg => _tvg;
}
