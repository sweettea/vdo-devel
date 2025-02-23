// SPDX-License-Identifier: GPL-2.0-only
/*
 * Copyright 2023 Red Hat
 */

#include <errno.h>
#include <stdlib.h>

#include "permassert.h"
#include "string-utils.h"
#include "thread-utils.h"

static enum mutex_kind {
	fast_adaptive,
	error_checking
} hidden_mutex_kind = error_checking;

const bool UDS_DO_ASSERTIONS = true;

/**********************************************************************/
static void initialize_mutex_kind(void)
{
	static const char UDS_MUTEX_KIND_ENV[] = "UDS_MUTEX_KIND";
	const char *mutex_kind_string = getenv(UDS_MUTEX_KIND_ENV);

#ifdef NDEBUG
	/*
	 * Enabling error checking on mutexes enables a great performance loss,
	 * so we only enable it in certain circumstances.
	 */
	hidden_mutex_kind = fast_adaptive;
#endif
	if (mutex_kind_string != NULL) {
		if (strcmp(mutex_kind_string, "error-checking") == 0)
			hidden_mutex_kind = error_checking;
		else if (strcmp(mutex_kind_string, "fast-adaptive") == 0)
			hidden_mutex_kind = fast_adaptive;
		else
			VDO_ASSERT_LOG_ONLY(false,
					    "environment variable %s had unexpected value '%s'",
					    UDS_MUTEX_KIND_ENV,
					    mutex_kind_string);
	}
}

/**********************************************************************/
static enum mutex_kind get_mutex_kind(void)
{
	static atomic_t once_state = ATOMIC_INIT(0);

	vdo_perform_once(&once_state, initialize_mutex_kind);
	return hidden_mutex_kind;
}

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

	if (get_mutex_kind() == error_checking)
		pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ERRORCHECK);

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
