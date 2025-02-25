/*
 * %COPYRIGHT%
 *
 * %LICENSE%
 *
 * $Id$
 */

#include "callbackWrappingUtils.h"

#include "memory-alloc.h"
#include "thread-utils.h"

#include "completion.h"
#include "int-map.h"

#include "asyncLayer.h"
#include "mutexUtils.h"
#include "vdoAsserts.h"
#include "vdoTestBase.h"

typedef struct {
  vdo_action_fn callback;
  vdo_action_fn errorHandler;
} SavedActions;

static struct int_map          *wrapMap    = NULL;
static struct int_map          *enqueueMap = NULL;
static struct mutex             mutex;

/**
 * Implements TearDownAction
 **/
static void tearDown(void)
{
  vdo_int_map_free(vdo_forget(wrapMap));
  vdo_int_map_free(vdo_forget(enqueueMap));
  mutex_destroy(&mutex);
}

/**********************************************************************/
void initializeCallbackWrapping(void)
{
  mutex_init(&mutex);
  VDO_ASSERT_SUCCESS(vdo_int_map_create(0, &wrapMap));
  VDO_ASSERT_SUCCESS(vdo_int_map_create(0, &enqueueMap));
  registerTearDownAction(tearDown);
}

/**********************************************************************/
static void wrapCompletion(struct vdo_completion *completion,
                           vdo_action_fn          callback,
                           vdo_action_fn          errorHandler)
{
  CU_ASSERT_PTR_NOT_NULL(completion->callback);

  SavedActions *actions;
  VDO_ASSERT_SUCCESS(vdo_allocate(1, SavedActions, __func__, &actions));
  *actions = (SavedActions) {
    .callback     = completion->callback,
    .errorHandler = completion->error_handler,
  };

  SavedActions *old;
  mutex_lock(&mutex);
  VDO_ASSERT_SUCCESS(vdo_int_map_put(wrapMap,
                                     (uintptr_t) completion,
                                     actions,
                                     false,
                                     (void **) &old));
  mutex_unlock(&mutex);
  CU_ASSERT_PTR_NULL(old);

  completion->callback      = callback;
  completion->error_handler = errorHandler;
}

/**********************************************************************/
void
wrapCompletionCallbackAndErrorHandler(struct vdo_completion *completion,
                                      vdo_action_fn          callback,
                                      vdo_action_fn          errorHandler)
{
  wrapCompletion(completion, callback, errorHandler);
}

/**
 * Run the saved callback (from a callback wrapper).
 *
 * @param completion  The completion
 *
 * @return whether or not the completion requeued
 **/
static bool runSaved(struct vdo_completion *completion)
{
  bool requeued = false;
  bool *old = NULL;

  mutex_lock(&mutex);
  SavedActions *actions = vdo_int_map_remove(wrapMap, (uintptr_t) completion);
  VDO_ASSERT_SUCCESS(vdo_int_map_put(enqueueMap,
                                     (uintptr_t) completion,
                                     &requeued,
                                     false,
                                     (void **) &old));
  mutex_unlock(&mutex);

  CU_ASSERT_PTR_NOT_NULL(actions);
  CU_ASSERT_PTR_NULL(old);

  completion->callback      = actions->callback;
  completion->error_handler = actions->errorHandler;
  vdo_free(actions);
  vdo_run_completion(completion);

  if (requeued) {
    return true;
  }

  mutex_lock(&mutex);
  vdo_int_map_remove(enqueueMap, (uintptr_t) completion);
  mutex_unlock(&mutex);

  return false;
}

/**********************************************************************/
bool runSavedCallback(struct vdo_completion *completion)
{
  return runSaved(completion);
}

/**********************************************************************/
void runSavedCallbackAssertRequeue(struct vdo_completion *completion)
{
  CU_ASSERT(runSavedCallback(completion));
}

/**********************************************************************/
void runSavedCallbackAssertNoRequeue(struct vdo_completion *completion)
{
  CU_ASSERT_FALSE(runSavedCallback(completion));
}

/**********************************************************************/
void notifyEnqueue(struct vdo_completion *completion)
{
  mutex_lock(&mutex);
  bool *requeued = vdo_int_map_remove(enqueueMap, (uintptr_t) completion);
  if (requeued != NULL) {
    *requeued = true;
  }
  mutex_unlock(&mutex);
}

