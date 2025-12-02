# policy "enforce-mandatory-tags" {
#   source      = "enforce-mandatory-tags.sentinel"
#   enforcement = "hard-mandatory"
# }

# policy "restrict-address_space" {
#   source      = "restrict-address_space.sentinel"
#   enforcement = "soft-mandatory"
# }

policy "enforce-mandatory-tags" {
    enforcement_level = "hard-mandatory"
    # enforcement_level = "advisory-mandatory"
}

policy "restrict-address_space" {
    enforcement_level = "soft-mandatory"
}