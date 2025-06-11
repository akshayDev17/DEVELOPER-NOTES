import heapq

class StringWithCustomPriority:
    def __init__(self, string):
        self.string = string
        self.length = len(string)
    
    def __lt__(self, other):
        # Primary: compare by length
        if self.length != other.length:
            return self.length < other.length
        # Secondary: compare alphabetically
        return self.string < other.string
    
    def __eq__(self, other):
        return self.length == other.length and self.string == other.string
    
    def __repr__(self):
        return f"StringWithCustomPriority('{self.string}')"

# Usage
strings = ["apple", "cat", "banana", "dog", "elephant"]
heap = [StringWithCustomPriority(s) for s in strings]
heapq.heapify(heap)

print("Heapified:", heap)

while heap:
    item = heapq.heappop(heap)
    print(f"'{item.string}' (length: {item.length})")