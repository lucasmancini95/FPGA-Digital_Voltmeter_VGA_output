/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_199(char*, char *);
extern void execute_200(char*, char *);
extern void execute_201(char*, char *);
extern void execute_127(char*, char *);
extern void execute_124(char*, char *);
extern void execute_125(char*, char *);
extern void execute_126(char*, char *);
extern void execute_89(char*, char *);
extern void execute_20(char*, char *);
extern void execute_21(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_35(char*, char *);
extern void execute_36(char*, char *);
extern void execute_42(char*, char *);
extern void execute_43(char*, char *);
extern void execute_49(char*, char *);
extern void execute_50(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_63(char*, char *);
extern void execute_64(char*, char *);
extern void execute_70(char*, char *);
extern void execute_71(char*, char *);
extern void execute_77(char*, char *);
extern void execute_78(char*, char *);
extern void execute_84(char*, char *);
extern void execute_85(char*, char *);
extern void execute_23(char*, char *);
extern void execute_91(char*, char *);
extern void execute_123(char*, char *);
extern void execute_93(char*, char *);
extern void execute_94(char*, char *);
extern void execute_96(char*, char *);
extern void execute_97(char*, char *);
extern void execute_99(char*, char *);
extern void execute_100(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_105(char*, char *);
extern void execute_106(char*, char *);
extern void execute_108(char*, char *);
extern void execute_109(char*, char *);
extern void execute_111(char*, char *);
extern void execute_112(char*, char *);
extern void execute_114(char*, char *);
extern void execute_115(char*, char *);
extern void execute_117(char*, char *);
extern void execute_118(char*, char *);
extern void execute_120(char*, char *);
extern void execute_121(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_3(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[53] = {(funcp)execute_199, (funcp)execute_200, (funcp)execute_201, (funcp)execute_127, (funcp)execute_124, (funcp)execute_125, (funcp)execute_126, (funcp)execute_89, (funcp)execute_20, (funcp)execute_21, (funcp)execute_28, (funcp)execute_29, (funcp)execute_35, (funcp)execute_36, (funcp)execute_42, (funcp)execute_43, (funcp)execute_49, (funcp)execute_50, (funcp)execute_56, (funcp)execute_57, (funcp)execute_63, (funcp)execute_64, (funcp)execute_70, (funcp)execute_71, (funcp)execute_77, (funcp)execute_78, (funcp)execute_84, (funcp)execute_85, (funcp)execute_23, (funcp)execute_91, (funcp)execute_123, (funcp)execute_93, (funcp)execute_94, (funcp)execute_96, (funcp)execute_97, (funcp)execute_99, (funcp)execute_100, (funcp)execute_102, (funcp)execute_103, (funcp)execute_105, (funcp)execute_106, (funcp)execute_108, (funcp)execute_109, (funcp)execute_111, (funcp)execute_112, (funcp)execute_114, (funcp)execute_115, (funcp)execute_117, (funcp)execute_118, (funcp)execute_120, (funcp)execute_121, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_3};
const int NumRelocateId= 53;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/VGA_H_sync_tb_behav/xsim.reloc",  (void **)funcTab, 53);
	iki_vhdl_file_variable_register(dp + 11552);
	iki_vhdl_file_variable_register(dp + 11608);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/VGA_H_sync_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/VGA_H_sync_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/VGA_H_sync_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/VGA_H_sync_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/VGA_H_sync_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
