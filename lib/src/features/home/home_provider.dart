import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_stream/src/features/home/usecases/home_usecase.dart';

final homeProvider = ChangeNotifierProvider<HomeUseCase>((ref) {
  return HomeUseCase();
});
