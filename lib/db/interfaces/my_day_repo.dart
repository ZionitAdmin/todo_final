import '../../model/my_day_model.dart';

abstract class MiDiaRepo {
  Future<List<Tarjeta>> obtenerTarjetas();
  Future<void> guardarDatosDeMiDia(Tarjeta task);
  Future<void> actualizarTarjeta(Tarjeta task);
}
