/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/
/*
  Vaibhav Ramachandran
  ramachav@purdue.edu
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;

assign ccif.iload = ccif.ramload;
assign ccif.dload = ccif.ramload;

//when (dWEN | dREN), iwait = 1 and dwait = 0 (data is given higher priority as
//compared to the instruction, second stage of a load instruction) else dwait is
//1
assign ccif.dwait = ~((ccif.ramstate == ACCESS) & (ccif.dREN | ccif.dWEN));
//when !dWEN & !dREN & iREN, iwait = 0 and dwait = 1 (here there is no data
//fetch that needs to occur so the instruction is executed) else iwait is 1
assign ccif.iwait = ~((ccif.ramstate == ACCESS) & (~ccif.dREN & ~ccif.dWEN & ccif.iREN));
//ramWEN is simply a passthrough since there is no other WEN. writing is given
//higher precedence over reading if both are asserted simultaneously
assign ccif.ramWEN = ccif.dWEN;
//ramREN = 1 when the dWEN signal is 0 and when either one of the two REN
//signals are asserted, done to prevent both writing and reading simultaneously
assign ccif.ramREN = (ccif.dREN | ccif.iREN) & ~ccif.dWEN;
assign ccif.ramstore = ccif.dstore;
//ramaddr equals daddr or iaddr depending on the value of the RENs and WEN so
//that it accesses the right address location
assign ccif.ramaddr = (~ccif.dREN & ~ccif.dWEN & ccif.iREN)? ccif.iaddr : ccif.daddr;

endmodule
