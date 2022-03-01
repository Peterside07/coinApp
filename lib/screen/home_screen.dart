import 'package:coinapp/bloc/coin_data_bloc.dart';
import 'package:coinapp/screen/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

//Navigation Icons
  List<List> icons = [
    [const Icon(Icons.home), ''],
    [const Icon(Icons.account_balance), ''],
    [const Icon(Icons.notification_add_rounded), ''],
    [const Icon(Icons.person), ''],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        icons: icons,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30, left: 16.0, right: 16, bottom: 10),
            child: Column(
              children: [
                const TopWidgetComponet(),
                BlocBuilder<CoinDataBloc, CoinDataState>(
                  builder: (context, state) {
                    if (state is CoinDataInitialState) {
                      context.read<CoinDataBloc>().add(LoadGameDataEvent());
                      return const CircularProgressIndicator();
                    } else if (state is CoinDataLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CoinDataLoadedState) {
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.apiResult.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(0),
                                  width: MediaQuery.of(
                                    context,
                                  ).size.width,
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    width: 70,
                                                    color: Colors.white,
                                                    child: Image.network(state
                                                        .apiResult[index].image)
                                                    // Text(state.apiResult[index].symbol),

                                                    ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.apiResult[index].name,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                state.apiResult[index].symbol,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              ("\$" +
                                                  state.apiResult[index]
                                                      .currentPrice
                                                      .toInt()
                                                      .toString()),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              state.apiResult[index]
                                                  .priceChange24H
                                                  .toStringAsFixed(1)
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (state is CoinDataErrorState) {
                      return const Center(
                        child: Text("Something went wrong!"),
                      );
                    }
                    return const Text("Error Occur");
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      // ),
    );
  }
}

class TopWidgetComponet extends StatelessWidget {
  const TopWidgetComponet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "History",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 20,
              color: Color(0xFF032250),
              // color: Colors.black,
              fontWeight: FontWeight.w600,
            ), // style: HeadertextStyle,
          ),
          Row(
            children: const [
              Icon(Icons.sort),
              SizedBox(
                width: 7,
              ),
              Text(
                "Sort/Filter",
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 20,
                  color: Color(0xFF032250),
                  // color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
