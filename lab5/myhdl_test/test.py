from myhdl import *

@block
def Greatest_common_divisor(start, a, b, clk, rst_n, gcd, done):

    state = Signal(modbv(0, min=0, max=4))
    A = Signal(modbv(0)[16:])
    B = Signal(modbv(0)[16:])

    @always_seq(clk.posedge, reset=rst_n)
    def logic():
        if (state == 0):
            gcd.next = 0
            done.next = 0
            if (start == 1):
                state.next = 1
                A.next = a
                B.next = b
            else:
                state.next = 0
        elif (state == 1):
            gcd.next = 0
            done.next = 0
            if (A == 0):
                state.next = 2
                done.next = 1
                gcd.next = B
            else:
                if (B == 0):
                    state.next = 2
                    done.next = 1
                    gcd.next = A
                else:
                    state.next = 2
                    if (A > B):
                        A.next = A-B
                    else:
                        B.next = B-A
        elif (state == 2):
            state.next = 3
        elif (state == 3):
            state.next = 0
            
    return logic

def convertG(hdl, width=16):
    start = Signal(bool())
    a, b = [Signal(modbv(0)[width:]) for i in range(2)]
    clk = Signal(bool())
    rst_n = ResetSignal(0, active=0, isasync=False)
    gcd = Signal(modbv(0)[width:])
    done = Signal(bool())
    inst = Greatest_common_divisor(start, a, b, clk, rst_n, gcd, done)
    inst.convert(hdl)

convertG(hdl='Verilog')
