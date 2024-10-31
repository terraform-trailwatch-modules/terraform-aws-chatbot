run "setup" {
  module {
    source = "./tests/setup"
  }
}

run "create_destroy" {
  command = apply
  variables {
    id = run.setup.id
  }
}
