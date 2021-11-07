/************************************************************************
Avalon-MM Interface for AES Decryption IP Core
Dong Kai Wang, Fall 2017
For use with ECE 385 Experiment 9
University of Illinois ECE Department
Register Map:
 0-3 : 4x 32bit AES Key
 4-7 : 4x 32bit AES Encrypted Message
 8-11: 4x 32bit AES Decrypted Message
   12: Not Used
	13: Not Used
   14: 32bit Start Register
   15: 32bit Done Register
************************************************************************/
/*
Module: avalon_aes_interface (avalon_aes_interface.sv)
	Inputs: CLK, RESET, AVL_READ, AVL_WRITE, AVL_CS,
			  ([3:0] AVL_BYTE_EN, AVL_ADDR), [31:0] AVL_WRITE_DATA
Outputs: ([31:0] AVL_READ_DATA, EXPORT_DAATA)
Description: This is the AVALON-MM Interface that is used for the AES Decryption Core.
				 A register system containing 16 32-bit registers is created, and the registers
				 hold information on the AES Key (0-3), Encrypted (4-7) and Decrypted (8-11) Messages,
				 as well as start and end addresses (14-15). This module takes information from the
				 AVL input variables to determine what should be loaded in or read from the registers.
Purpose: As explained in the description section, the purpose of this module is to be the
   interface between the hardware and software via the AES Decryption core from the QSys file.
	It allows encryption and decryption information to be displayed on the board.
*/
module avalon_aes_interface (
	// Avalon Clock Input
	input logic CLK,

	// Avalon Reset Input
	input logic RESET,

	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [3:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data

	// Exported Conduit
	output logic [31:0] EXPORT_DATA		// Exported Conduit Signal to LEDs
);

// 16 32-bit registers
logic [31:0] reg_sys [15:0];

logic aes_done_local;
logic [127:0] aes_msg_dec_local, key_holder, msg_enc_holder;

// holds the key
assign key_holder = { reg_sys[0], reg_sys[1], reg_sys[2], reg_sys[3] };

// holds the encrypted essage
assign msg_enc_holder = { reg_sys[4], reg_sys[5], reg_sys[6], reg_sys[7] };

// creating AES module, which has state machine in it
AES aes_0( .*, .AES_START(reg_sys[14][0]), .AES_DONE(aes_done_local),
            .AES_KEY(key_holder), .AES_MSG_ENC(msg_enc_holder), .AES_MSG_DEC(aes_msg_dec_local) );

always_ff @ (posedge CLK) begin

	 // clear all 16 registers on reset
    if(RESET) begin

        for(int i = 0; i < 16; ++i)
            reg_sys[i] <= 32'b0;

    end


	 // check each bit of byte_en and use it to write to specific bits of register system
    else if(AVL_WRITE && AVL_CS) begin

          if(AVL_BYTE_EN[3] == 1)
              reg_sys[AVL_ADDR][31:24] <= AVL_WRITEDATA[31:24];
          if(AVL_BYTE_EN[2] == 1)
              reg_sys[AVL_ADDR][23:16] <= AVL_WRITEDATA[23:16];
          if(AVL_BYTE_EN[1] == 1)
              reg_sys[AVL_ADDR][15:8] <= AVL_WRITEDATA[15:8];
          if(AVL_BYTE_EN[0] == 1)
              reg_sys[AVL_ADDR][7:0] <= AVL_WRITEDATA[7:0];

    end
	
	 // indicate that operation is done in R15 and then write decrypted message to R8-R11
	 if(aes_done_local) begin
		  reg_sys[15] <= 32'hffffffff;
	 
		  reg_sys[11] <= aes_msg_dec_local[31:0];
        reg_sys[10] <= aes_msg_dec_local[63:32];
        reg_sys[9] <= aes_msg_dec_local[95:64];
        reg_sys[8] <= aes_msg_dec_local[127:96];    

    end

end

    always_comb begin

		 // setting export_data to the first 2 B and last 2 B of key
       EXPORT_DATA = { reg_sys[0][31:16], reg_sys[3][15:0] };

		 // for reading data (decryption)
       if(AVL_READ && AVL_CS)
            AVL_READDATA = reg_sys[AVL_ADDR];
       else
            AVL_READDATA = 32'b0;

    end

endmodule