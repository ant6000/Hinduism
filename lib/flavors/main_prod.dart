import 'package:hinduism/flavors/flavor_config.dart';
import 'package:hinduism/flavors/main_common.dart';

void main() {
  mainCommon(
      flavor: Flavor.prod,
      baseUrl: "https://thecoder-prod.com/api/v1/",
      name: "The Coder Prod Flavor");
}
