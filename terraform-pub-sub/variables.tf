
variable "project_id" {
  type        = string
  description = "The project ID to manage the Pub/Sub resources."
}

variable "create_topics" {
  type        = map(bool)
  description = "Whether to create the Pub/Sub topic."
  default     = {}

}

variable "topics" {
  type        = list(string)
  description = "The name of the Pub/Sub topics to create."
}

variable "create_subscriptions" {
  type        = map(bool)
  description = "Whether to create the Pub/Sub subscriptions."
  default     = {}
}

variable "subscriptions" {
  description = "List subscriptions of pubsub topics"
  type        = map(list(string))
  default     = {}
}

variable "message_storage_policies" {
  type        = map(any)
  description = "A map of storage policies. Default - inherit from organization's Resource Location Restriction policy."
  default     = {}
}


variable "message_retention_durations" {
  type        = map(string)
  description = "The minimum duration in seconds to retain a message after it is published to the topic."
  default     = {}
}


variable "retain_acked_messages" {
  type        = map(bool)
  description = "Whether to retain acknowledged messages. Default - inherit from organization's Resource Location Restriction policy."
  default     = {}
}


variable "expiration_policies" {
  type        = map(string)
  description = "A map of expiration policies. Default - inherit from organization's Resource Location Restriction policy."
  default     = {}

}

variable "enable_message_orderings" {
  type        = map(bool)
  description = "Whether message ordering is enabled. Default - inherit from organization's Resource Location Restriction policy."
  default     = {}
}

variable "enable_exactly_once_deliveries" {
  type        = map(bool)
  description = "Whether exactly once delivery is enabled. Default - inherit from organization's Resource Location Restriction policy."
  default     = {}

}

variable "ack_deadline_seconds" {
  type        = map(number)
  description = "The amount of time in seconds that the message is non-acknowledged. Default - inherit from organization's Resource Location Restriction policy."
  default     = {}

}

variable "retry_policies" {
  type        = map(list(string))
  description = "The amount of time in seconds that the message is non-acknowledged. Default - inherit from organization's Resource Location Restriction policy."
  default     = {}
}

variable "filters" {
  type        = map(string)
  description = "The list of filters to apply."
  default     = {}

}