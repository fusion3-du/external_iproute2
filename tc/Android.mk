LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
# clang cannot compile 'variable length array in structure' in ipxfrm.c
LOCAL_CLANG := false
LOCAL_SRC_FILES :=  tc.c tc_qdisc.c q_cbq.c tc_util.c tc_class.c tc_core.c m_action.c \
                    m_estimator.c tc_filter.c tc_monitor.c tc_stab.c tc_cbq.c \
                    tc_estimator.c f_u32.c m_police.c q_ingress.c m_mirred.c q_htb.c q_cake.c q_cake0.c q_cake2.c \
		    q_fq_codel.c tc_exec.c q_pie.c q_fq.c q_prio.c q_hhf.c q_multiq.c q_mqprio.c q_fq_pie.c \
		    q_choke.c q_codel.c q_drr.c q_dsmark.c q_gred.c q_hfsc.c q_netem.c q_qfq.c q_red.c \
		    q_sfb.c q_sfq.c q_tbf.c tc_red.c

LOCAL_MODULE := tc

LOCAL_SYSTEM_SHARED_LIBRARIES := \
	libc libm libdl

LOCAL_SHARED_LIBRARIES += libiprouteutil libnetlink

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include

LOCAL_CFLAGS := -O2 -g -W -Wall -Wno-pointer-arith -Wno-sign-compare -Werror \
    -Wno-unused-parameter \
    -Wno-missing-field-initializers -Wno-type-limits

# This is a work around for b/18403920
LOCAL_LDFLAGS := -Wl,--no-gc-sections

include $(BUILD_EXECUTABLE)

