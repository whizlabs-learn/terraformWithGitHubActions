variable "instance_zone" {
  description = "Zone in which instance will be created. Cannot be changed later."
  type        = string
  default     = "us-central1-a"
}

variable "instance_name" {
  description = "Name of the Web Server Instance."
  type        = string
  default     = "whizlabs-instance"
}

variable "instance_type" {
  description = "Type of Instance to be created."
  type        = string
  default     = "e2-micro"
}

variable "disk_size" {
  description = "Boot disk size of the instance."
  type        = string
  default     = "10"
}
