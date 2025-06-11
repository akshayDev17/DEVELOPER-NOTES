import heapq

def custom_heapify_strings(strings):
    # Create tuples: (length, string, original_string)
    # The third element preserves the original for extraction
    heap_data = [(len(s), s, s) for s in strings]
    heapq.heapify(heap_data)
    return heap_data

# Example usage
strings = ["apple", "cat", "banana", "dog", "elephant"]
heap = custom_heapify_strings(strings)
print("Heapified:", heap)

# Extract in priority order
while heap:
    length, alphabetical, original = heapq.heappop(heap)
    print(f"'{original}' (length: {length})")