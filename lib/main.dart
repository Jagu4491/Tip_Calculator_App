import 'package:flutter/material.dart';

void main() {
  runApp(tipcalc());
}

class tipcalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip calculaor',
      theme: ThemeData(primaryColor: Colors.cyanAccent),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Homepagestate();
}

class Homepagestate extends State<Homepage> {
  var amtController = TextEditingController();
  var customtipcontroller=TextEditingController();

  var amtPerPerson = '000';
  var totalBill = '000';
  var totalTip = '000';

  var personcount = 1;
  var tippercent = 0.0;

  var iscustomevisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F3F4),
      body: SafeArea(
        child: Column(
          children: [
            //first
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/cap.jpg'),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('Mr'),
                              Text(
                                'TIP',
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Text('Calculator')
                        ],
                      )
                    ],
                  ),
                )),
            //second
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total P/person',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\u{20B9}',
                            style: TextStyle(
                              fontSize: 31,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            amtPerPerson,
                            style: TextStyle(
                              fontSize: 71,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11, right: 11),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Total Bill',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  totalBill,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.cyan,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Total Tip',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  totalTip,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.cyan,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            //third
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 34.0, right: 34.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Enter\nYour Bill',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.cyanAccent,
                          controller: amtController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.currency_rupee,
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              label: Text('Amount'),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.cyanAccent,
                                    width: 1,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.cyanAccent,
                                    width: 2,
                                  )),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.cyanAccent,
                                  ))),
                        ))
                  ],
                ),
              ),
            ),
            //forth
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 34.0, left: 34.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Choose\nYour Trip',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            tippercent = 0.1;
                                            update();
                                          },
                                          child: Text('10%'),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.cyanAccent,
                                              textStyle: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              )),
                                        ),
                                        height: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            tippercent = 0.15;
                                            update();
                                          },
                                          child: Text('15%'),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.cyanAccent,
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        height: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            tippercent = 0.2;
                                            update();
                                          },
                                          child: Text('20%'),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.cyanAccent,
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ),
                                        height: double.infinity,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  child: iscustomevisible
                                      ? TextField(
                                    keyboardType: TextInputType.number,
                                          cursorColor: Colors.cyanAccent,
                                          controller: customtipcontroller,
                                          onChanged: (value){
                                            tippercent=double.parse(value)/100;
                                            update();
                                          },

                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.currency_rupee,
                                                color: Colors.black,
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              label: Text('Amount'),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    color: Colors.cyanAccent,
                                                    width: 1,
                                                  )),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    color: Colors.cyanAccent,
                                                    width: 2,
                                                  )),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    color: Colors.cyanAccent,
                                                  ))),
                                        )
                                      : ElevatedButton(
                                          onPressed: () {
                                            iscustomevisible=true;
                                            setState(() {

                                            });
                                          },
                                          child: Text('Custom Tip'),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.cyanAccent,
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ))),
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),

            //fifth
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 34.0, right: 34.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Split\nThe Total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    if (personcount > 1) {
                                      personcount--;
                                      update();
                                    }
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.cyanAccent,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(11),
                                            bottomLeft: Radius.circular(11))),
                                  ),
                                )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          "$personcount",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    personcount++;
                                    update();
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(11),
                                          bottomRight: Radius.circular(11)),
                                      color: Colors.cyanAccent,
                                    ),
                                  ),
                                ))
                              ],
                            ))
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void update() {
    if (amtController.text.toString() != "") {
      var amtBill = int.parse(amtController.text.toString());

      var mtip = amtBill * tippercent;
      var mbill = amtBill + mtip;

      totalBill = mbill.toString();
      totalTip = mtip.toString();
      amtPerPerson = (mbill / personcount).toStringAsFixed(2);
      setState(() {});
    }
  }
}
