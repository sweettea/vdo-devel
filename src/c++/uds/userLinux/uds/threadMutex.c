// SPDX-License-Identifier: GPL-2.0-only
/*
 * Copyright 2023 Red Hat
 */

#include <errno.h>
#include <stdlib.h>

#include "permassert.h"
#include "string-utils.h"
#include "thread-utils.h"

/**********************************************************************/
int uds_init_mutex(struct mutex *mutex)
{
	pthread_mutexattr_t attr;
	int result;
	int result2;

	result = pthread_mutexattr_init(&attr);
	if (result != 0) {
		VDO_ASSERT_LOG_ONLY((result == 0), "pthread_mutexattr_init error");
		return result;
	}

#ifndef NDEBUG
	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ERRORCHECK);
#endif

	// While this function returns an int, it's guaranteed to always be 0.
	pthread_mutex_init(&mutex->mutex, &attr);

	result2 = pthread_mutexattr_destroy(&attr);
	if (result2 != 0) {
		VDO_ASSERT_LOG_ONLY((result2 == 0),
				    "pthread_mutexattr_destroy error");
		if (result == UDS_SUCCESS)
			result = result2;
	}

	return result;
}

/**********************************************************************/
int uds_destroy_mutex(struct mutex *mutex)
{
	int result;

	result = pthread_mutex_destroy(&mutex->mutex);
	VDO_ASSERT_LOG_ONLY((result == 0), "pthread_mutex_destroy error");
	return result;
}

/**********************************************************************/
void uds_lock_mutex(struct mutex *mutex)
{
	int result __attribute__((unused));

	result = pthread_mutex_lock(&mutex->mutex);
#ifndef NDEBUG
	VDO_ASSERT_LOG_ONLY((result == 0),
			    "pthread_mutex_lock error %d", result);
#endif
}

/**********************************************************************/
void uds_unlock_mutex(struct mutex *mutex)
{
	int result __attribute__((unused));

	result = pthread_mutex_unlock(&mutex->mutex);
#ifndef NDEBUG
	VDO_ASSERT_LOG_ONLY((result == 0),
			    "pthread_mutex_unlock error %d", result);
#endif
}
