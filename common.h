#ifndef fsevent_watch_common_h
#define fsevent_watch_common_h

#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <unistd.h>
#include "compat.h"

#define _str(s) #s
#define _xstr(s) _str(s)

#define COMPILED_AT __DATE__ " " __TIME__

#define FPRINTF_FLAG_CHECK(flags, flag, msg, fd)  \
  do {                                            \
    if ((flags) & (flag)) {                       \
      fprintf(fd, "%s\n", msg); } }               \
  while (0)

#define FLAG_CHECK_STDERR(flags, flag, msg)       \
        FPRINTF_FLAG_CHECK(flags, flag, msg, stderr)


#endif /* fsevent_watch_common_h */
