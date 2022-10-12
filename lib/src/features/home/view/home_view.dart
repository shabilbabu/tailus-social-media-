import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Image(
              image: AssetImage('assets/logotailusoriginal.png'),
              height: 100,
              width: 100,
            ),
          ),
        ),
        body: Center(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(600),
                            image: const DecorationImage(
                                image: AssetImage('assets/saaaapi.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: 11,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(200),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://pbs.twimg.com/profile_images/963826845589291009/xx6j6G9R_400x400.jpg'))),
                                ),
                                SizedBox(
                                  width: 15.h,
                                ),
                                Text(
                                  'dqsalman',
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 300.h,
                              width: MediaQuery.of(context).size.width.w,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.timesnowhindi.com/stories/Dulquer-Salman.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.comment,
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.save_alt,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ));
                  },
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
