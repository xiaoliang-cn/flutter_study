import 'package:hooks_riverpod/hooks_riverpod.dart';

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
