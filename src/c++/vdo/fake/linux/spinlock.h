/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Unit test requirements from linux/spinlock.h.
 *
 * Copyright 2023 Red Hat
 *
 */

#ifndef LINUX_SPINLOCK_H
#define LINUX_SPINLOCK_H

#include <linux/list.h>

typedef struct mutex spinlock_t;

#define DEFINE_SPINLOCK(x) spinlock_t x = UDS_MUTEX_INITIALIZER

#define spin_lock_init(lock) mutex_init(lock)
#define spin_lock(lock) mutex_lock(lock)
#define spin_unlock(lock) mutex_unlock(lock)
#define spin_lock_bh(lock) mutex_lock(lock)
#define spin_unlock_bh(lock) mutex_unlock(lock)
#define spin_trylock(lock) mutex_trylock(lock)

typedef struct mutex rwlock_t;

#define rwlock_init(lock) mutex_init(lock)
#define read_lock(lock) mutex_lock(lock)
#define read_unlock(lock) mutex_unlock(lock)
#define write_lock(lock) mutex_lock(lock)
#define write_unlock(lock) mutex_unlock(lock)

#endif // LINUX_SPINLOCK_H
