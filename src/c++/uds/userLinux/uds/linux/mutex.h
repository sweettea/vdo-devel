/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Wrap our own mutexes to mimic the kernel.
 *
 * Copyright 2023 Red Hat
 *
 */

#ifndef LINUX_MUTEX_H
#define LINUX_MUTEX_H

#include "thread-utils.h"

struct mutex {
	pthread_mutex_t mutex;
};

#define DEFINE_MUTEX(mutexname) \
	struct mutex mutexname = UDS_MUTEX_INITIALIZER

/* We could define this as pthread_mutex_init() only for NDEBUG, but we build
 * the main program with NDEBUG and tests without NDEBUG, leading to linking
 * problems if we did so.
 */
int mutex_init(struct mutex *mutex);

#ifndef NDEBUG

#define UDS_MUTEX_INITIALIZER { .mutex = PTHREAD_ERRORCHECK_MUTEX_INITIALIZER_NP }
#define mutex_destroy(M) pthread_mutex_destroy(&(M)->mutex)
#define mutex_lock(M)    pthread_mutex_lock(&(M)->mutex)
#define mutex_unlock(M)  pthread_mutex_unlock(&(M)->mutex)
#define mutex_trylock(M) pthread_mutex_trylock(&(M)->mutex)

#else

#define UDS_MUTEX_INITIALIZER { .mutex = PTHREAD_MUTEX_INITIALIZER }
#define mutex_destroy(M) VDO_ASSERT_LOG_ONLY((pthread_mutex_destroy(&(M)->mutex) == 0), "pthread destroy error")
#define mutex_lock(M) VDO_ASSERT_LOG_ONLY((pthread_mutex_lock(&(M)->mutex) == 0), "pthread lock error")
#define mutex_unlock(M) VDO_ASSERT_LOG_ONLY((pthread_mutex_unlock(&(M)->mutex) == 0), "pthread unlock error")
#define mutex_trylock(M) VDO_ASSERT_LOG_ONLY((pthread_mutex_trylock(&(M)->mutex) != EINVAL), "pthread trylock error")
#endif /* !NDEBUG */

#endif // LINUX_MUTEX_H
