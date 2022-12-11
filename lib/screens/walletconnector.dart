import 'package:envochain/provider/metamaskprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WalletConnector extends StatefulWidget {
  static const routeName = '/walletconnect';

  @override
  State<WalletConnector> createState() => _WalletConnectorState();
}

class _WalletConnectorState extends State<WalletConnector> {
  // var metamask = MetaMask();

  // void _loginWithMetaMask() {
  //   print(metamask.toString());
  //   print(metamask.isSupported.toString() + "aaa");
  //   metamask.login().then((success) {
  //     setState(() {
  //       if (success) {
  //         debugPrint('MetaMask address: ${metamask.address}');
  //         debugPrint('MetaMask signature: ${metamask.signature}');
  //       } else {
  //         print(success);
  //         debugPrint('MetaMask login failed');
  //       }
  //     });
  //   });
  // }
  // // var connector = WalletConnect(
  // //     bridge: 'https://bridge.walletconnect.org',
  // //     clientMeta: const PeerMeta(
  // //         name: 'My App',
  // //         description: 'An app for converting pictures to NFT',
  // //         url: 'https://walletconnect.org',
  // //         icons: [
  // //           'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
  // //         ]));

  // // var _session, _uri;

  // // Future<void> loginUsingMetamask(BuildContext context) async {
  // //   print(connector.connected);
  // //   if (!connector.connected) {
  // //     try {
  // //       var session = await connector.createSession(
  // //         chainId: 137,
  // //         onDisplayUri: (uri) async {
  // //           debugPrint("----> URL ---> $uri");
  // //           String metamaskURL = "metamask://wc?uri=$uri";

  // //           print(metamaskURL);
  // //           try {
  // //             await launchUrlString(uri,
  // //                 mode: LaunchMode.externalApplication);
  // //           } catch (err) {
  // //             debugPrint("error on launch --> $err");
  // //           }
  // //         },
  // //       );
  // //       setState(() {
  // //         _session = session;
  // //       });
  // //     } catch (exp) {
  // //       print(exp);
  // //     }
  // //   }
  // // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Container(
  //     width: double.infinity,
  //     height: double.infinity,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Image.asset(
  //           'assets/images/metamsk.png',
  //           height: 180,
  //           width: 180,
  //         ),
  //         const SizedBox(
  //           height: 40,
  //         ),
  //         ElevatedButton(
  //           onPressed: () => _loginWithMetaMask(),
  //           style: ElevatedButton.styleFrom(fixedSize: Size(300, 40)),
  //           child: const Text(
  //             'Connect to Metamask',
  //             style: TextStyle(fontSize: 16),
  //           ),
  //         )
  //       ],
  //     ),
  //   ));

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: ChangeNotifierProvider(
          create: (context) => MetaMaskProvider()..start(),
          builder: (context, child) {
            return Container(
              child: Center(
                child: Consumer<MetaMaskProvider>(
                  builder: (context, provider, child) {
                    late final String message;
                    if (provider.isConnected && provider.isInOperatingChain) {
                      message = 'Connected';
                    } else if (provider.isConnected &&
                        !provider.isInOperatingChain) {
                      message =
                          'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';
                    } else if (provider.isEnabled) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaterialButton(
                            onPressed: () =>
                                context.read<MetaMaskProvider>().Connect(),
                            color: Colors.white,
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                                  width: 250,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      message = 'Please use a Web3 supported browser.';
                    }
                    return Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),
            );
          }),
    );
  }
}
