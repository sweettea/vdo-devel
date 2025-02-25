/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Copyright 2023 Red Hat
 */

#ifndef THREAD_UTILS_H
#define THREAD_UTILS_H

#include <linux/atomic.h>
#ifdef __KERNEL__
#ifdef TEST_INTERNAL
#include <linux/delay.h>
#include <linux/semaphore.h>
#endif /* TEST_INTERNAL */
#else
#include <pthread.h>
#include <sched.h>
#include <semaphore.h>
#include <stdbool.h>
#endif /* __KERNEL__ */

#if !(defined __KERNEL__) || defined(TEST_INTERNAL)
#include <linux/mutex.h>

#include "errors.h"
#include "time-utils.h"
#endif

/* Thread and synchronization utilities */

#ifdef __KERNEL__
struct thread;

void vdo_initialize_threads_mutex(void);
#else
struct semaphore {
	sem_t semaphore;
};

struct thread {
	pthread_t thread;
};

struct threads_barrier {
	pthread_barrier_t barrier;
};

unsigned int num_online_cpus(void);
pid_t __must_check uds_get_thread_id(void);

void vdo_perform_once(atomic_t *once_state, void (*function) (void));

#endif
int __must_check vdo_create_thread(void (*thread_function)(void *), void *thread_data,
				   const char *name, struct thread **new_thread);
void vdo_join_threads(struct thread *thread);
#ifdef __KERNEL__
#ifdef TEST_INTERNAL

/* Apply a function to every thread that we have created. */
void uds_apply_to_threads(void apply_function(void *, struct task_struct *),
			  void *argument);

/* This is a unit-test alternative to using BUG() or BUG_ON(). */
__attribute__((noreturn)) void uds_thread_exit(void);

static inline int __must_check uds_initialize_semaphore(struct semaphore *semaphore,
							unsigned int value)
{
	sema_init(semaphore, value);
	return UDS_SUCCESS;
}

static inline int uds_destroy_semaphore(struct semaphore *semaphore)
{
	return UDS_SUCCESS;
}

static inline void uds_acquire_semaphore(struct semaphore *semaphore)
{
	/*
	 * Do not use down(semaphore). Instead use down_interruptible so that
	 * we do not get 120 second stall messages in kern.log.
	 */
	while (down_interruptible(semaphore) != 0) {
		/*
		 * If we're called from a user-mode process (e.g., "dmsetup
		 * remove") while waiting for an operation that may take a
		 * while (e.g., UDS index save), and a signal is sent (SIGINT,
		 * SIGUSR2), then down_interruptible will not block. If that
		 * happens, sleep briefly to avoid keeping the CPU locked up in
		 * this loop. We could just call cond_resched, but then we'd
		 * still keep consuming CPU time slices and swamp other threads
		 * trying to do computational work.
		 */
		fsleep(1000);
	}
}

static inline bool __must_check uds_attempt_semaphore(struct semaphore *semaphore,
						      ktime_t timeout)
{
	unsigned int jiffies;

	if (timeout <= 0)
		return down_trylock(semaphore) == 0;

	jiffies = nsecs_to_jiffies(timeout);
	return down_timeout(semaphore, jiffies) == 0;
}

static inline void uds_release_semaphore(struct semaphore *semaphore)
{
	up(semaphore);
}
#endif  /* TEST_INTERNAL */
#else

void uds_get_thread_name(char *name);

static inline void cond_resched(void)
{
	/*
	 * On Linux sched_yield always succeeds so the result can be
	 * safely ignored.
	 */
	(void) sched_yield();
}

void initialize_threads_barrier(struct threads_barrier *barrier,
				unsigned int thread_count);
void destroy_threads_barrier(struct threads_barrier *barrier);
void enter_threads_barrier(struct threads_barrier *barrier);

int __must_check uds_initialize_semaphore(struct semaphore *semaphore,
					  unsigned int value);
int uds_destroy_semaphore(struct semaphore *semaphore);
void uds_acquire_semaphore(struct semaphore *semaphore);
bool __must_check uds_attempt_semaphore(struct semaphore *semaphore, ktime_t timeout);
void uds_release_semaphore(struct semaphore *semaphore);
#endif /* __KERNEL__ */

#endif /* UDS_THREADS_H */
