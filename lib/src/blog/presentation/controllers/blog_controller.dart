import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';
import 'package:moviestar/src/blog/data/repositories/blog_repository.dart';
import 'package:moviestar/src/blog/domain/entities/blog_post.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  final BlogRepository repositorio = Get.find<BlogRepository>();

  final Rx<NotifierState> _state = Rx(NotifierState.initial);
  NotifierState get state => _state.value;

  final RxList<Artigo> _artigos = RxList([]);
  List<Artigo> get artigos => _artigos;

  Artigo? _artigoSelecionado;
  Artigo? get artigoSelecionado => _artigoSelecionado;

  Future<String> buscarArtigos({required int numeroPagina}) async {
    String? mensagemErro;
    _state.value = NotifierState.loading;

    final result = await repositorio.buscarArtigos(numeroPagina: numeroPagina);

    result.fold((left) {
      _state.value = NotifierState.failure;
      mensagemErro = left.message;
    }, (right) {
        _state.value = NotifierState.loaded;
        _artigos.value = right;
      },
    );
    
    return mensagemErro ?? '';
  }
  
  void selecionarArtigo(Artigo artigo) => _artigoSelecionado = artigo;
}