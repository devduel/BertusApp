import 'package:flutter/material.dart';

Widget buildProductInfo(Size deviceSize) {
  return Card(
    elevation: 3.0,
    margin: EdgeInsets.all(0.0),
    color: Colors.blue,
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.business,
                    color: Colors.grey[200],
                  ),
                  SizedBox(
                    width: deviceSize.width * 0.01,
                  ),
                  Text(
                    'Astra',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Open Sans',
                      fontSize: deviceSize.height * 0.025,
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Piórnik dwukomorowy z wyposażeniem',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'Open Sans',
                fontSize: deviceSize.height * 0.03,
              ),
            ),
            Divider(
              color: Colors.grey[200],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_offer,
                          color: Colors.grey[200],
                        ),
                        SizedBox(
                          width: deviceSize.width * 0.01,
                        ),
                        Text(
                          '3.49' + ' PLN',
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Open Sans',
                            fontSize: deviceSize.height * 0.025,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.store,
                          color: Colors.grey[200],
                        ),
                        SizedBox(
                          width: deviceSize.width * 0.01,
                        ),
                        Text(
                          '3.87' + ' PLN (z VAT)',
                          style: TextStyle(
                              color: Colors.grey[200],
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Open Sans',
                              fontSize: deviceSize.height * 0.025),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.layers,
                          color: Colors.grey[200],
                        ),
                        SizedBox(
                          width: deviceSize.width * 0.01,
                        ),
                        Text(
                          'op.',
                          style: TextStyle(
                              color: Colors.grey[200],
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Open Sans',
                              fontSize: deviceSize.height * 0.025),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.code,
                          color: Colors.grey[200],
                        ),
                        SizedBox(
                          width: deviceSize.width * 0.01,
                        ),
                        Text(
                          'PK-2765',
                          style: TextStyle(
                              color: Colors.grey[200],
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Open Sans',
                              fontSize: deviceSize.height * 0.025),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
