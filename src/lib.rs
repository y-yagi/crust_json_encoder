#[macro_use]
extern crate helix;

use phf::phf_map;

static JSON_ESCAPE: phf::Map<&'static str, &'static str> = phf_map! {
    "\u{2028}" => r"\\u2028",
    "\u{2029}" => r"\\u2029",
    ">"       => r"\u003e",
    "<"       => r"\u003c",
    "&"       => r"\u0026",
};

pub fn escape(input: String) -> String {
    let mut result = input.clone();
    for escape in &JSON_ESCAPE {
        result = result.replace(escape.0, escape.1)
    }

    result
}

ruby! {
    class JSONEscaper {
        def escape(input: String) -> String {
            escape(input)
        }
    }
}

#[cfg(test)]
mod tests {
    use crate::escape;

    #[test]
    fn contains_special_chars() {
        let input = "this is the <string> & \u{2028} \u{2029}";
        assert_eq!(escape(input.to_string()), "this is the \\u003cstring\\u003e \\u0026 \\\\u2028 \\\\u2029");
    }
}
