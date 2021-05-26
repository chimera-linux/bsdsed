#ifndef CDEFS_H
#define CDEFS_H

#define __FBSDID(x)

/* other compat bits */

#define	DEFFILEMODE	(S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)
#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)

extern char *__progname;

#define __unreachable()
#define getprogname() __progname

void errc(int status, int code, const char *format, ...);

#endif
