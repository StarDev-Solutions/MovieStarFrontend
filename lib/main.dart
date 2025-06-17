import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moviestar/src/autenticacao/presentation/controllers/autenticacao_controller.dart';
import 'package:moviestar/src/midia/data/repositories/midia_repository.dart';
import 'package:moviestar/src/midia/presentation/controllers/midia_controller.dart';
import 'package:moviestar/src/blog/data/repositories/blog_repository.dart';
import 'package:moviestar/src/blog/presentation/controllers/blog_controller.dart';
import 'package:moviestar/src/core/route.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, _, _) {
        return FutureBuilder(
          future: _precacheImages(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) FlutterNativeSplash.remove();

            return GetMaterialApp(
              title: 'Movie Star',
              debugShowCheckedModeBanner: false,
              theme: Style.material3Theme,
              getPages: Pages.pages,
              initialRoute: Routes.checagemRoute,
              initialBinding: BindingsBuilder(() {
                Get.put(Dio());
                Get.put(AutenticacaoController());
                Get.lazyPut(() => MidiaRepository());
                Get.lazyPut(() => MidiaController());
                Get.lazyPut(() => BlogRepository());
                Get.lazyPut(() => BlogController());
              }),
            );
          }
        );
      },
    );
  }

  ///Método para realizar o carregamento das imagens em cache.
  Future<void> _precacheImages(BuildContext context) async {
    await Future.wait([
      precacheImage(const AssetImage('assets/images/placeholder_midia.png'), context),
      precacheImage(const AssetImage('assets/images/spider_man.png'), context),
      precacheImage(const AssetImage('assets/images/peaky_blinders.png'), context),
    ]);
  }
}
