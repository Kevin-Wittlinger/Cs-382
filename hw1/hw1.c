#include <stdio.h>

/*
   Kevin Wittlinger
   I pledge my honor that I have abided by the Stevens Honor System.
   Insertion sort
   Used for loops for task 3
*/

void copy_str(char *src, char *dst)
{
    // setting pointers to strings*
    char *src_ptr = src; // pointer to source string
    char *dst_ptr = dst; // pointer to destination string

// starting copy
copy:
    // if current source character is not null
    if (*src_ptr != '\0')
    {
        *dst_ptr = *src_ptr; // copy current char from source to desimation
        src_ptr++;           // iterate through every char in source
        dst_ptr++;           // iterate through every char in destination
        goto copy;           // jump back to copy:
    }
    *dst_ptr = '\0'; // if its null input 0
}

int dot_prod(char *vec_a, char *vec_b, int length, int size_elem)
{

    int result = 0; // store the dot product
    int count = 0;  // loop counter

    if (count < length)
    {
        goto vector;
    }

vector: // starts the dot product calculation
    if (count < length)
    {                                                    // if there more elements then continue processing
        int a = *((int *)(vec_a + (size_elem * count))); // retrieves the value of element a from the array vec_a
        int b = *((int *)(vec_b + (size_elem * count))); // retrieves the value of element b from the array vec_b
        result += a * b;                                 // adds the product of both a and b sets as result
        count++;                                         // iterates through
        goto vector;                                     // loops through the if statement
    }
    return result; // returns the result
}

void sort_nib(int *arr, int length)
{
    char nibs[length * 8]; // Each integer has 8 nibbles

    // extract nibbles and store them in an array
    for (int i = 0; i < length; i++) // loop for every input in the array
    {
        for (int j = 0; j < 8; j++) // loop for every 8 nibbles in an integer
        {
            nibs[i * 8 + j] = (arr[i] >> (4 * (7 - j))) & 0xF; // extract the j-th nibble and store in nibs array
        }
    }

    // Sort the nibs using Insertion Sort
    for (int i = 1; i < length * 8; i++) // Loop over all nibbles
    {
        char compare = nibs[i];             // curent nibble is the compare char for later
        int j = i - 1;                      // start with the nibble before
        while (j >= 0 && nibs[j] > compare) // move elements of nibs > compare infornt of current position
        {
            nibs[j + 1] = nibs[j]; // shift element to right
            j = j - 1;             // move to previous element
        }
        nibs[j + 1] = compare; // place compare into its open slot
    }

    // turns nibbles back into integers and replaces them in arr
    for (int i = 0; i < length; i++) // Loop over the array
    {
        arr[i] = 0;                 // set first iteration to 0
        for (int j = 0; j < 8; j++) // Loop over 8 nibbles in int
        {
            arr[i] |= (nibs[i * 8 + j] & 0xF) << (4 * (7 - j)); // combine sorted nibbles and newly formed integers into arr
        }
    }
}

int main(int argc, char **argv)
{

    /**
     * Task 1
     */

    char str1[] = "382 is the best!";
    char str2[100] = {0};

    copy_str(str1, str2);
    puts(str1);
    puts(str2);

    /**
     * Task 2
     */

    int vec_a[3] = {12, 34, 10};
    int vec_b[3] = {10, 20, 30};
    int dot = dot_prod((char *)vec_a, (char *)vec_b, 3, sizeof(int));

    printf("%d\n", dot);

    /**
     * Task 3
     */

    int arr[3] = {0x12BFDA09, 0x9089CDBA, 0x56788910};
    sort_nib(arr, 3);
    for (int i = 0; i < 3; i++)
    {
        printf("0x%08x ", arr[i]);
    }
    puts(" ");

    return 0;
}
