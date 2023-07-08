import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:steganography_app/data/firebase_storage_service.dart';

import '../../../constants/custom_colors.dart';
import '../../../constants/typo.dart';
import '../../../data/auth_service.dart';

class EmbeddingProjects extends StatefulWidget {
  const EmbeddingProjects({super.key});

  @override
  State<EmbeddingProjects> createState() => _EmbeddingProjectsState();
}

class _EmbeddingProjectsState extends State<EmbeddingProjects> {
  List<Map<String, dynamic>> waitingList = [];
  List<Map<String, dynamic>> doneList = [];
  bool isLoading = true;
  String choosed = 'waiting';

  @override
  void initState() {
    Future.wait([getEmbeddings()]).then((value) {
      isLoading = false;
      setState(() {});
    });
    super.initState();
  }

  Future<void> getDone(DataSnapshot event) async {
    final instance = FirebaseDatabase.instance;

    if (event.exists) {
      doneList.clear();
      Map result = event.value as Map;
      result.forEach((key, value) async {
        // '0U2cAeR4lJNK8I7Set3JE67RYD72'
        if (value['userid'] == AuthService.currentUser!.uid) {
          final watermarkEvent =
              await instance.ref('Embedding/WatermarkEm/$key').once();

          String watermarkNameFile = '';
          String watermarkPathFile = '';

          if (watermarkEvent.snapshot.exists) {
            watermarkNameFile =
                (watermarkEvent.snapshot.value as Map)['nama_file'];
            watermarkPathFile =
                (watermarkEvent.snapshot.value as Map)['path_file'];
          }

          final stegoEvent =
              await instance.ref('Embedding/StegoEm/$key').once();

          String stegoNameFile = '';
          String stegoPathFile = '';

          if (stegoEvent.snapshot.exists) {
            stegoNameFile = (stegoEvent.snapshot.value as Map)['nama_file'];
            stegoPathFile = (stegoEvent.snapshot.value as Map)['path_file'];
          }
          Map<String, dynamic> each = {
            'key': key,
            'metode': value['metode'],
            'nama_file_citra': value['nama_file'],
            'path_file_citra': value['path_file'],
            'nama_file_watermark': watermarkNameFile,
            'path_file_watermark': watermarkPathFile,
            'nama_file_stego': stegoNameFile,
            'path_file_stego': stegoPathFile,
            'userid': value['userid'],
            'embed_key': value['key'],
            'status': value['status'],
            'timestamp': value['timestamp'],
          };
          doneList.add(each);
        }
        setState(() {});
      });
    }
  }

