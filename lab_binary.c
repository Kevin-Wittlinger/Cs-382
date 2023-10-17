// Kevin Wittlinger
// I pledge my honor that I have abided by the stevens honor code
//  CS 382 LC

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

void display(int8_t bit)
{
    putchar(bit + 48);
}

void display_32(int32_t num)
{
    // include a for loop looping through all 32 bits
    for (int i = 31; i >= 0; i--)
    {
        int8_t bit = (num >> i) & 1;
        display(bit);
    }
}

int main(int argc, char const *argv[])
{
    display_32(-20);
    return 0;
}