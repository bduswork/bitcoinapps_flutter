
import 'package:btcapp/models/block_model/block_model.dart';
import 'package:btcapp/utils/env.dart';
import 'package:http/http.dart' as http;

class BlockService {

  Future<BlockModel> fetchPublicGeneralBlocks() async {
    print("block Service called");
    final response = await http.get(Uri.parse('$baseUrl/public/general-menu-list'));
    if (response.statusCode == 200) {
      print(response.body.toString());
      BlockModel blockModel = blockModelFromJson(response.body);
      // List<dynamic> data = json.decode(response.body)['data'];
      // return data.map((block) => blockModelFromJson(block)).toList();
      return blockModel;
    } else {
      throw Exception('Failed to load blocks');
    }
  }
}