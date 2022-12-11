import 'package:flutter/material.dart';
import 'package:envochain/screens/registerscreen.dart';
import 'package:envochain/screens/signinscreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * 0.42,
                          child: Image.asset(
                            'assets/images/hometree.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.05,
                        ),
                        FittedBox(
                          child: Text('Welcome to the \nEnvochain',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline5),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                          child: Text(
                            'Let\'s love trees with every breath we take until\nwe perish.Let\'s contribute to nature by planting \n a tree.Let\'s Adopt the pace of nature.\nLet\'s build ENVOCHAIN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                                fontFamily: 'Rubik'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(vertical: 35, horizontal: 50),
                    child: Container(
                      height: 50,
                      width: constraints.maxWidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 163, 201, 120)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            RegisterScreen.routeName);
                                      },
                                      child: FittedBox(child: Text('Register')),
                                      style: TextButton.styleFrom(
                                          primary: Colors.black,
                                          backgroundColor: Color(0xff529900),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 30))),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: double.infinity,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(SignInScreen.routeName);
                                    },
                                    child: FittedBox(child: Text('Sign in')),
                                    style: TextButton.styleFrom(
                                        primary: Colors.black,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 30))),
                              ),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
