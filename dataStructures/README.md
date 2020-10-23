# Table of Contents

1. [QuickSort vs MergeSort](#qsvsms)
   1. [Cache locality of quicksort](#qsort-cache-locality)



# QuickSort vs MergeSort<a name="qsvsms"></a>

| Quicksort                                                    | MergeSort                                                    |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| average time = O(nlogn), worst-case = O(n^2)                 | average and worst = O(nlogn)                                 |
| works better with **small** datasets                         | works better with large datasets                             |
| can occur in place, but recursive stack does consume space, however iterative version can be very well used | we still require  2 **additional** arrays, even in the iterative case of merge sort |
| unstable sort, usually                                       | stable sort(elements of same value appear in the same order in the sorted array, as they did in the unsorted array) |
| preferred for arrays                                         | preferred for linked lists                                   |
| exhibits good cache locality, hence faster than mergeSort(in virtual memory environment, in practice, but theoretically , by time complexity deduction, mergeSort is faster).<br />Cache benefits from multiple accesses to the same place in the memory, since only the first access needs to be actually taken from the memory - the rest of the accesses are taken from cache, which is much faster the access to memory. | better for when data is stored on slow-to-access media such as disk storage or network attached storage.<br /><br />Merge sort for instance - needs much more memory [RAM] accesses - since every accessory array you create - is accessing the RAM again. |
| sort in STL library for cpp, partly quicksort and partly heap sort. |                                                              |



## Efficiency of quicksort in using cache<a name="qsort-cache-locality"></a>

1. running time practically is O(n/Blog(n/B)), B = block size(4kB usually)
   1. it linearly scans and linearly partitions the input.
   2. This means we can make the most of every cache load we do as we read every number we load into the cache before swapping that cache for another. 
   3. In particular, the algorithm is cache-oblivious(doesn't matter if cache exists), which gives good cache performance for every cache level, which is another win.
2. heapsort doesn't access the cache in any efficient manner