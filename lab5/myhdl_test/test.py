from myhdl import *

@block
def Greatest_common_divisor(start, a, b, clk, rst_n, gcd, done):

    state = Signal(modbv(0, min=0, max=4))
    A = Signal(modbv(0)[16:])
    B = Signal(modbv(0)[16:])
    next_A = Signal(modbv(0)[16:])
    next_B = Signal(modbv(0)[16:])
    next_gcd = Signal(modbv(0)[16:])
    next_done = Signal(modbv(0))

    @always_comb
    def logic0():
        if (state == 0):
            next_gcd.next = 0
            next_done.next = 0
            if (start == 1):
                next_state.next = 1
                next_A.next = a
                next_B.next = b
            else:
                next_state.next = 0
        elif (state == 1):
            if (A == 0):
                next_state.next = 2
                next_done.next = 1
                next_gcd.next = B
            else:
                if (B == 0):
                    next_state = 2
                    next_done = 1
                    next_gcd = A
                else:
                    next_state = 1
                    if (A > B):
                        next_A = A-B
                        next_B = B
                    else:
                        next_B = B-A
                        next_A = A
        elif (state == 2):
            next_state = 3
        elif (state == 3):
            next_state = 0
            next_gcd = 0
            next_done = 0

    @always_seq(clk.posedge, reset=rst_n)
    def logic1():
        state.next = next_state
        gcd.next = next_gcd
        done.next = next_done
        A.next = next_A
        B.next = next_B

    return logic0, logic1

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
