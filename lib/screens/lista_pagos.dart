import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ListaPagos extends StatelessWidget {
  const ListaPagos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomNav(
            title: "Lista de Pagos",
          ),
          ListPaymentBody()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
        onPressed: () {
          Navigator.pushNamed(context, 'pago');
        },
        child: const Icon(
          Icons.payments_outlined,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ListPaymentBody extends StatefulWidget {
  const ListPaymentBody({Key? key}) : super(key: key);

  @override
  State<ListPaymentBody> createState() => _ListPaymentBodyState();
}

class _ListPaymentBodyState extends State<ListPaymentBody> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);

    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: userProvider.payments.length,
          itemBuilder: (BuildContext context, index) {
            return _ListPaymentBody(
              payment: userProvider.payments[index],
            );
          },
          padding: const EdgeInsets.all(0),
          separatorBuilder: (BuildContext context, index) {
            return const Divider(
              height: 10,
              color: Colors.black,
            );
          }
          //  padding: const EdgeInsets.only(bottom: 10),
          ),
    );
  }
}

class _ListPaymentBody extends StatelessWidget {
  const _ListPaymentBody({
    Key? key,
    required this.payment,
  }) : super(key: key);

  final Payment payment;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                payment.datetime.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  userProvider.deletePayment(payment.id);
                },
                icon: const Icon(Icons.delete, size: 40),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              const Icon(Icons.phone),
              Text(
                payment.client.phone,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 30,
              ),
              const Icon(Icons.money),
              Text(
                payment.amount.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(payment.comment),
            ],
          ),
        ],
      ),
    );
  }
}
