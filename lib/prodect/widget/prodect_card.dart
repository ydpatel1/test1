import 'package:flutter/material.dart';
import 'package:test1/prodect/widget/mybutton.dart';

import '../model/prodect_model.dart';

class ProdectCard extends StatelessWidget {
  const ProdectCard({
    Key? key,
    required this.prodect,
  }) : super(key: key);
  final ProdectModel prodect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 25,
      height: 250,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (prodect.productPictures.isNotEmpty ||
              prodect.productFullSizePictures.isNotEmpty)
            SizedBox(
              width: 100,
              height: 70,
              child: Image(
                  image: NetworkImage(prodect.productPictures.isNotEmpty
                      ? prodect.productPictures.first.pictureUrl
                      : prodect.productFullSizePictures.first.pictureUrl)),
            ),
          if (prodect.productPictures.isEmpty ||
              prodect.productFullSizePictures.isEmpty)
            const SizedBox(
              width: 100,
              height: 70,
            ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Text(
              prodect.name,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Text(
              prodect.price.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            ontap: () {},
            borderRadius: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )
                ]),
          ),
          if (prodect.shortDescription?.isNotEmpty ?? false)
            const SizedBox(
              height: 10,
            ),
          Text(
            prodect.shortDescription ?? '',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
