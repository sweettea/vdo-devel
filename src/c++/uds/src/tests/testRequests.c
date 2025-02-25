// SPDX-License-Identifier: GPL-2.0-only
/*
 * Copyright 2023 Red Hat
 */

#include "testRequests.h"

#include <linux/mutex.h>

#include "assertions.h"
#include "thread-utils.h"

static struct mutex request_mutex;
static struct cond_var request_cond;
static bool request_active;

/**********************************************************************/
void initialize_test_requests(void)
{
  mutex_init(&request_mutex);
  uds_init_cond(&request_cond);
}

/**********************************************************************/
void uninitialize_test_requests(void)
{
  mutex_destroy(&request_mutex);
#ifndef __KERNEL__
  uds_destroy_cond(&request_cond);
#endif  /* not __KERNEL__ */
}

/**********************************************************************/
static void success_callback(struct uds_request *request)
{
  UDS_ASSERT_SUCCESS(request->status);

  mutex_lock(&request_mutex);
  request_active = false;
  uds_broadcast_cond(&request_cond);
  mutex_unlock(&request_mutex);
}

/**********************************************************************/
void submit_test_request(struct uds_index *index,
                         struct uds_request *request)
{
  index_callback_fn old_callback = index->callback;

  request->zone_number = uds_get_volume_index_zone(index->volume_index, &request->record_name);
  index->callback = &success_callback;
  request->index = index;
  request->unbatched = true;
  mutex_lock(&request_mutex);
  request_active = true;
  mutex_unlock(&request_mutex);

  uds_enqueue_request(request, STAGE_TRIAGE);

  mutex_lock(&request_mutex);
  while (request_active) {
    uds_wait_cond(&request_cond, &request_mutex);
  }
  mutex_unlock(&request_mutex);
  index->callback = old_callback;
}

/**********************************************************************/
void verify_test_request(struct uds_index *index,
                         struct uds_request *request,
                         bool expectFound,
                         const struct uds_record_data *expectedMetaData)
{
  submit_test_request(index, request);
  CU_ASSERT_EQUAL(expectFound, request->found);
  if (expectFound && (expectedMetaData != NULL)) {
    UDS_ASSERT_BLOCKDATA_EQUAL(expectedMetaData, &request->old_metadata);
  }
}
