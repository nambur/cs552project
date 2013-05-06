lbi r0, U.Here
slbi r0, L.Here   // r0 contains address of ".Here"
lbi r1, U.There
slbi r1, L.There  // r1 contains address of ".There"

lbi r2, 7         // r2 = 7
st r2, r0, 0      // .Here = 7
ld r3, r0, 0      // r3 = 7

lbi r4, -7        // r4 = -7
st r4, r0, 4      // .Here+2 = -7
addi r0, r0, 4    // r0 = .Here+2
ld r5, r0, 0      // r5 = -7

addi r2, r2, 8    // r2 = 0x000f
st r2, r0, -2     // .Here-1 = 15

halt
halt
halt
halt
halt

// Some empty memory to play around in:
.Here:

halt
halt
halt
halt

// Another address:
.There:

halt
halt
halt
halt
halt
halt
halt
halt
halt
halt
