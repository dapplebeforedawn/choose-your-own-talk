# Working with Bytes
====================
1 bit  == either 1 or 0
1 byte == 8 bits

`1111 0001` is one byte worth of bits

> It's pretty annoying to write out long strings of bits.  Is there a shorter notation?

- Yes. We can use hexidecimal numbers (0~F) to represent each set of four bits:
  `1111` == `F`
  `0001` == `1`

## Representing Strings (ASCII)
=======================
Each character of our human alphabet we will represent with a number.
  `a`  == `98`      (base 10)
  `98` == `62`      (base 16, aka "hex")
  `62` == `1100010` (binary)

  `b`  == `99`      (base 10)
  `99` == `63`      (base 16, aka "hex")
  `63` == `1100011` (binary)

## Using `hexdump`
=======================
If you want to know numeric values for a human readable string, use `hex dump`

```bash
 echo "a" | hexdump
```

```bash
 echo "hello world" | hexdump
```