  Future downloadImage(String ref) async {
    try {
      final url = await FirebaseStorageService.downloadUrl(ref);

      final tempDir = await getTemporaryDirectory();
      final path = '${tempDir.path}/$ref';
      await Dio().download(url, path);

      await GallerySaver.saveImage(path, toDcim: true);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Image successfully saved!',
            style: AppTypography.regular12.copyWith(color: Colors.black),
          ),
        ),
      );
    } catch (e) {
      print('failed saveImage: $e');
    }
  }

  Future<void> getProcess(DataSnapshot event) async {}

  Future<void> getWaiting(DataSnapshot event) async {
    final instance = FirebaseDatabase.instance;

    if (event.exists) {
      waitingList.clear();
      Map result = event.value as Map;
      result.forEach((key, value) async {
        // '0U2cAeR4lJNK8I7Set3JE67RYD72'
        if (value['userid'] == AuthService.currentUser!.uid) {
          final watermarkEvent =
              await instance.ref('Embedding/WatermarkEm/$key').once();

          String watermarkNameFile = '';
          String watermarkPathFile = '';

          if (watermarkEvent.snapshot.exists) {
            watermarkNameFile =
                (watermarkEvent.snapshot.value as Map)['nama_file'];
            watermarkPathFile =
                (watermarkEvent.snapshot.value as Map)['path_file'];
          }
          Map<String, dynamic> each = {
            'key': key,
            'metode': value['metode'],
            'nama_file_citra': value['nama_file'],
            'path_file_citra': value['path_file'],
            'nama_file_watermark': watermarkNameFile,
            'path_file_watermark': watermarkPathFile,
            'nama_file_stego': null,
            'path_file_stego': null,
            'userid': value['userid'],
            'embed_key': value['key'],
            'status': value['status'],
            'timestamp': value['timestamp'],
          };
          waitingList.add(each);
        }
        setState(() {});
      });
    }
  }

  Future<void> getEmbeddings() async {
    final instance = FirebaseDatabase.instance;

    final DatabaseReference ref = instance.ref('Embedding/HostEm');

    // final Query query =
    //     ref.orderByChild("userid").equalTo("0U2cAeR4lJNK8I7Set3JE67RYD72");
    // final Query queryWaiting = ref.orderByChild("status").equalTo(0);
    // final Query queryDone = ref.orderByChild("status").equalTo(2);
    final Query queryWaiting = ref.orderByChild("status").startAt(0).endAt(1);
    final Query queryDone = ref.orderByChild("status").startAt(2).endAt(5);

    DataSnapshot eventWaiting = await queryWaiting.get();
    DataSnapshot eventDone = await queryDone.get();

    await getWaiting(eventWaiting);
    await getDone(eventDone);

    // Query query = ref.orderByChild("age").limitToFirst(10);

    // DataSnapshot event = await query.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: () {
                            choosed = 'waiting';
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(12),
                                // color: Colors.blue,
                                border: choosed == 'waiting'
                                    ? const Border(
                                        bottom: BorderSide(
                                            color: Colors.black, width: 2))
                                    : null),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: const Text(
                              'Waiting Admin',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     choosed = 'process';
                        //     setState(() {});
                        //   },
                        //   child: Container(
                        //     margin: const EdgeInsets.only(right: 8),
                        //     decoration: BoxDecoration(
                        //         // borderRadius: BorderRadius.circular(12),
                        //         // color: Colors.blue,
                        //         border: choosed == 'process'
                        //             ? const Border(
                        //                 bottom: BorderSide(
                        //                     color: Colors.black, width: 2))
                        //             : null),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 8, vertical: 12),
                        //     child: const Text(
                        //       'In Process',
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        // ),
                        InkWell(
                          onTap: () {
                            choosed = 'done';
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(12),
                                // color: Colors.blue,
                                border: choosed == 'done'
                                    ? const Border(
                                        bottom: BorderSide(
                                            color: Colors.black, width: 2))
                                    : null),
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : (choosed == 'waiting' && waitingList.isEmpty) ||
                                (choosed == 'done' && doneList.isEmpty)
                            ? const Center(
                                child: Text('Data tidak ditemukan'),
                              )
                            : ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                itemCount: choosed == 'waiting'
                                    ? waitingList.length
                                    : doneList.length,
                                itemBuilder: (context, index) {
                                  final dataListViewBuilder =
                                      choosed == 'waiting'
                                          ? waitingList[index]
                                          : doneList[index];
                                  // String key =
                                  //     embeddingsResult!.keys.elementAt(index);

                                  // if (embeddingsResult![key]['userid'] !=
                                  //     '0U2cAeR4lJNK8I7Set3JE67RYD72') {
                                  //   return const SizedBox();
                                  // }
                                  return Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(bottom: 12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            Border.all(color: Colors.black87)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Method',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            '${dataListViewBuilder['metode']}'),
                                        // Text(
                                        //     '${embeddingsResult![key]['metode']}'),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Key',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            '${dataListViewBuilder['embed_key']}'),
                                        // SizedBox(height: 8),
                                        // Text(
                                        //   'Noise',
                                        //   style: TextStyle(
                                        //       fontWeight: FontWeight.bold),
                                        // ),
                                        // Text('Classical'),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Status',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(choosed == 'waiting'
                                            ? 'WAITING ADMIN'
                                            : 'DONE'),
                                        const SizedBox(height: 12),
                                        _buildImageAll(dataListViewBuilder),
                                        const SizedBox(height: 16),
                                        dataListViewBuilder[
                                                    'path_file_stego'] ==
                                                null
                                            ? const SizedBox()
                                            : _buildSaveAndShare(
                                                dataListViewBuilder)
                                      ],
                                    ),
                                  );
                                }),
                  ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Row _buildImageAll(Map<String, dynamic> dataListViewBuilder) {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            const Text(
              'Citra Host',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            FutureBuilder(
              future: FirebaseStorageService.downloadUrl(
                  '${dataListViewBuilder['path_file_citra']}${dataListViewBuilder['nama_file_citra']}'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Image.network(
                      snapshot.data!,
                      fit: BoxFit.fill,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return const SizedBox();
              },
            ),
          ],
        )),
        const SizedBox(width: 8),
        Expanded(
            child: Column(
          children: [
            const Text(
              'Watermark',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            FutureBuilder(
              future: FirebaseStorageService.downloadUrl(
                  '${dataListViewBuilder['path_file_watermark']}${dataListViewBuilder['nama_file_watermark']}'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Image.network(
                      snapshot.data!,
                      fit: BoxFit.fill,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return const SizedBox();
              },
            ),
          ],
        )),
        const SizedBox(width: 8),
        dataListViewBuilder['path_file_stego'] == null
            ? const SizedBox()
            : Expanded(
                child: Column(
                children: [
                  const Text(
                    'StegoImage',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FutureBuilder(
                    future: FirebaseStorageService.downloadUrl(
                        '${dataListViewBuilder['path_file_stego']}${dataListViewBuilder['nama_file_stego']}'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Image.network(
                            snapshot.data!,
                            fit: BoxFit.fill,
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      return Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ],
              ))
      ],
    );
  }

  Row _buildSaveAndShare(Map<String, dynamic> dataListViewBuilder) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: CustomColors.primaryPurple,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0),
          onPressed: () => downloadImage(
              '${dataListViewBuilder['path_file_stego']}${dataListViewBuilder['nama_file_stego']}'),
          child: Text(
            'Save',
            style: AppTypography.regular12.copyWith(
              fontSize: 14,
              color: CustomColors.primaryPurple,
            ),
          ),
        ),
        const SizedBox(width: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: CustomColors.primaryPurple,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0),
          onPressed: () async {
            final String url = await FirebaseStorageService.downloadUrl(
                '${dataListViewBuilder['path_file_stego']}${dataListViewBuilder['nama_file_stego']}');
            var file = await DefaultCacheManager().getSingleFile(url);
            XFile result = XFile(file.path);
            await Share.shareXFiles([result], text: 'Stego Image');
          },
          child: Text(
            'Share',
            style: AppTypography.regular12.copyWith(
              fontSize: 14,
              color: CustomColors.primaryPurple,
            ),
          ),
        ),
      ],
    );
  }
}
