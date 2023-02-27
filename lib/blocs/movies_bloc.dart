import 'package:teve/Home/models/channel_model.dart';
import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<List<ChannelModel>>();

  Stream<List<ChannelModel>> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    List<ChannelModel> itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();