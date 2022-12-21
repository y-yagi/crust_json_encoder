use magnus::{define_module, function, Error};

use phf::phf_map;

static JSON_ESCAPE: phf::Map<&'static str, &'static str> = phf_map! {
    "\u{2028}" => r"\u2028",
    "\u{2029}" => r"\u2029",
    ">"       => r"\u003e",
    "<"       => r"\u003c",
    "&"       => r"\u0026",
};

fn escape(input: String) -> String {
    let mut result = input;

    for escape in &JSON_ESCAPE {
        if result.contains(escape.0) {
            result = result.replace(escape.0, escape.1)
        }
    }

    result
}

#[magnus::init]
fn init() -> Result<(), Error> {
    let module = define_module("JSONEscaper")?;
    module.define_module_function("escape", function!(escape, 1))?;
    Ok(())
}
