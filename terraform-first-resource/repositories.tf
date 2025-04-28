resource "github_repository" "my-first-terraform" {
  name         = "my-first-repo-terraform"
  description  = "This is my first repository from terraform"

  visibility   = "public"
  auto_init = true
}