#[macro_use]
extern crate helix;

use phf::phf_map;

static JSON_ESCAPE: phf::Map<&'static str, &'static str> = phf_map! {
    ">" => "\\u003e",
    "<" => "\\u003c",
};

pub fn escape(input: String) -> String {
    let mut result = input.clone();
    for escape in &JSON_ESCAPE {
        result = result.replace(escape.0, escape.1)
    }

    result
}

ruby! {
    class RailsJSONGemEncoder {
        def escape(input: String) -> String {
            let mut result = input.clone();
            for escape in &JSON_ESCAPE {
                result = result.replace(escape.0, escape.1)
            }

            result
        }
    }
}

#[cfg(test)]
mod tests {
    use crate::escape;

    #[test]
    fn contains_special_chars() {
        let input = "this is the <string>";
        assert_eq!(escape(input.to_string()), "this is the \\u003cstring\\u003e");
    }
}
