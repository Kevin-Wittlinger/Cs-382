// Kevin Wittlinger
// I pledge my honor that I have abided by the stevens honor code
// CS 382 LC
// Unrolled Linked List

#include "UnrolledLL.h"

uNode *new_unode(uNode **prev, u_int64_t blksize)
{
    uNode *nnode = (uNode *)malloc(sizeof(uNode *));
    nnode->next = NULL;

    /* Your code here */
    nnode->datagrp = (int *)malloc(blksize * sizeof(int));
    nnode->blksize = blksize;

    return nnode;
}

void init_ullist(UnrolledLL *ullist, u_int64_t size, u_int64_t blksize)
{
    ullist->head = NULL;
    ullist->len = 0;

    /* Your code here */
    uNode *prev = NULL;
    for (u_int64_t i = 0; i < size; i += blksize)
    {
        uNode *nnode = new_unode(&prev, blksize);
        if (prev != NULL)
        {
            prev->next = nnode;
        }
        prev = nnode;
        if (ullist->head == NULL)
        {
            ullist->head = nnode;
        }
    }
}

void iterate_ullist(uNode *uiter)
{
    while (uiter != NULL)
    {

        /* Your code here */
        for (int i = 0; i < uiter->blksize; i++)
        {
            int num = uiter->datagrp[i];
        }

        uiter = uiter->next;
    }
}

void clean_uulist(UnrolledLL *ullist)
{
    if (ullist != NULL && ullist->head != NULL)
    {
        uNode *current = ullist->head;
        uNode *next;

        while (current != NULL)
        {
            next = current->next;
            free(current->datagrp);
            free(current);
            current = next;
        }

        ullist->head = NULL;
    }
    return;
}