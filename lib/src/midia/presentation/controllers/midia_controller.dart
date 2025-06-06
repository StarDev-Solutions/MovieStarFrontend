import 'package:get/get.dart';
import 'package:moviestar/src/midia/data/repositories/midia_repository.dart';
import 'package:moviestar/src/midia/domain/entities/midia.dart';
import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';

class MidiaController extends GetxController {
  final MidiaRepository repositorio = Get.find<MidiaRepository>();

  final Rx<NotifierState> _state = Rx(NotifierState.initial);
  NotifierState get state => _state.value;

  final RxList<Filme> _filmesPopulares = <Filme>[].obs;
  List<Filme> get filmesPopulares => _filmesPopulares;
  
  final RxList<Serie> _seriesPopulares = <Serie>[].obs;
  List<Serie> get seriesPopulares => _seriesPopulares;

  List<Midia> get midiasPopulares => [..._filmesPopulares, ..._seriesPopulares];

  Midia? _midiaSelecionada;
  Midia? get midiaSelecionada => _midiaSelecionada;
  
  void selecionarMidia(Midia midia) => _midiaSelecionada = midia;

  Future<String> buscarFilmes({required int numeroPagina}) async {
    String? mensagemErro;
    _state.value = NotifierState.loading;

    final result = await repositorio.buscarFilmes(numeroPagina: numeroPagina);

    result.fold((left) {
      _state.value = NotifierState.failure;
      mensagemErro = left.message;
    }, (right) {
        _state.value = NotifierState.loaded;
        _filmesPopulares.value = right;
      },
    );
    
    return mensagemErro ?? '';
  }

  Future<String> buscarSeries({required int numeroPagina}) async {
    String? mensagemErro;
    _state.value = NotifierState.loading;

    final result = await repositorio.buscarSeries(numeroPagina: numeroPagina);

    result.fold((left) {
      _state.value = NotifierState.failure;
      mensagemErro = left.message;
    }, (right) {
        _state.value = NotifierState.loaded;
        _seriesPopulares.value = right;
      },
    );
    
    return mensagemErro ?? '';
  }
}