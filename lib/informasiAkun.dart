import 'package:aplikasi2/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InformasiAkun extends StatefulWidget {
  const InformasiAkun({super.key});

  @override
  _InformasiAkunState createState() => _InformasiAkunState();
}

class _InformasiAkunState extends State<InformasiAkun> {
  bool _isEditingUniversitas = false;
  String _universitas = 'Universitas';
  late final TextEditingController _universitasController;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoggingOut = false;
  User? _user;

  @override
  void initState() {
    super.initState();
    _universitasController = TextEditingController();
    _user = _auth.currentUser;
    _loadUniversitas();
  }

  @override
  void dispose() {
    _universitasController.dispose();
    super.dispose();
  }

  Future<void> _loadUniversitas() async {
    if (_user != null) {
      final doc = await _firestore.collection('users').doc(_user!.uid).get();
      if (doc.exists && doc.data()?['universitas'] != null) {
        setState(() {
          _universitas = doc.data()!['universitas'];
        });
      }
    }
  }

  Future<void> _logout() async {
    setState(() => _isLoggingOut = true);
    try {
      await _auth.signOut();
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal logout: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoggingOut = false);
      }
    }
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Anda yakin ingin keluar dari akun ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: _logout,
            child: _isLoggingOut
                ? const CircularProgressIndicator()
                : const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _saveUniversitas() async {
    final user = _auth.currentUser;
    final universitasBaru = _universitasController.text.trim();

    if (universitasBaru.length >= 3 && user != null) {
      try {
        await _firestore.collection('users').doc(user.uid).update({
          'universitas': universitasBaru,
        });

        setState(() {
          _universitas = universitasBaru;
          _isEditingUniversitas = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Universitas berhasil disimpan')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menyimpan data: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan nama universitas')),
      );
    }
  }

  void _cancelEditing() {
    setState(() => _isEditingUniversitas = false);
  }

  @override
  Widget build(BuildContext context) {
    final email = _user?.email ?? 'Email tidak tersedia';
    final displayName = _user?.displayName ?? 'Nama pengguna tidak tersedia';

    return Scaffold(
      backgroundColor: const Color(0xFF6993F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              FieldProfile(
                icon: Icons.person,
                text: displayName,
                isSensitive: false,
              ),

              const SizedBox(height: 15),

              FieldProfile(
                icon: Icons.email,
                text: email,
                isSensitive: false,
              ),

              const SizedBox(height: 15),

              // Universitas
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: _isEditingUniversitas
                    ? Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.account_balance, size: 25),
                              const SizedBox(width: 15),
                              Expanded(
                                child: TextField(
                                  controller: _universitasController,
                                  autofocus: true,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Masukkan Universitas',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: _cancelEditing,
                                child: const Text('Batal'),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: _saveUniversitas,
                                child: const Text('Simpan'),
                              ),
                            ],
                          ),
                        ],
                      )
                    : InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          setState(() {
                            _isEditingUniversitas = true;
                            _universitasController.text = _universitas;
                          });
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.account_balance, size: 25),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                _universitas,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: _universitas == 'Universitas'
                                      ? Colors.grey
                                      : Colors.black,
                                ),
                              ),
                            ),
                            const Icon(Icons.edit,
                                size: 18, color: Colors.grey),
                          ],
                        ),
                      ),
              ),

              const SizedBox(height: 40),

              // Tombol Logout
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton.icon(
                  onPressed: _confirmLogout,
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      color: Colors.red,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FieldProfile extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSensitive;

  const FieldProfile({
    super.key,
    required this.icon,
    required this.text,
    this.isSensitive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(icon, size: 25),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              isSensitive ? _maskSensitiveInfo(text) : text,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _maskSensitiveInfo(String text) {
    if (text.isEmpty) return text;
    if (text.contains('@')) {
      final parts = text.split('@');
      final name = parts[0];
      final domain = parts[1];
      return '${name[0]}***${name.length > 1 ? name.substring(name.length - 1) : ''}@$domain';
    } else {
      return text.length <= 2
          ? '${text[0]}***'
          : '${text[0]}***${text.substring(text.length - 2)}';
    }
  }
}
