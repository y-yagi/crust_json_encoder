#[macro_use]
extern crate rutie;

use phf::phf_map;
use rutie::{Class, Object, RString, VM};

static JSON_ESCAPE: phf::Map<&'static str, &'static str> = phf_map! {
    "\u{2028}" => r"\u2028",
    "\u{2029}" => r"\u2029",
    ">"       => r"\u003e",
    "<"       => r"\u003c",
    "&"       => r"\u0026",
};

class!(JSONEscaper);

methods!(
    JSONEscaper,
    _itself,
    fn escape(input: RString) -> RString {
        let mut result = input.map_err(|e| VM::raise_ex(e)).unwrap().to_string();

        for escape in &JSON_ESCAPE {
            if result.contains(escape.0) {
                result = result.replace(escape.0, escape.1)
            }
        }

        RString::new_utf8(&result)
    }
);

#[allow(non_snake_case)]
#[no_mangle]
pub extern "C" fn Init_native() {
    Class::new("JSONEscaper", None).define(|itself| {
        itself.def_self("escape", escape);
    });
}
