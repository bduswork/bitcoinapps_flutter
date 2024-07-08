import 'package:btcapp/models/block_model/block_model.dart';
import 'package:btcapp/service/block_service/block_service.dart';
import 'package:flutter/material.dart';

class BlockProvider extends ChangeNotifier{
  final BlockService _blockService = BlockService();
  BlockModel? _blockModel;
  bool _isLoading = false;
  String _errorMessage = '';

  BlockModel? get blockModel => _blockModel;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  BlockProvider() {
    fetchPublicGeneralBlocks();
  }

  Future<void> fetchPublicGeneralBlocks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _blockModel = await _blockService.fetchPublicGeneralBlocks();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    }
    //setFullBlockData();
    _isLoading = false;
    notifyListeners();
  }

  void swapBlocks(int index) {
    if (index > 0 && index < _blockModel!.data.length) {
      final temp = _blockModel!.data[0];
      _blockModel!.data[0] = _blockModel!.data[index];
      _blockModel!.data[index] = temp;
      notifyListeners();
    }
  }


  // String _fullBlockTitle = "";
  // String get fullBlockTitle => _fullBlockTitle;

  // void setFullBlockData(){
  //   _fullBlockTitle = _blockModel!.data[0].subMenuName;
  //   notifyListeners();
  // }
}