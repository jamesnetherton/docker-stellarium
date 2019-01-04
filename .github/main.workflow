workflow "New workflow" {
  on = "create"
  resolves = ["Docker Tag"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@76ff57a"
  args = "build . -t jamesnetherton/stellarium:latest"
}

action "Docker Tag" {
  uses = "actions/docker/tag@76ff57a"
  needs = ["GitHub Action for Docker"]
  args = "jamesnetherton/stellarium:latest jamesnetherton/stellarium --no-latest --no-sha"
}
