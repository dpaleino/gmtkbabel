AC_INIT([gmtkbabel], [0.1], [d.paleino+gmtkbabel@gmail.com])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([foreign -Wall -Werror])
AM_GNU_GETTEXT_VERSION([0.18.1])
AM_GNU_GETTEXT([external])

AC_CHECK_PROGS([BASH], [bash], [:])
if test "$BASH" = :; then
    AC_MSG_ERROR([This package needs bash.])
fi

AC_CHECK_PROGS([ZENITY], [zenity], [:])
if test "$ZENITY" = :; then
    AC_MSG_ERROR([This package needs zenity.])
fi

AC_CHECK_PROGS([MTK], [mtkbabel], [:])
if test "$MTK" = :; then
    AC_MSG_ERROR([This package needs mtkbabel.])
fi

AC_CONFIG_FILES([
Makefile
po/Makefile
po/Makefile.in
src/Makefile
])
AC_OUTPUT
