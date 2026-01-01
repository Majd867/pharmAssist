import 'package:flutter/material.dart';
import '../../../models/pharmacist_model.dart';
import '../../../controllers/get_all_pharmacists_controller.dart';
import '../customs/custom_pharmacist_card.dart';

class PharmacistCardListWidget extends StatelessWidget {
  const PharmacistCardListWidget({super.key});

  Future<List<PharmacistModel>> getPharmacists() async {
    return await GetAllPharmacistsService().getAllPharmacists();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PharmacistModel>>(
      future: getPharmacists(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No pharmacists found.'));
        } else {
          final pharmacistList = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: pharmacistList.length,
            itemBuilder: (context, index) {
              return CustomPharmacistCard(
                pharmacistModel: pharmacistList[index],
              );
            },
          );
        }
      },
    );
  }
}
