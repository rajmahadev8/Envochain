import 'package:cached_network_image/cached_network_image.dart';
import 'package:envochain/screens/walletconnector.dart';
import 'package:flutter/material.dart';
import 'package:envochain/models/feedmodel.dart';
import 'package:envochain/screens/profilescreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class FeedWidget extends StatelessWidget {
  final FeedModel feeddata;
  FeedWidget({required this.feeddata});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        child: ListTile(
          leading: GestureDetector(
            onTap: (() => pushNewScreenWithRouteSettings(
                  context,
                  settings: RouteSettings(
                      name: ProfileScreen.routeName,
                      arguments: feeddata.userId),
                  screen: ProfileScreen(),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                )),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Color.fromARGB(255, 181, 219, 136),
              child: CachedNetworkImage(
                imageUrl: feeddata.getProfileImage,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 181, 219, 136),
                  ),
                ),
              ),
            ),
          ),
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@${feeddata.getUsername}",
                  style: const TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(feeddata.getPostDescription),
                const SizedBox(
                  height: 12,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    color: Colors.black12,
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minHeight: 180, maxHeight: 400),
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        fit: BoxFit.cover,
                        imageUrl:
                            'https://cloudflare-ipfs.com/ipfs/${feeddata.getPostImage}',
                        width: double.infinity,
                        fadeInCurve: Curves.linear,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(WalletConnector.routeName);
                    },
                    clipBehavior: Clip.hardEdge,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text('Donate 🪙',
                        style: TextStyle(fontSize: 14))),
              ]),
        ),
      ),
    );
  }
}
