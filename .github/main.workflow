workflow "New workflow" {
  on = "push"
  resolves = ["Docker Tag"]
}

action "Docker Tag" {
  uses = "actions/docker/tag@master"
  args = "-l -r"
}
