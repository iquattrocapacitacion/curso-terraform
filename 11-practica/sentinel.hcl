policy "enforce-mandatory-tags" {
  source      = "enforce-mandatory-tags.sentinel"
  enforcement = "hard-mandatory"
}

policy "restrict-address_space" {
  source      = "restrict-address_space.sentinel"
  enforcement = "soft-mandatory"
}
