import heapq
from functools import total_ordering

@total_ordering
class MaxHeapPair:
    def __init__(self, pair):
        self.first = pair[0]
        self.second = pair[1]
        self.pair = pair
    
    def __lt__(self, other):
        """
        Implement REVERSE comparison for max-heap behavior.
        This pair is "less than" other if it should come AFTER other in max-heap.
        """
        # Compare first elements (reverse for max-heap)
        if self.first != other.first:
            return self.first > other.first  # Reverse: smaller first = "greater" in min-heap
        # If first elements equal, compare second elements (reverse for max-heap)
        return self.second > other.second
    
    def __eq__(self, other):
        return self.first == other.first and self.second == other.second
    
    def __repr__(self):
        return f"MaxHeapPair({self.pair})"

def create_max_heap_with_class(pairs):
    """Create max heap using custom class"""
    heap = [MaxHeapPair(pair) for pair in pairs]
    heapq.heapify(heap)
    return heap

# Example usage
pairs = [(3, 5), (1, 8), (3, 2), (7, 1), (3, 5), (2, 9)]
print("Original pairs:", pairs)

max_heap = create_max_heap_with_class(pairs)
print("Max heap:", max_heap)

print("\nExtracting in max order:")
while max_heap:
    max_item = heapq.heappop(max_heap)
    print(f"Max pair: {max_item.pair}")

# Demonstrate push
print("\n--- Demonstrating push with custom class ---")
new_heap = create_max_heap_with_class([(1, 2), (3, 4)])
heapq.heappush(new_heap, MaxHeapPair((5, 1)))
heapq.heappush(new_heap, MaxHeapPair((3, 6)))

print("After pushing (5,1) and (3,6):")
while new_heap:
    item = heapq.heappop(new_heap)
    print(f"Popped: {item.pair}")