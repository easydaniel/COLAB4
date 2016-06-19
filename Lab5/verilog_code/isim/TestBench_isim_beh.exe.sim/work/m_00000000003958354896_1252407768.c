/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/easy/Documents/Xilinx/COLAB5/Sign_Extend.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {65535U, 0U};



static void Cont_27_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t16[8];
    char t23[8];
    char t24[8];
    char t27[8];
    char t46[8];
    char t53[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t25;
    char *t26;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1208U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t19 = *((unsigned int *)t4);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t23, 8);

LAB16:    t56 = (t0 + 2928);
    t57 = (t56 + 56U);
    t58 = *((char **)t57);
    t59 = (t58 + 56U);
    t60 = *((char **)t59);
    memcpy(t60, t3, 8);
    xsi_driver_vfirst_trans(t56, 0, 31);
    t61 = (t0 + 2848);
    *((int *)t61) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t17 = (t0 + 1048U);
    t18 = *((char **)t17);
    t17 = ((char*)((ng1)));
    xsi_vlogtype_concat(t16, 32, 32, 2U, t17, 16, t18, 16);
    goto LAB9;

LAB10:    t25 = (t0 + 1048U);
    t26 = *((char **)t25);
    memset(t27, 0, 8);
    t25 = (t27 + 4);
    t28 = (t26 + 4);
    t29 = *((unsigned int *)t26);
    t30 = (t29 >> 15);
    t31 = (t30 & 1);
    *((unsigned int *)t27) = t31;
    t32 = *((unsigned int *)t28);
    t33 = (t32 >> 15);
    t34 = (t33 & 1);
    *((unsigned int *)t25) = t34;
    memset(t24, 0, 8);
    t35 = (t27 + 4);
    t36 = *((unsigned int *)t35);
    t37 = (~(t36));
    t38 = *((unsigned int *)t27);
    t39 = (t38 & t37);
    t40 = (t39 & 1U);
    if (t40 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t35) != 0)
        goto LAB19;

LAB20:    t42 = (t24 + 4);
    t43 = *((unsigned int *)t24);
    t44 = *((unsigned int *)t42);
    t45 = (t43 || t44);
    if (t45 > 0)
        goto LAB21;

LAB22:    t49 = *((unsigned int *)t24);
    t50 = (~(t49));
    t51 = *((unsigned int *)t42);
    t52 = (t50 || t51);
    if (t52 > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t42) > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t24) > 0)
        goto LAB27;

LAB28:    memcpy(t23, t53, 8);

LAB29:    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t16, 32, t23, 32);
    goto LAB16;

LAB14:    memcpy(t3, t16, 8);
    goto LAB16;

LAB17:    *((unsigned int *)t24) = 1;
    goto LAB20;

LAB19:    t41 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t41) = 1;
    goto LAB20;

LAB21:    t47 = (t0 + 1048U);
    t48 = *((char **)t47);
    t47 = ((char*)((ng2)));
    xsi_vlogtype_concat(t46, 32, 32, 2U, t47, 16, t48, 16);
    goto LAB22;

LAB23:    t54 = (t0 + 1048U);
    t55 = *((char **)t54);
    t54 = ((char*)((ng1)));
    xsi_vlogtype_concat(t53, 32, 32, 2U, t54, 16, t55, 16);
    goto LAB24;

LAB25:    xsi_vlog_unsigned_bit_combine(t23, 32, t46, 32, t53, 32);
    goto LAB29;

LAB27:    memcpy(t23, t46, 8);
    goto LAB29;

}


extern void work_m_00000000003958354896_1252407768_init()
{
	static char *pe[] = {(void *)Cont_27_0};
	xsi_register_didat("work_m_00000000003958354896_1252407768", "isim/TestBench_isim_beh.exe.sim/work/m_00000000003958354896_1252407768.didat");
	xsi_register_executes(pe);
}
