#include "Vsinegen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "vbuddy.cpp"

int main(int argc, char **argv, char **env) {
    int i; 
    
    vluint64_t sim_time = 0; 

    Verilated::commandArgs(argc, argv);
    
    Vsinegen* top = new Vsinegen;

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);
    tfp->open ("sinegen.vcd");

    if(vbdOpen()!=1) return(-1);
    vbdHeader("Lab 2: Sinegen");

    top->clk = 1;
    top->rst = 1;
    top->en = 0;
    top->incr = 1;

    for(i=0; i<3000; i++) {

        top->eval();
        if (tfp) tfp->dump(sim_time); 

        top->clk = 0;
        sim_time++;
        top->eval();
        if (tfp) tfp->dump(sim_time); 
        
        top->clk = 1;
        sim_time++;
        top->eval();
        if (tfp) tfp->dump(sim_time); 
        
        vbdPlot(int(top->dout), 0, 255);

        top->rst = (i<2); 
        
        top->en = vbdFlag();

        if ((Verilated::gotFinish()) || (vbdGetkey()=='q')) 
            break;

    }

    vbdClose();
    tfp->close();
   
    top->eval();
    if (tfp) tfp->dump(sim_time); 
    
    exit(0);
}
