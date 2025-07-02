// Copyright 2022 Thales DIS SAS
// Copyright 2024 CoreLab Tech
//
// Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.0
// You may obtain a copy of the License at https://solderpad.org/licenses/
//
// Original Author: Alae Eddine EZ ZEJJARI (alae-eddine.ez-zejjari@external.thalesgroup.com) – sub-contractor MU-Electronics for Thales group

`ifndef __UVMA_AXI_CNTXT_SV__
`define __UVMA_AXI_CNTXT_SV__

/**
 * Object encapsulating all state variables for all AXI agent
 * (uvma_axi_agent_c) components.
 */
class uvma_axi_cntxt_c extends uvm_object;

   // Handle to agent interface
   virtual uvma_axi_intf  axi_vi;
   virtual uvma_axi_mst_intf  axi_mst_vi;

   // Handle to memory storage for active slaves
   uvml_mem_c#(MAX_ADDR_WIDTH) mem;

   uvma_axi_reset_state_enum  reset_state = UVMA_AXI_RESET_STATE_PRE_RESET;

   `uvm_object_utils_begin(uvma_axi_cntxt_c)
      `uvm_field_enum(uvma_axi_reset_state_enum, reset_state, UVM_DEFAULT)
      `uvm_field_object(mem, UVM_DEFAULT)
   `uvm_object_utils_end
   /**
    * Builds events.
    */
   extern function new(string name = "uvma_axi_cntxt");

endclass : uvma_axi_cntxt_c


function uvma_axi_cntxt_c::new(string name = "uvma_axi_cntxt");

   super.new(name);
   mem = uvml_mem_c#(MAX_ADDR_WIDTH)::type_id::create("mem");

endfunction : new

`endif // __UVMA_AXI_CNTXT_SV__
