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
extern void execute_525(char*, char *);
extern void execute_526(char*, char *);
extern void execute_527(char*, char *);
extern void execute_528(char*, char *);
extern void execute_15(char*, char *);
extern void execute_16(char*, char *);
extern void execute_69(char*, char *);
extern void execute_121(char*, char *);
extern void execute_173(char*, char *);
extern void execute_225(char*, char *);
extern void execute_18(char*, char *);
extern void execute_19(char*, char *);
extern void execute_20(char*, char *);
extern void execute_52(char*, char *);
extern void execute_25(char*, char *);
extern void execute_26(char*, char *);
extern void execute_33(char*, char *);
extern void execute_34(char*, char *);
extern void execute_40(char*, char *);
extern void execute_41(char*, char *);
extern void execute_47(char*, char *);
extern void execute_48(char*, char *);
extern void execute_28(char*, char *);
extern void execute_54(char*, char *);
extern void execute_68(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_65(char*, char *);
extern void execute_66(char*, char *);
extern void execute_450(char*, char *);
extern void execute_446(char*, char *);
extern void execute_447(char*, char *);
extern void execute_280(char*, char *);
extern void execute_330(char*, char *);
extern void execute_282(char*, char *);
extern void execute_283(char*, char *);
extern void execute_285(char*, char *);
extern void execute_286(char*, char *);
extern void execute_288(char*, char *);
extern void execute_289(char*, char *);
extern void execute_291(char*, char *);
extern void execute_292(char*, char *);
extern void execute_294(char*, char *);
extern void execute_295(char*, char *);
extern void execute_297(char*, char *);
extern void execute_298(char*, char *);
extern void execute_300(char*, char *);
extern void execute_301(char*, char *);
extern void execute_303(char*, char *);
extern void execute_304(char*, char *);
extern void execute_306(char*, char *);
extern void execute_307(char*, char *);
extern void execute_309(char*, char *);
extern void execute_310(char*, char *);
extern void execute_312(char*, char *);
extern void execute_313(char*, char *);
extern void execute_315(char*, char *);
extern void execute_316(char*, char *);
extern void execute_318(char*, char *);
extern void execute_319(char*, char *);
extern void execute_321(char*, char *);
extern void execute_322(char*, char *);
extern void execute_324(char*, char *);
extern void execute_325(char*, char *);
extern void execute_327(char*, char *);
extern void execute_328(char*, char *);
extern void execute_445(char*, char *);
extern void execute_334(char*, char *);
extern void execute_335(char*, char *);
extern void execute_342(char*, char *);
extern void execute_343(char*, char *);
extern void execute_349(char*, char *);
extern void execute_350(char*, char *);
extern void execute_356(char*, char *);
extern void execute_357(char*, char *);
extern void execute_363(char*, char *);
extern void execute_364(char*, char *);
extern void execute_370(char*, char *);
extern void execute_371(char*, char *);
extern void execute_377(char*, char *);
extern void execute_378(char*, char *);
extern void execute_384(char*, char *);
extern void execute_385(char*, char *);
extern void execute_391(char*, char *);
extern void execute_392(char*, char *);
extern void execute_398(char*, char *);
extern void execute_399(char*, char *);
extern void execute_405(char*, char *);
extern void execute_406(char*, char *);
extern void execute_412(char*, char *);
extern void execute_413(char*, char *);
extern void execute_419(char*, char *);
extern void execute_420(char*, char *);
extern void execute_426(char*, char *);
extern void execute_427(char*, char *);
extern void execute_433(char*, char *);
extern void execute_434(char*, char *);
extern void execute_440(char*, char *);
extern void execute_441(char*, char *);
extern void execute_449(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[106] = {(funcp)execute_525, (funcp)execute_526, (funcp)execute_527, (funcp)execute_528, (funcp)execute_15, (funcp)execute_16, (funcp)execute_69, (funcp)execute_121, (funcp)execute_173, (funcp)execute_225, (funcp)execute_18, (funcp)execute_19, (funcp)execute_20, (funcp)execute_52, (funcp)execute_25, (funcp)execute_26, (funcp)execute_33, (funcp)execute_34, (funcp)execute_40, (funcp)execute_41, (funcp)execute_47, (funcp)execute_48, (funcp)execute_28, (funcp)execute_54, (funcp)execute_68, (funcp)execute_56, (funcp)execute_57, (funcp)execute_59, (funcp)execute_60, (funcp)execute_62, (funcp)execute_63, (funcp)execute_65, (funcp)execute_66, (funcp)execute_450, (funcp)execute_446, (funcp)execute_447, (funcp)execute_280, (funcp)execute_330, (funcp)execute_282, (funcp)execute_283, (funcp)execute_285, (funcp)execute_286, (funcp)execute_288, (funcp)execute_289, (funcp)execute_291, (funcp)execute_292, (funcp)execute_294, (funcp)execute_295, (funcp)execute_297, (funcp)execute_298, (funcp)execute_300, (funcp)execute_301, (funcp)execute_303, (funcp)execute_304, (funcp)execute_306, (funcp)execute_307, (funcp)execute_309, (funcp)execute_310, (funcp)execute_312, (funcp)execute_313, (funcp)execute_315, (funcp)execute_316, (funcp)execute_318, (funcp)execute_319, (funcp)execute_321, (funcp)execute_322, (funcp)execute_324, (funcp)execute_325, (funcp)execute_327, (funcp)execute_328, (funcp)execute_445, (funcp)execute_334, (funcp)execute_335, (funcp)execute_342, (funcp)execute_343, (funcp)execute_349, (funcp)execute_350, (funcp)execute_356, (funcp)execute_357, (funcp)execute_363, (funcp)execute_364, (funcp)execute_370, (funcp)execute_371, (funcp)execute_377, (funcp)execute_378, (funcp)execute_384, (funcp)execute_385, (funcp)execute_391, (funcp)execute_392, (funcp)execute_398, (funcp)execute_399, (funcp)execute_405, (funcp)execute_406, (funcp)execute_412, (funcp)execute_413, (funcp)execute_419, (funcp)execute_420, (funcp)execute_426, (funcp)execute_427, (funcp)execute_433, (funcp)execute_434, (funcp)execute_440, (funcp)execute_441, (funcp)execute_449, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_1};
const int NumRelocateId= 106;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/ADC_tb_behav/xsim.reloc",  (void **)funcTab, 106);
	iki_vhdl_file_variable_register(dp + 26280);
	iki_vhdl_file_variable_register(dp + 26336);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/ADC_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/ADC_tb_behav/xsim.reloc");
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
    iki_set_sv_type_file_path_name("xsim.dir/ADC_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/ADC_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/ADC_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
