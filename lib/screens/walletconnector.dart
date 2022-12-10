import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WalletConnector extends StatefulWidget {
  static const routeName = '/walletconnect';

  @override
  State<WalletConnector> createState() => _WalletConnectorState();
}

class _WalletConnectorState extends State<WalletConnector> {
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  var _session, _uri;

  Future<void> loginUsingMetamask(BuildContext context) async {
    print(connector.connected);
    if (!connector.connected) {
      try {
        var session = await connector.createSession(
          chainId: 137,
          onDisplayUri: (uri) async {
            debugPrint("----> URL ---> $uri");
            String metamaskURL = "metamask://wc?uri=$uri";
            String trustwalletURL = "trust://wc?uri=$uri";
            String rainbowURL = "rainbow://wc?uri=$uri";
            print(metamaskURL);
            try {
              await launchUrlString(uri, mode: LaunchMode.externalApplication);
            } catch (err) {
              debugPrint("error on launch --> $err");
            }
          },
        );
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/metamsk.png',
            height: 180,
            width: 180,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () => loginUsingMetamask(context),
            style: ElevatedButton.styleFrom(fixedSize: Size(300, 40)),
            child: const Text(
              'Connect to Metamask',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    ));
  }
}
