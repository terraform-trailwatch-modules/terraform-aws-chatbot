resource "random_pet" "id" {}

output "id" {
  value = random_pet.id.id
}
