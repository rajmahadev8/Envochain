import 'package:flutter/cupertino.dart';
import 'package:flutter_web3/ethereum.dart';

class MetaMaskProvider extends ChangeNotifier {
  static const operatingChain = 296;
  String currentAdress = "";
  int currentChain = -1;
  bool get isEnabled => ethereum != null;
  bool get isInOperatingChain => currentChain == operatingChain;
  bool get isConnected => isEnabled && currentAdress.isNotEmpty;

  Future<void> Connect() async {
    if (isEnabled) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) currentAdress = accs.first;
      currentChain = await ethereum!.getChainId();
      notifyListeners();
    }
  }

  reset() {
    currentAdress = '';
    currentChain = -1;
    notifyListeners();
  }

  start() {
    if (isEnabled) {
      ethereum!.onAccountsChanged((accounts) {
        reset();
      });
      ethereum!.onChainChanged((chainId) {
        reset();
      });
    }
  }
}
