import 'dart:async';
import 'package:totorial_patron_block/evento_contador.dart';
class ContadorBloc{
  int _contador=0;
  final _contadorControladorEstado=StreamController<int>();
  StreamSink<int> get _adentroCountador=>_contadorControladorEstado.sink;
  Stream<int> get contador =>_contadorControladorEstado.stream;
  final _contadorControladorEvento=StreamController<EventoContador>();
  Sink<EventoContador> get contadorEventoSink=>_contadorControladorEvento.sink;
  ContadorBloc(){
    _contadorControladorEvento.stream.listen(_mapaEventoAEstado);
  }
  void _mapaEventoAEstado(EventoContador evento){
    if(evento is EventoSumar) {
      _contador++;
    } else {
      _contador--;
    }
    _adentroCountador.add(_contador);
  }
  void cerrar(){
    _contadorControladorEstado.close();
    _contadorControladorEvento.close();
  }
}