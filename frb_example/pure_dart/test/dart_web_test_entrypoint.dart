/// NOTE: This file is auto-generated by frb_internal. Please do not manually modify it.

import 'package:flutter_rust_bridge_utils/flutter_rust_bridge_utils_web.dart';

import 'api/external_type_in_crate_test.dart' as external_type_in_crate_test;
import 'api/tuple_test.dart' as tuple_test;
import 'api/newtype_pattern_test.dart' as newtype_pattern_test;
import 'api/simple_test.dart' as simple_test;
import 'api/mirror_test.dart' as mirror_test;
import 'api/stream_test.dart' as stream_test;
import 'api/rust_opaque_sync_test.dart' as rust_opaque_sync_test;
import 'api/dart_opaque_sync_test.dart' as dart_opaque_sync_test;
import 'api/pseudo_manual/enumeration_twin_sync_test.dart'
    as enumeration_twin_sync_test;
import 'api/pseudo_manual/simple_twin_sync_test.dart' as simple_twin_sync_test;
import 'api/pseudo_manual/primitive_twin_sync_test.dart'
    as primitive_twin_sync_test;
import 'api/pseudo_manual/optional_primitive_twin_sync_test.dart'
    as optional_primitive_twin_sync_test;
import 'api/pseudo_manual/primitive_list_test.dart' as primitive_list_test;
import 'api/pseudo_manual/exception_twin_sync_test.dart'
    as exception_twin_sync_test;
import 'api/pseudo_manual/primitive_test.dart' as primitive_test;
import 'api/pseudo_manual/structure_twin_sync_test.dart'
    as structure_twin_sync_test;
import 'api/pseudo_manual/comment_twin_sync_test.dart'
    as comment_twin_sync_test;
import 'api/pseudo_manual/optional_primitive_test.dart'
    as optional_primitive_test;
import 'api/pseudo_manual/primitive_list_twin_sync_test.dart'
    as primitive_list_twin_sync_test;
import 'api/pseudo_manual/misc_type_twin_sync_test.dart'
    as misc_type_twin_sync_test;
import 'api/dart_dynamic_test.dart' as dart_dynamic_test;
import 'api/method_test.dart' as method_test;
import 'api/misc_type_test.dart' as misc_type_test;
import 'api/attribute_test.dart' as attribute_test;
import 'api/rust_opaque_test.dart' as rust_opaque_test;
import 'api/inside_macro_test.dart' as inside_macro_test;
import 'api/type_alias_test.dart' as type_alias_test;
import 'api/array_test.dart' as array_test;
import 'api/dart_opaque_test.dart' as dart_opaque_test;
import 'api/primitive_list_misc_test.dart' as primitive_list_misc_test;
import 'api/exception_test.dart' as exception_test;
import 'api/optional_primitive_misc_test.dart' as optional_primitive_misc_test;
import 'api/event_listener_test.dart' as event_listener_test;
import 'api/chrono_type_test.dart' as chrono_type_test;
import 'api/optional_test.dart' as optional_test;
import 'api/comment_test.dart' as comment_test;
import 'api/misc_example_test.dart' as misc_example_test;
import 'api/primitive_misc_test.dart' as primitive_misc_test;
import 'api/uuid_type_test.dart' as uuid_type_test;
import 'api/raw_string_test.dart' as raw_string_test;
import 'api/enumeration_test.dart' as enumeration_test;
import 'api/structure_test.dart' as structure_test;

void main() {
  dartWebTestEntrypoint(() async {
    await RustLib.init();

    await external_type_in_crate_test.main(skipRustLibInit: true);
    await tuple_test.main(skipRustLibInit: true);
    await newtype_pattern_test.main(skipRustLibInit: true);
    await simple_test.main(skipRustLibInit: true);
    await mirror_test.main(skipRustLibInit: true);
    await stream_test.main(skipRustLibInit: true);
    await rust_opaque_sync_test.main(skipRustLibInit: true);
    await dart_opaque_sync_test.main(skipRustLibInit: true);
    await enumeration_twin_sync_test.main(skipRustLibInit: true);
    await simple_twin_sync_test.main(skipRustLibInit: true);
    await primitive_twin_sync_test.main(skipRustLibInit: true);
    await optional_primitive_twin_sync_test.main(skipRustLibInit: true);
    await primitive_list_test.main(skipRustLibInit: true);
    await exception_twin_sync_test.main(skipRustLibInit: true);
    await primitive_test.main(skipRustLibInit: true);
    await structure_twin_sync_test.main(skipRustLibInit: true);
    await comment_twin_sync_test.main(skipRustLibInit: true);
    await optional_primitive_test.main(skipRustLibInit: true);
    await primitive_list_twin_sync_test.main(skipRustLibInit: true);
    await misc_type_twin_sync_test.main(skipRustLibInit: true);
    await dart_dynamic_test.main(skipRustLibInit: true);
    await method_test.main(skipRustLibInit: true);
    await misc_type_test.main(skipRustLibInit: true);
    await attribute_test.main(skipRustLibInit: true);
    await rust_opaque_test.main(skipRustLibInit: true);
    await inside_macro_test.main(skipRustLibInit: true);
    await type_alias_test.main(skipRustLibInit: true);
    await array_test.main(skipRustLibInit: true);
    await dart_opaque_test.main(skipRustLibInit: true);
    await primitive_list_misc_test.main(skipRustLibInit: true);
    await exception_test.main(skipRustLibInit: true);
    await optional_primitive_misc_test.main(skipRustLibInit: true);
    await event_listener_test.main(skipRustLibInit: true);
    await chrono_type_test.main(skipRustLibInit: true);
    await optional_test.main(skipRustLibInit: true);
    await comment_test.main(skipRustLibInit: true);
    await misc_example_test.main(skipRustLibInit: true);
    await primitive_misc_test.main(skipRustLibInit: true);
    await uuid_type_test.main(skipRustLibInit: true);
    await raw_string_test.main(skipRustLibInit: true);
    await enumeration_test.main(skipRustLibInit: true);
    await structure_test.main(skipRustLibInit: true);
  });
}
