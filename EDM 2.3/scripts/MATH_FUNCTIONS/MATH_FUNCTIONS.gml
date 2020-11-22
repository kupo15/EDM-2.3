
function round_tenth(n) {
/// @param number

n *= 10;
n = round(n);
n /= 10;

return n;
}
