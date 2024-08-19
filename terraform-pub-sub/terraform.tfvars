# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

project_id = "k8s-learn-415708"


topics = ["tlj-trans-prod", "batch-job-prod", "noti-prod"]


create_topics = {
  tlj-trans-prod = true,
  batch-job-prod = true,
  noti-prod      = true
}

subscriptions = {
  tlj-trans-prod = [
    "tlj-stamp-prod-sub",
    "tlj-voucher-prod-sub",
    "tlj-point-prod-sub",
    "tlj-bulk-prod-sub"
  ],

  batch-job-prod = [
    "voucher-insert-prod-sub",
    "promotion-insert-prod-sub",
    "stamp-insert-prod-sub"
  ],

  noti-prod = [
    "noti-prod-sub",
    "noti-bulk-prod-sub"
  ]
}

create_subscriptions = {
  tlj-stamp-prod-sub        = true,
  tlj-voucher-prod-sub      = true,
  tlj-point-prod-sub        = true,
  tlj-bulk-prod-sub         = true,
  voucher-insert-prod-sub   = true,
  promotion-insert-prod-sub = true,
  stamp-insert-prod-sub     = true,
  noti-prod-sub             = true,
  noti-bulk-prod-sub        = true
}


message_retention_durations = {
  tlj-stamp-prod-sub        = "604800s",
  tlj-voucher-prod-sub      = "604800s",
  tlj-point-prod-sub        = "604800s",
  tlj-bulk-prod-sub         = "604800s",
  voucher-insert-prod-sub   = "604800s",
  promotion-insert-prod-sub = "604800s",
  stamp-insert-prod-sub     = "604800s",
  noti-prod-sub             = "604800s",
  noti-bulk-prod-sub        = "604800s"
}

retain_acked_messages = {
  tlj-stamp-prod-sub        = false,
  tlj-voucher-prod-sub      = false,
  tlj-point-prod-sub        = false,
  tlj-bulk-prod-sub         = false,
  voucher-insert-prod-sub   = false,
  promotion-insert-prod-sub = false,
  stamp-insert-prod-sub     = false,
  noti-prod-sub             = false,
  noti-bulk-prod-sub        = false
}

ack_deadline_seconds = {
  tlj-stamp-prod-sub        = 10,
  tlj-voucher-prod-sub      = 10,
  tlj-point-prod-sub        = 10,
  tlj-bulk-prod-sub         = 20,
  voucher-insert-prod-sub   = 30,
  promotion-insert-prod-sub = 30,
  stamp-insert-prod-sub     = 30,
  noti-prod-sub             = 10,
  noti-bulk-prod-sub        = 30
}


enable_message_orderings = {
  tlj-stamp-prod-sub        = true,
  tlj-voucher-prod-sub      = false,
  tlj-point-prod-sub        = false,
  tlj-bulk-prod-sub         = true,
  voucher-insert-prod-sub   = true,
  promotion-insert-prod-sub = true,
  stamp-insert-prod-sub     = false,
  noti-prod-sub             = false,
  noti-bulk-prod-sub        = false
}


enable_exactly_once_deliveries = {
  tlj-stamp-prod-sub        = false,
  tlj-voucher-prod-sub      = false,
  tlj-point-prod-sub        = false,
  tlj-bulk-prod-sub         = false,
  voucher-insert-prod-sub   = false,
  promotion-insert-prod-sub = false,
  stamp-insert-prod-sub     = false,
  noti-prod-sub             = false,
  noti-bulk-prod-sub        = false
}


expiration_policies = {
  tlj-stamp-prod-sub        = "604800s",
  tlj-voucher-prod-sub      = "604800s",
  tlj-point-prod-sub        = "604800s",
  tlj-bulk-prod-sub         = "604800s",
  voucher-insert-prod-sub   = "604800s",
  promotion-insert-prod-sub = "604800s",
  stamp-insert-prod-sub     = "604800s",
  noti-prod-sub             = "604800s",
  noti-bulk-prod-sub        = "604800s"
}


retry_policies = {
  tlj-stamp-prod-sub        = ["5s", "120s"],
  tlj-voucher-prod-sub      = ["5s", "120s"],
  tlj-point-prod-sub        = ["5s", "120s"],
  tlj-bulk-prod-sub         = ["5s", "120s"],
  voucher-insert-prod-sub   = ["5s", "120s"],
  promotion-insert-prod-sub = ["5s", "120s"],
  stamp-insert-prod-sub     = ["5s", "120s"],
  noti-prod-sub             = ["5s", "120s"],
  noti-bulk-prod-sub        = ["5s", "120s"]
}


filters = {
  noti-prod-sub      = "NOT attributes:name",
  noti-bulk-prod-sub = "attributes.name = \"bulk\""
}


