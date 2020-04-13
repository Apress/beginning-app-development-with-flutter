void main() {
List fiveTo10 = [ 5, 6, 7, 8, 9, 10, ];
// Spreading out the inner array
List numbers = [ 1, 2, 3, 4, ...fiveTo10, 11, 12];
// numbers has [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
print(numbers);
}