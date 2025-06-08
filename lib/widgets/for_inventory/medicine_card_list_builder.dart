import 'package:flutter/material.dart';
import 'package:pharma_ssist/controllers/medicine_controller.dart';
import 'package:pharma_ssist/models/medicine_model.dart';
import 'package:pharma_ssist/widgets/customs/custom_text.dart';
import 'package:pharma_ssist/widgets/for_inventory/medicine_card_list_widget.dart';

class MedicineCardListBuilder extends StatefulWidget {
  const MedicineCardListBuilder({super.key, required this.category});
  final String category;
  @override
  State<MedicineCardListBuilder> createState() =>
      _MedicineCardListBuilderState();
}

class _MedicineCardListBuilderState extends State<MedicineCardListBuilder> {
  @override
  void initState() {
    future = MedicineService().getMedicine(widget.category);
    super.initState();
  }

  late Future<List<MedicineModel>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(child: CustomText(text: 'Failed, try again later.')),
          );
        } else if (snapshot.hasData) {
          return MedicineCardListWidget(medicineList: snapshot.data!);
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CustomText(text: 'No data found.')),
          );
        }
      }
    );
  }
}
