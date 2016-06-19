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
static const char *ng0 = "C:/Users/easy/Documents/Xilinx/COLAB5/TestBench.v";
static int ng1[] = {0, 0};
static const char *ng2 = "ICACHE.txt";
static const char *ng3 = "DCACHE.txt";
static int ng4[] = {1, 0};
static unsigned int ng5[] = {0U, 0U};
static const char *ng6 = "%h\n";



static void Initial_13_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(13, ng0);

LAB4:    xsi_set_current_line(14, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1288);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(15, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(16, ng0);
    *((int *)t4) = xsi_vlogfile_file_open_of_cname(ng2);
    t2 = (t4 + 4);
    *((int *)t2) = 0;
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    xsi_set_current_line(17, ng0);
    *((int *)t4) = xsi_vlogfile_file_open_of_cname(ng3);
    t2 = (t4 + 4);
    *((int *)t2) = 0;
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    xsi_set_current_line(19, ng0);
    t2 = (t0 + 2496);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(21, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(22, ng0);
    t2 = (t0 + 2496);
    xsi_process_wait(t2, 20000000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(22, ng0);

LAB7:    xsi_set_current_line(23, ng0);
    t3 = (t0 + 1608);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_fclose(*((unsigned int *)t6));
    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    xsi_vlogfile_fclose(*((unsigned int *)t5));
    xsi_set_current_line(25, ng0);
    xsi_vlog_stop(1);
    goto LAB1;

}

static void Always_29_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 2936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 2744);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 1288);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 1288);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Always_31_2(char *t0)
{
    char t8[8];
    char t37[8];
    char t38[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;

LAB0:    t1 = (t0 + 3184U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 3504);
    *((int *)t2) = 1;
    t3 = (t0 + 3216);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(31, ng0);

LAB5:    xsi_set_current_line(33, ng0);
    t4 = (t0 + 5084);
    t5 = *((char **)t4);
    t6 = ((((char*)(t5))) + 40U);
    t7 = *((char **)t6);
    t6 = ((char*)((ng5)));
    memset(t8, 0, 8);
    t9 = (t7 + 4);
    t10 = (t6 + 4);
    t11 = *((unsigned int *)t7);
    t12 = *((unsigned int *)t6);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB6:    if (t20 != 0)
        goto LAB8;

LAB9:    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB10;

LAB11:
LAB12:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 5148);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    memset(t8, 0, 8);
    t4 = (t5 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (~(t11));
    t13 = *((unsigned int *)t5);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t4) != 0)
        goto LAB15;

LAB16:    t7 = (t8 + 4);
    t16 = *((unsigned int *)t8);
    t17 = (!(t16));
    t18 = *((unsigned int *)t7);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB17;

LAB18:    memcpy(t38, t8, 8);

LAB19:    t36 = (t38 + 4);
    t58 = *((unsigned int *)t36);
    t59 = (~(t58));
    t60 = *((unsigned int *)t38);
    t61 = (t60 & t59);
    t62 = (t61 != 0);
    if (t62 > 0)
        goto LAB27;

LAB28:
LAB29:    goto LAB2;

LAB7:    *((unsigned int *)t8) = 1;
    goto LAB9;

LAB8:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(34, ng0);
    t30 = (t0 + 1608);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t33 = (t0 + 5108);
    t34 = *((char **)t33);
    t35 = ((((char*)(t34))) + 40U);
    t36 = *((char **)t35);
    xsi_vlogfile_fwrite(*((unsigned int *)t32), 1, 0, 0, ng6, 2, t0, (char)118, t36, 32);
    goto LAB12;

LAB13:    *((unsigned int *)t8) = 1;
    goto LAB16;

LAB15:    t6 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t6) = 1;
    goto LAB16;

LAB17:    t9 = (t0 + 5188);
    t10 = *((char **)t9);
    t23 = ((((char*)(t10))) + 40U);
    t24 = *((char **)t23);
    memset(t37, 0, 8);
    t23 = (t24 + 4);
    t20 = *((unsigned int *)t23);
    t21 = (~(t20));
    t22 = *((unsigned int *)t24);
    t25 = (t22 & t21);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t23) != 0)
        goto LAB22;

LAB23:    t27 = *((unsigned int *)t8);
    t28 = *((unsigned int *)t37);
    t29 = (t27 | t28);
    *((unsigned int *)t38) = t29;
    t31 = (t8 + 4);
    t32 = (t37 + 4);
    t33 = (t38 + 4);
    t39 = *((unsigned int *)t31);
    t40 = *((unsigned int *)t32);
    t41 = (t39 | t40);
    *((unsigned int *)t33) = t41;
    t42 = *((unsigned int *)t33);
    t43 = (t42 != 0);
    if (t43 == 1)
        goto LAB24;

LAB25:
LAB26:    goto LAB19;

LAB20:    *((unsigned int *)t37) = 1;
    goto LAB23;

LAB22:    t30 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB23;

LAB24:    t44 = *((unsigned int *)t38);
    t45 = *((unsigned int *)t33);
    *((unsigned int *)t38) = (t44 | t45);
    t34 = (t8 + 4);
    t35 = (t37 + 4);
    t46 = *((unsigned int *)t34);
    t47 = (~(t46));
    t48 = *((unsigned int *)t8);
    t49 = (t48 & t47);
    t50 = *((unsigned int *)t35);
    t51 = (~(t50));
    t52 = *((unsigned int *)t37);
    t53 = (t52 & t51);
    t54 = (~(t49));
    t55 = (~(t53));
    t56 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t56 & t54);
    t57 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t57 & t55);
    goto LAB26;

LAB27:    xsi_set_current_line(38, ng0);
    t63 = (t0 + 1768);
    t64 = (t63 + 56U);
    t65 = *((char **)t64);
    t66 = (t0 + 5220);
    t67 = *((char **)t66);
    t68 = ((((char*)(t67))) + 40U);
    t69 = *((char **)t68);
    xsi_vlogfile_fwrite(*((unsigned int *)t65), 1, 0, 0, ng6, 2, t0, (char)118, t69, 32);
    goto LAB29;

}


extern void work_m_00000000004240661720_0924759715_init()
{
	static char *pe[] = {(void *)Initial_13_0,(void *)Always_29_1,(void *)Always_31_2};
	xsi_register_didat("work_m_00000000004240661720_0924759715", "isim/TestBench_isim_beh.exe.sim/work/m_00000000004240661720_0924759715.didat");
	xsi_register_executes(pe);
}
