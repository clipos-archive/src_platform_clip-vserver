# SPDX-License-Identifier: LGPL-2.1-or-later
# Copyright © 2007-2018 ANSSI. All Rights Reserved.
INIT_FILES := clip_servers 
CONF_FILES := clip

INST_INIT := install -D -m 0500
INST_CONF  := install -D -m 0640

ifdef VDIR
SERVER_ROOT := ${VDIR}
else
SERVER_ROOT := /vservers
endif

all:

install: install_conf install_init install_jail

install_conf:
	${foreach file, ${CONF_FILES}, ${INST_CONF} conf.d/$(file) ${DESTDIR}/etc/conf.d/$(file); }

install_init:
	${foreach file, ${INIT_FILES}, ${INST_INIT} init/$(file) ${DESTDIR}/etc/init.d/$(file); }

install_jail:
	cp -a jails ${DESTDIR}/etc/
