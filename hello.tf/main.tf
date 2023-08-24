terraform {
  required_version = ">= 0.12.26"
}

variable "subject" {
   type = string
   default = "World"
   description = "Subject to hello"
}

resource "random_id" "id" {
  keepers = {
    trigger = var.subject
  }

  byte_length = 4
}

output "hello_world" {
  value = "Hello Test, ${var.subject}!"
}
