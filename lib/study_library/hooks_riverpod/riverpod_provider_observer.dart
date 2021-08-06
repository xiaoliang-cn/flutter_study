import 'package:hooks_riverpod/hooks_riverpod.dart';


/// RiverPodProviderObserver每次Riverpod更新值都会调用
class RiverPodProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    super.didUpdateProvider(provider, newValue);
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}
