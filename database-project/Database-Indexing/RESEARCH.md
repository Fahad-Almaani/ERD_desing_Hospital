# Database Indexing 


### What is database indexing 
Data base indexing is a technique used to speed up the lookup for row by a specific column 
it is a separate data structure that will represent a pointers to the data that allow the database engin to find the rows significantly faster.


### How It
Most database use structure called a B-Tree(Balanced Tree) for indexing.
when you create an index on a certain column for example `last_name` the database wil create a tree-like map where the names are stored. instead of going to the rows the database follows the branches based on whether the name you'r looking for is alphabetically higher or lower than the current node.


## Trade-off
from my understanding an Index will require an extra insertion process when ever you create a new recorded in a table that have index of a column you will need to insert in the table and update the tree also to keep the tree accurate that make slower writes.
Additionally the will be some Disk Space extra usage by the indexes because they are a separate files, and adding indexes for every column in a table can result in index files becoming bigger that the actual data.


## conclusion 
If Speed critical for the application then database indexing is a good choice for faster lookup query.