import 'package:canary_app/presentation/profile/bloc/profile_buyer_bloc.dart';
import 'package:canary_app/presentation/profile/widget/profile_buyer_form.dart';
import 'package:canary_app/presentation/profile/widget/profile_view_buyer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerProfileScreen extends StatefulWidget {
  const BuyerProfileScreen({super.key});

  @override
  State<BuyerProfileScreen> createState() => _BuyerProfileScreenState();
}

class _BuyerProfileScreenState extends State<BuyerProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Ambil profil pembeli saat halaman dimuat
    context.read<ProfileBuyerBloc>().add(GetProfileBuyerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil Pembeli")),
      body: BlocBuilder<ProfileBuyerBloc, ProfileBuyerState>(
        builder: (context, state) {
          print('[DEBUG] State sekarang: $state');

          if (state is ProfileBuyerLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is ProfileBuyerLoaded) {
            final profile = state.profile.data;
            print('[DEBUG] Profile Loaded: ${profile.toJson()}');

            // Cek nilai nama, mungkin kosong?
            if (profile.name.trim().isEmpty) {
              print('[DEBUG] Nama kosong, tampilkan form');
              return ProfileBuyerInputForm();
            }

            return ProfileViewBuyer(profile: profile);
          }

          if (state is ProfileBuyerError) {
            print('[DEBUG] ERROR: ${state.message}');
          }

          // Kalau state ProfileBuyerInitial atau ProfileBuyerError
          print('[DEBUG] State bukan loaded, tampilkan form');
          return ProfileBuyerInputForm();
        },
      ),
    );
  }
}
