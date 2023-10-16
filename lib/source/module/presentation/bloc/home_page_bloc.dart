import 'package:bloc/bloc.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_event.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    //on<InternetEventLoadWan>(_loadWan);
  }
  // Future _loadWan(InternetEventLoadWan event, Emitter emit) async {
  //   emit(_updateState(isLoading: true));

  //   final wan = await _interactors.loadWanUsecase();

  //   if (wan.isSuccess()) {
  //     final wanInfo = wan.isSuccess() != true
  //         ? null
  //         : await _interactors.loadInterfaceInfoUsecase(
  //             interfaceID: wan.successValue.interfaceID!);

  //     emit(_updateState(
  //         routerWan: wan.successValue,
  //         wanInterfaceInfo: wanInfo?.successValue));
  //   }

  //   wan.onError((error) {
  //     emit(_updateState(isLoading: false, error: error.message));
  //   });
  // }

  HomePageState _updateState({
    bool? isLoading,
  }) =>
      HomePageState(
        isLoading: isLoading ?? state.isLoading,
      );
}
